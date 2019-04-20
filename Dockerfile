FROM swift:5.0
COPY . /FitnessUnits
WORKDIR /FitnessUnits
RUN swift test
