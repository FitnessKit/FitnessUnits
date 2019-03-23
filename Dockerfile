FROM swift:4.2
COPY . /FitnessUnits
WORKDIR /FitnessUnits
RUN swift test
