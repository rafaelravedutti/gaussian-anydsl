#include <iostream>
#include <list>
#include <opencv2/core/core.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>

/* List of OpenCV matrices created for further identification by address */
static std::list<cv::Mat> mat_list;

/* Pixel data type */
typedef double pixel_t;

/* Functions to be exported to Impala */
extern "C" {
  pixel_t *opencv_create_image(int width, int height);
  pixel_t *opencv_load_image(const char *path, int *width, int *height);
  void opencv_write_image(pixel_t *img, const char *filename);
}

/* Return the OpenCV matrice given the pixel data pointer */
cv::Mat GetImageMat(pixel_t *img, int *found) {
  /* List iterator */
  std::list<cv::Mat>::iterator mat;

  /* By default, assume as not found */
  *found = 0;

  /* Go through the OpenCV matrices list */
  for(mat = mat_list.begin(); mat != mat_list.end(); ++mat) {
    /* If the given pointer is equal than the current element pointer */
    if(mat->ptr<pixel_t>(0) == img) {
      /* Set found flag to indicate that value can be used */
      *found = 1;
      return *mat;
    }
  }

  return *mat;
}

pixel_t *opencv_load_image(const char *path, int *width, int *height) {
  /* OpenCV matrice */
  cv::Mat img_mat;

  /* Read image from the file in grayscale */
  img_mat = cv::imread(path, CV_LOAD_IMAGE_GRAYSCALE);

  /* If the data returned isn't null */
  if(img_mat.data != NULL) {
    /* Convert image data type to double (f64) */
    img_mat.convertTo(img_mat, CV_64FC1);

    /* Insert returned image dimensions to address referenced by the given pointers */
    *width = img_mat.cols;
    *height = img_mat.rows;

    /* Insert the returned matrice in the OpenCV matrices list */
    mat_list.push_back(img_mat);

    return img_mat.ptr<pixel_t>(0);
  }

  return NULL;
}

pixel_t *opencv_create_image(int width, int height) {
  /* Create an OpenCV matrice in double data type with the given dimensions */
  cv::Mat img_mat(cv::Size(width, height), CV_64FC1);

  /* If it isn't null */
  if(img_mat.data != NULL) {
    /* Insert the matrice in the OpenCV matrices list */
    mat_list.push_back(img_mat);

    return img_mat.ptr<pixel_t>(0);
  }

  return NULL;
}

void opencv_write_image(pixel_t *img, const char *filename) {
  /* OpenCV matrice */
  cv::Mat img_mat;
  /* Parameters for file compression */
  std::vector<int> compression_params;
  /* Image found in the OpenCV matrices list? */
  int found;

  /* Find the specified matrice in the list */
  img_mat = GetImageMat(img, &found);

  /* If the image is found */
  if(found != 0) {
    /* Include PNG compression in the parameters */
    compression_params.push_back(CV_IMWRITE_PNG_COMPRESSION);
    /* Set compression level to 9 */
    compression_params.push_back(9);
    /* Write the image to file using the specified parameters */
    cv::imwrite(filename, img_mat, compression_params);
  }
}
