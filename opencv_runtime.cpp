#include <iostream>
#include <list>
#include <opencv2/core/core.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>

static std::list<cv::Mat> mat_list;

typedef double pixel_t;

extern "C" {
  pixel_t *opencv_create_image(int width, int height);
  pixel_t *opencv_load_image(const char *path, int *width, int *height);
  void opencv_write_image(pixel_t *img, const char *filename);
}

cv::Mat GetImageMat(pixel_t *img, int *found) {
  std::list<cv::Mat>::iterator mat;

  *found = 0;

  for(mat = mat_list.begin(); mat != mat_list.end(); ++mat) {
    if(mat->ptr<pixel_t>(0) == img) {
      *found = 1;
      return *mat;
    }
  }

  return *mat;
}

pixel_t *opencv_load_image(const char *path, int *width, int *height) {
  cv::Mat img_mat;

  img_mat = cv::imread(path, CV_LOAD_IMAGE_GRAYSCALE);

  if(img_mat.data != NULL) {
    img_mat.convertTo(img_mat, CV_64FC1);

    *width = img_mat.cols;
    *height = img_mat.rows;

    mat_list.push_back(img_mat);
    return img_mat.ptr<pixel_t>(0);
  }

  return NULL;
}

pixel_t *opencv_create_image(int width, int height) {
  cv::Mat img_mat(cv::Size(width, height), CV_64FC1);

  if(img_mat.data != NULL) {
    mat_list.push_back(img_mat);
    return img_mat.ptr<pixel_t>(0);
  }

  return NULL;
}

void opencv_write_image(pixel_t *img, const char *filename) {
  cv::Mat img_mat;
  std::vector<int> compression_params;
  int found;

  img_mat = GetImageMat(img, &found);

  if(found != 0) {
    compression_params.push_back(CV_IMWRITE_PNG_COMPRESSION);
    compression_params.push_back(9);
    cv::imwrite(filename, img_mat, compression_params);
  }
}
