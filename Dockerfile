FROM drydock.workiva.net/workiva/dart_unit_test_image:pr-13

RUN xvfb-run -s '-screen 0 1024x768x24' pub run test --coverage=cov
RUN pub global run coverage:format_coverage -l -i cov -o lcov
ARG BUILD_ARTIFACTS_CODECOV=/build/lcov

FROM scratch
