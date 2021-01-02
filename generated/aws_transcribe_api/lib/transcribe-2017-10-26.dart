// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        timeStampFromJson,
        RfcDateTimeConverter,
        IsoDateTimeConverter,
        UnixDateTimeConverter,
        StringJsonConverter,
        Base64JsonConverter;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'transcribe-2017-10-26.g.dart';

/// Operations and objects for transcribing speech to text.
class TranscribeService {
  final _s.JsonProtocol _protocol;
  TranscribeService({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'transcribe',
            signingName: 'transcribe',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates a new custom vocabulary that you can use to change the way Amazon
  /// Transcribe handles transcription of an audio file.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [ConflictException].
  ///
  /// Parameter [languageCode] :
  /// The language code of the vocabulary entries.
  ///
  /// Parameter [vocabularyName] :
  /// The name of the vocabulary. The name must be unique within an AWS account.
  /// The name is case-sensitive.
  ///
  /// Parameter [phrases] :
  /// An array of strings that contains the vocabulary entries.
  ///
  /// Parameter [vocabularyFileUri] :
  /// The S3 location of the text file that contains the definition of the
  /// custom vocabulary. The URI must be in the same region as the API endpoint
  /// that you are calling. The general form is
  ///
  /// <code>
  /// https://s3.&lt;aws-region&gt;.amazonaws.com/&lt;bucket-name&gt;/&lt;keyprefix&gt;/&lt;objectkey&gt;
  /// </code>
  ///
  /// For example:
  ///
  /// <code>https://s3.us-east-1.amazonaws.com/examplebucket/vocab.txt</code>
  ///
  /// For more information about S3 object names, see <a
  /// href="http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#object-keys">Object
  /// Keys</a> in the <i>Amazon S3 Developer Guide</i>.
  ///
  /// For more information about custom vocabularies, see <a
  /// href="http://docs.aws.amazon.com/transcribe/latest/dg/how-it-works.html#how-vocabulary">Custom
  /// Vocabularies</a>.
  Future<CreateVocabularyResponse> createVocabulary({
    @_s.required LanguageCode languageCode,
    @_s.required String vocabularyName,
    List<String> phrases,
    String vocabularyFileUri,
  }) async {
    ArgumentError.checkNotNull(languageCode, 'languageCode');
    ArgumentError.checkNotNull(vocabularyName, 'vocabularyName');
    _s.validateStringLength(
      'vocabularyName',
      vocabularyName,
      1,
      200,
      isRequired: true,
    );
    _s.validateStringPattern(
      'vocabularyName',
      vocabularyName,
      r'''^[0-9a-zA-Z._-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'vocabularyFileUri',
      vocabularyFileUri,
      1,
      2000,
    );
    _s.validateStringPattern(
      'vocabularyFileUri',
      vocabularyFileUri,
      r'''(s3://|http(s*)://).+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.CreateVocabulary'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LanguageCode': languageCode?.toValue() ?? '',
        'VocabularyName': vocabularyName,
        if (phrases != null) 'Phrases': phrases,
        if (vocabularyFileUri != null) 'VocabularyFileUri': vocabularyFileUri,
      },
    );

    return CreateVocabularyResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new vocabulary filter that you can use to filter words, such as
  /// profane words, from the output of a transcription job.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [ConflictException].
  ///
  /// Parameter [languageCode] :
  /// The language code of the words in the vocabulary filter. All words in the
  /// filter must be in the same language. The vocabulary filter can only be
  /// used with transcription jobs in the specified language.
  ///
  /// Parameter [vocabularyFilterName] :
  /// The vocabulary filter name. The name must be unique within the account
  /// that contains it.
  ///
  /// Parameter [vocabularyFilterFileUri] :
  /// The Amazon S3 location of a text file used as input to create the
  /// vocabulary filter. Only use characters from the character set defined for
  /// custom vocabularies. For a list of character sets, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/how-vocabulary.html#charsets">Character
  /// Sets for Custom Vocabularies</a>.
  ///
  /// The specified file must be less than 50 KB of UTF-8 characters.
  ///
  /// If you provide the location of a list of words in the
  /// <code>VocabularyFilterFileUri</code> parameter, you can't use the
  /// <code>Words</code> parameter.
  ///
  /// Parameter [words] :
  /// The words to use in the vocabulary filter. Only use characters from the
  /// character set defined for custom vocabularies. For a list of character
  /// sets, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/how-vocabulary.html#charsets">Character
  /// Sets for Custom Vocabularies</a>.
  ///
  /// If you provide a list of words in the <code>Words</code> parameter, you
  /// can't use the <code>VocabularyFilterFileUri</code> parameter.
  Future<CreateVocabularyFilterResponse> createVocabularyFilter({
    @_s.required LanguageCode languageCode,
    @_s.required String vocabularyFilterName,
    String vocabularyFilterFileUri,
    List<String> words,
  }) async {
    ArgumentError.checkNotNull(languageCode, 'languageCode');
    ArgumentError.checkNotNull(vocabularyFilterName, 'vocabularyFilterName');
    _s.validateStringLength(
      'vocabularyFilterName',
      vocabularyFilterName,
      1,
      200,
      isRequired: true,
    );
    _s.validateStringPattern(
      'vocabularyFilterName',
      vocabularyFilterName,
      r'''^[0-9a-zA-Z._-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'vocabularyFilterFileUri',
      vocabularyFilterFileUri,
      1,
      2000,
    );
    _s.validateStringPattern(
      'vocabularyFilterFileUri',
      vocabularyFilterFileUri,
      r'''(s3://|http(s*)://).+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.CreateVocabularyFilter'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LanguageCode': languageCode?.toValue() ?? '',
        'VocabularyFilterName': vocabularyFilterName,
        if (vocabularyFilterFileUri != null)
          'VocabularyFilterFileUri': vocabularyFilterFileUri,
        if (words != null) 'Words': words,
      },
    );

    return CreateVocabularyFilterResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a transcription job generated by Amazon Transcribe Medical and any
  /// related information.
  ///
  /// May throw [LimitExceededException].
  /// May throw [BadRequestException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [medicalTranscriptionJobName] :
  /// The name you provide to the <code>DeleteMedicalTranscriptionJob</code>
  /// object to delete a transcription job.
  Future<void> deleteMedicalTranscriptionJob({
    @_s.required String medicalTranscriptionJobName,
  }) async {
    ArgumentError.checkNotNull(
        medicalTranscriptionJobName, 'medicalTranscriptionJobName');
    _s.validateStringLength(
      'medicalTranscriptionJobName',
      medicalTranscriptionJobName,
      1,
      200,
      isRequired: true,
    );
    _s.validateStringPattern(
      'medicalTranscriptionJobName',
      medicalTranscriptionJobName,
      r'''^[0-9a-zA-Z._-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.DeleteMedicalTranscriptionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MedicalTranscriptionJobName': medicalTranscriptionJobName,
      },
    );
  }

  /// Deletes a previously submitted transcription job along with any other
  /// generated results such as the transcription, models, and so on.
  ///
  /// May throw [LimitExceededException].
  /// May throw [BadRequestException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [transcriptionJobName] :
  /// The name of the transcription job to be deleted.
  Future<void> deleteTranscriptionJob({
    @_s.required String transcriptionJobName,
  }) async {
    ArgumentError.checkNotNull(transcriptionJobName, 'transcriptionJobName');
    _s.validateStringLength(
      'transcriptionJobName',
      transcriptionJobName,
      1,
      200,
      isRequired: true,
    );
    _s.validateStringPattern(
      'transcriptionJobName',
      transcriptionJobName,
      r'''^[0-9a-zA-Z._-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.DeleteTranscriptionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TranscriptionJobName': transcriptionJobName,
      },
    );
  }

  /// Deletes a vocabulary from Amazon Transcribe.
  ///
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [BadRequestException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [vocabularyName] :
  /// The name of the vocabulary to delete.
  Future<void> deleteVocabulary({
    @_s.required String vocabularyName,
  }) async {
    ArgumentError.checkNotNull(vocabularyName, 'vocabularyName');
    _s.validateStringLength(
      'vocabularyName',
      vocabularyName,
      1,
      200,
      isRequired: true,
    );
    _s.validateStringPattern(
      'vocabularyName',
      vocabularyName,
      r'''^[0-9a-zA-Z._-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.DeleteVocabulary'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'VocabularyName': vocabularyName,
      },
    );
  }

  /// Removes a vocabulary filter.
  ///
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [BadRequestException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [vocabularyFilterName] :
  /// The name of the vocabulary filter to remove.
  Future<void> deleteVocabularyFilter({
    @_s.required String vocabularyFilterName,
  }) async {
    ArgumentError.checkNotNull(vocabularyFilterName, 'vocabularyFilterName');
    _s.validateStringLength(
      'vocabularyFilterName',
      vocabularyFilterName,
      1,
      200,
      isRequired: true,
    );
    _s.validateStringPattern(
      'vocabularyFilterName',
      vocabularyFilterName,
      r'''^[0-9a-zA-Z._-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.DeleteVocabularyFilter'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'VocabularyFilterName': vocabularyFilterName,
      },
    );
  }

  /// Returns information about a transcription job from Amazon Transcribe
  /// Medical. To see the status of the job, check the
  /// <code>TranscriptionJobStatus</code> field. If the status is
  /// <code>COMPLETED</code>, the job is finished. You find the results of the
  /// completed job in the <code>TranscriptFileUri</code> field.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [medicalTranscriptionJobName] :
  /// The name of the medical transcription job.
  Future<GetMedicalTranscriptionJobResponse> getMedicalTranscriptionJob({
    @_s.required String medicalTranscriptionJobName,
  }) async {
    ArgumentError.checkNotNull(
        medicalTranscriptionJobName, 'medicalTranscriptionJobName');
    _s.validateStringLength(
      'medicalTranscriptionJobName',
      medicalTranscriptionJobName,
      1,
      200,
      isRequired: true,
    );
    _s.validateStringPattern(
      'medicalTranscriptionJobName',
      medicalTranscriptionJobName,
      r'''^[0-9a-zA-Z._-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.GetMedicalTranscriptionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MedicalTranscriptionJobName': medicalTranscriptionJobName,
      },
    );

    return GetMedicalTranscriptionJobResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about a transcription job. To see the status of the
  /// job, check the <code>TranscriptionJobStatus</code> field. If the status is
  /// <code>COMPLETED</code>, the job is finished and you can find the results
  /// at the location specified in the <code>TranscriptFileUri</code> field. If
  /// you enable content redaction, the redacted transcript appears in
  /// <code>RedactedTranscriptFileUri</code>.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [transcriptionJobName] :
  /// The name of the job.
  Future<GetTranscriptionJobResponse> getTranscriptionJob({
    @_s.required String transcriptionJobName,
  }) async {
    ArgumentError.checkNotNull(transcriptionJobName, 'transcriptionJobName');
    _s.validateStringLength(
      'transcriptionJobName',
      transcriptionJobName,
      1,
      200,
      isRequired: true,
    );
    _s.validateStringPattern(
      'transcriptionJobName',
      transcriptionJobName,
      r'''^[0-9a-zA-Z._-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.GetTranscriptionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TranscriptionJobName': transcriptionJobName,
      },
    );

    return GetTranscriptionJobResponse.fromJson(jsonResponse.body);
  }

  /// Gets information about a vocabulary.
  ///
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [vocabularyName] :
  /// The name of the vocabulary to return information about. The name is
  /// case-sensitive.
  Future<GetVocabularyResponse> getVocabulary({
    @_s.required String vocabularyName,
  }) async {
    ArgumentError.checkNotNull(vocabularyName, 'vocabularyName');
    _s.validateStringLength(
      'vocabularyName',
      vocabularyName,
      1,
      200,
      isRequired: true,
    );
    _s.validateStringPattern(
      'vocabularyName',
      vocabularyName,
      r'''^[0-9a-zA-Z._-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.GetVocabulary'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'VocabularyName': vocabularyName,
      },
    );

    return GetVocabularyResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about a vocabulary filter.
  ///
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [vocabularyFilterName] :
  /// The name of the vocabulary filter for which to return information.
  Future<GetVocabularyFilterResponse> getVocabularyFilter({
    @_s.required String vocabularyFilterName,
  }) async {
    ArgumentError.checkNotNull(vocabularyFilterName, 'vocabularyFilterName');
    _s.validateStringLength(
      'vocabularyFilterName',
      vocabularyFilterName,
      1,
      200,
      isRequired: true,
    );
    _s.validateStringPattern(
      'vocabularyFilterName',
      vocabularyFilterName,
      r'''^[0-9a-zA-Z._-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.GetVocabularyFilter'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'VocabularyFilterName': vocabularyFilterName,
      },
    );

    return GetVocabularyFilterResponse.fromJson(jsonResponse.body);
  }

  /// Lists medical transcription jobs with a specified status or substring that
  /// matches their names.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [jobNameContains] :
  /// When specified, the jobs returned in the list are limited to jobs whose
  /// name contains the specified string.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of medical transcription jobs to return in the
  /// response. IF there are fewer results in the list, this response contains
  /// only the actual results.
  ///
  /// Parameter [nextToken] :
  /// If you a receive a truncated result in the previous request of
  /// <code>ListMedicalTranscriptionJobs</code>, include <code>NextToken</code>
  /// to fetch the next set of jobs.
  ///
  /// Parameter [status] :
  /// When specified, returns only medical transcription jobs with the specified
  /// status. Jobs are ordered by creation date, with the newest jobs returned
  /// first. If you don't specify a status, Amazon Transcribe Medical returns
  /// all transcription jobs ordered by creation date.
  Future<ListMedicalTranscriptionJobsResponse> listMedicalTranscriptionJobs({
    String jobNameContains,
    int maxResults,
    String nextToken,
    TranscriptionJobStatus status,
  }) async {
    _s.validateStringLength(
      'jobNameContains',
      jobNameContains,
      1,
      200,
    );
    _s.validateStringPattern(
      'jobNameContains',
      jobNameContains,
      r'''^[0-9a-zA-Z._-]+''',
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      8192,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''.+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.ListMedicalTranscriptionJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (jobNameContains != null) 'JobNameContains': jobNameContains,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (status != null) 'Status': status.toValue(),
      },
    );

    return ListMedicalTranscriptionJobsResponse.fromJson(jsonResponse.body);
  }

  /// Lists transcription jobs with the specified status.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [jobNameContains] :
  /// When specified, the jobs returned in the list are limited to jobs whose
  /// name contains the specified string.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of jobs to return in the response. If there are fewer
  /// results in the list, this response contains only the actual results.
  ///
  /// Parameter [nextToken] :
  /// If the result of the previous request to
  /// <code>ListTranscriptionJobs</code> was truncated, include the
  /// <code>NextToken</code> to fetch the next set of jobs.
  ///
  /// Parameter [status] :
  /// When specified, returns only transcription jobs with the specified status.
  /// Jobs are ordered by creation date, with the newest jobs returned first. If
  /// you don’t specify a status, Amazon Transcribe returns all transcription
  /// jobs ordered by creation date.
  Future<ListTranscriptionJobsResponse> listTranscriptionJobs({
    String jobNameContains,
    int maxResults,
    String nextToken,
    TranscriptionJobStatus status,
  }) async {
    _s.validateStringLength(
      'jobNameContains',
      jobNameContains,
      1,
      200,
    );
    _s.validateStringPattern(
      'jobNameContains',
      jobNameContains,
      r'''^[0-9a-zA-Z._-]+''',
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      8192,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''.+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.ListTranscriptionJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (jobNameContains != null) 'JobNameContains': jobNameContains,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (status != null) 'Status': status.toValue(),
      },
    );

    return ListTranscriptionJobsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of vocabularies that match the specified criteria. If no
  /// criteria are specified, returns the entire list of vocabularies.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of vocabularies to return in the response. If there are
  /// fewer results in the list, this response contains only the actual results.
  ///
  /// Parameter [nameContains] :
  /// When specified, the vocabularies returned in the list are limited to
  /// vocabularies whose name contains the specified string. The search is
  /// case-insensitive, <code>ListVocabularies</code> returns both
  /// "vocabularyname" and "VocabularyName" in the response list.
  ///
  /// Parameter [nextToken] :
  /// If the result of the previous request to <code>ListVocabularies</code> was
  /// truncated, include the <code>NextToken</code> to fetch the next set of
  /// jobs.
  ///
  /// Parameter [stateEquals] :
  /// When specified, only returns vocabularies with the
  /// <code>VocabularyState</code> field equal to the specified state.
  Future<ListVocabulariesResponse> listVocabularies({
    int maxResults,
    String nameContains,
    String nextToken,
    VocabularyState stateEquals,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nameContains',
      nameContains,
      1,
      200,
    );
    _s.validateStringPattern(
      'nameContains',
      nameContains,
      r'''^[0-9a-zA-Z._-]+''',
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      8192,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''.+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.ListVocabularies'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nameContains != null) 'NameContains': nameContains,
        if (nextToken != null) 'NextToken': nextToken,
        if (stateEquals != null) 'StateEquals': stateEquals.toValue(),
      },
    );

    return ListVocabulariesResponse.fromJson(jsonResponse.body);
  }

  /// Gets information about vocabulary filters.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of filters to return in the response. If there are
  /// fewer results in the list, this response contains only the actual results.
  ///
  /// Parameter [nameContains] :
  /// Filters the response so that it only contains vocabulary filters whose
  /// name contains the specified string.
  ///
  /// Parameter [nextToken] :
  /// If the result of the previous request to
  /// <code>ListVocabularyFilters</code> was truncated, include the
  /// <code>NextToken</code> to fetch the next set of collections.
  Future<ListVocabularyFiltersResponse> listVocabularyFilters({
    int maxResults,
    String nameContains,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nameContains',
      nameContains,
      1,
      200,
    );
    _s.validateStringPattern(
      'nameContains',
      nameContains,
      r'''^[0-9a-zA-Z._-]+''',
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      8192,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''.+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.ListVocabularyFilters'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nameContains != null) 'NameContains': nameContains,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListVocabularyFiltersResponse.fromJson(jsonResponse.body);
  }

  /// Start a batch job to transcribe medical speech to text.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [ConflictException].
  ///
  /// Parameter [languageCode] :
  /// The language code for the language spoken in the input media file. US
  /// English (en-US) is the valid value for medical transcription jobs. Any
  /// other value you enter for language code results in a
  /// <code>BadRequestException</code> error.
  ///
  /// Parameter [medicalTranscriptionJobName] :
  /// The name of the medical transcription job. You can't use the strings "."
  /// or ".." by themselves as the job name. The name must also be unique within
  /// an AWS account.
  ///
  /// Parameter [outputBucketName] :
  /// The Amazon S3 location where the transcription is stored.
  ///
  /// You must set <code>OutputBucketName</code> for Amazon Transcribe Medical
  /// to store the transcription results. Your transcript appears in the S3
  /// location you specify. When you call the <a>GetMedicalTranscriptionJob</a>,
  /// the operation returns this location in the <code>TranscriptFileUri</code>
  /// field. The S3 bucket must have permissions that allow Amazon Transcribe
  /// Medical to put files in the bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/security_iam_id-based-policy-examples.html#auth-role-iam-user">Permissions
  /// Required for IAM User Roles</a>.
  ///
  /// You can specify an AWS Key Management Service (KMS) key to encrypt the
  /// output of your transcription using the
  /// <code>OutputEncryptionKMSKeyId</code> parameter. If you don't specify a
  /// KMS key, Amazon Transcribe Medical uses the default Amazon S3 key for
  /// server-side encryption of transcripts that are placed in your S3 bucket.
  ///
  /// Parameter [specialty] :
  /// The medical specialty of any clinician speaking in the input media.
  ///
  /// Parameter [type] :
  /// The speech of clinician in the input audio. <code>CONVERSATION</code>
  /// refers to conversations clinicians have with patients.
  /// <code>DICTATION</code> refers to medical professionals dictating their
  /// notes about a patient encounter.
  ///
  /// Parameter [mediaFormat] :
  /// The audio format of the input media file.
  ///
  /// Parameter [mediaSampleRateHertz] :
  /// The sample rate, in Hertz, of the audio track in the input media file.
  ///
  /// If you do not specify the media sample rate, Amazon Transcribe Medical
  /// determines the sample rate. If you specify the sample rate, it must match
  /// the rate detected by Amazon Transcribe Medical. In most cases, you should
  /// leave the <code>MediaSampleRateHertz</code> field blank and let Amazon
  /// Transcribe Medical determine the sample rate.
  ///
  /// Parameter [outputEncryptionKMSKeyId] :
  /// The Amazon Resource Name (ARN) of the AWS Key Management Service (KMS) key
  /// used to encrypt the output of the transcription job. The user calling the
  /// <a>StartMedicalTranscriptionJob</a> operation must have permission to use
  /// the specified KMS key.
  ///
  /// You use either of the following to identify a KMS key in the current
  /// account:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: "1234abcd-12ab-34cd-56ef-1234567890ab"
  /// </li>
  /// <li>
  /// KMS Key Alias: "alias/ExampleAlias"
  /// </li>
  /// </ul>
  /// You can use either of the following to identify a KMS key in the current
  /// account or another account:
  ///
  /// <ul>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS key in the current account or another
  /// account: "arn:aws:kms:region:account
  /// ID:key/1234abcd-12ab-34cd-56ef-1234567890ab"
  /// </li>
  /// <li>
  /// ARN of a KMS Key Alias: "arn:aws:kms:region:account ID:alias/ExampleAlias"
  /// </li>
  /// </ul>
  /// If you don't specify an encryption key, the output of the medical
  /// transcription job is encrypted with the default Amazon S3 key (SSE-S3).
  ///
  /// If you specify a KMS key to encrypt your output, you must also specify an
  /// output location in the <code>OutputBucketName</code> parameter.
  ///
  /// Parameter [settings] :
  /// Optional settings for the medical transcription job.
  Future<StartMedicalTranscriptionJobResponse> startMedicalTranscriptionJob({
    @_s.required LanguageCode languageCode,
    @_s.required Media media,
    @_s.required String medicalTranscriptionJobName,
    @_s.required String outputBucketName,
    @_s.required Specialty specialty,
    @_s.required Type type,
    MediaFormat mediaFormat,
    int mediaSampleRateHertz,
    String outputEncryptionKMSKeyId,
    MedicalTranscriptionSetting settings,
  }) async {
    ArgumentError.checkNotNull(languageCode, 'languageCode');
    ArgumentError.checkNotNull(media, 'media');
    ArgumentError.checkNotNull(
        medicalTranscriptionJobName, 'medicalTranscriptionJobName');
    _s.validateStringLength(
      'medicalTranscriptionJobName',
      medicalTranscriptionJobName,
      1,
      200,
      isRequired: true,
    );
    _s.validateStringPattern(
      'medicalTranscriptionJobName',
      medicalTranscriptionJobName,
      r'''^[0-9a-zA-Z._-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(outputBucketName, 'outputBucketName');
    _s.validateStringLength(
      'outputBucketName',
      outputBucketName,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'outputBucketName',
      outputBucketName,
      r'''[a-z0-9][\.\-a-z0-9]{1,61}[a-z0-9]''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(specialty, 'specialty');
    ArgumentError.checkNotNull(type, 'type');
    _s.validateNumRange(
      'mediaSampleRateHertz',
      mediaSampleRateHertz,
      8000,
      48000,
    );
    _s.validateStringLength(
      'outputEncryptionKMSKeyId',
      outputEncryptionKMSKeyId,
      1,
      2048,
    );
    _s.validateStringPattern(
      'outputEncryptionKMSKeyId',
      outputEncryptionKMSKeyId,
      r'''^[A-Za-z0-9][A-Za-z0-9:_/+=,@.-]{0,2048}$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.StartMedicalTranscriptionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LanguageCode': languageCode?.toValue() ?? '',
        'Media': media,
        'MedicalTranscriptionJobName': medicalTranscriptionJobName,
        'OutputBucketName': outputBucketName,
        'Specialty': specialty?.toValue() ?? '',
        'Type': type?.toValue() ?? '',
        if (mediaFormat != null) 'MediaFormat': mediaFormat.toValue(),
        if (mediaSampleRateHertz != null)
          'MediaSampleRateHertz': mediaSampleRateHertz,
        if (outputEncryptionKMSKeyId != null)
          'OutputEncryptionKMSKeyId': outputEncryptionKMSKeyId,
        if (settings != null) 'Settings': settings,
      },
    );

    return StartMedicalTranscriptionJobResponse.fromJson(jsonResponse.body);
  }

  /// Starts an asynchronous job to transcribe speech to text.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [ConflictException].
  ///
  /// Parameter [languageCode] :
  /// The language code for the language used in the input media file.
  ///
  /// Parameter [media] :
  /// An object that describes the input media for a transcription job.
  ///
  /// Parameter [transcriptionJobName] :
  /// The name of the job. Note that you can't use the strings "." or ".." by
  /// themselves as the job name. The name must also be unique within an AWS
  /// account.
  ///
  /// Parameter [contentRedaction] :
  /// An object that contains the request parameters for content redaction.
  ///
  /// Parameter [jobExecutionSettings] :
  /// Provides information about how a transcription job is executed. Use this
  /// field to indicate that the job can be queued for deferred execution if the
  /// concurrency limit is reached and there are no slots available to
  /// immediately run the job.
  ///
  /// Parameter [mediaFormat] :
  /// The format of the input media file.
  ///
  /// Parameter [mediaSampleRateHertz] :
  /// The sample rate, in Hertz, of the audio track in the input media file.
  ///
  /// If you do not specify the media sample rate, Amazon Transcribe determines
  /// the sample rate. If you specify the sample rate, it must match the sample
  /// rate detected by Amazon Transcribe. In most cases, you should leave the
  /// <code>MediaSampleRateHertz</code> field blank and let Amazon Transcribe
  /// determine the sample rate.
  ///
  /// Parameter [outputBucketName] :
  /// The location where the transcription is stored.
  ///
  /// If you set the <code>OutputBucketName</code>, Amazon Transcribe puts the
  /// transcript in the specified S3 bucket. When you call the
  /// <a>GetTranscriptionJob</a> operation, the operation returns this location
  /// in the <code>TranscriptFileUri</code> field. If you enable content
  /// redaction, the redacted transcript appears in
  /// <code>RedactedTranscriptFileUri</code>. If you enable content redaction
  /// and choose to output an unredacted transcript, that transcript's location
  /// still appears in the <code>TranscriptFileUri</code>. The S3 bucket must
  /// have permissions that allow Amazon Transcribe to put files in the bucket.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/security_iam_id-based-policy-examples.html#auth-role-iam-user">Permissions
  /// Required for IAM User Roles</a>.
  ///
  /// You can specify an AWS Key Management Service (KMS) key to encrypt the
  /// output of your transcription using the
  /// <code>OutputEncryptionKMSKeyId</code> parameter. If you don't specify a
  /// KMS key, Amazon Transcribe uses the default Amazon S3 key for server-side
  /// encryption of transcripts that are placed in your S3 bucket.
  ///
  /// If you don't set the <code>OutputBucketName</code>, Amazon Transcribe
  /// generates a pre-signed URL, a shareable URL that provides secure access to
  /// your transcription, and returns it in the <code>TranscriptFileUri</code>
  /// field. Use this URL to download the transcription.
  ///
  /// Parameter [outputEncryptionKMSKeyId] :
  /// The Amazon Resource Name (ARN) of the AWS Key Management Service (KMS) key
  /// used to encrypt the output of the transcription job. The user calling the
  /// <code>StartTranscriptionJob</code> operation must have permission to use
  /// the specified KMS key.
  ///
  /// You can use either of the following to identify a KMS key in the current
  /// account:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: "1234abcd-12ab-34cd-56ef-1234567890ab"
  /// </li>
  /// <li>
  /// KMS Key Alias: "alias/ExampleAlias"
  /// </li>
  /// </ul>
  /// You can use either of the following to identify a KMS key in the current
  /// account or another account:
  ///
  /// <ul>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key: "arn:aws:kms:region:account
  /// ID:key/1234abcd-12ab-34cd-56ef-1234567890ab"
  /// </li>
  /// <li>
  /// ARN of a KMS Key Alias: "arn:aws:kms:region:account ID:alias/ExampleAlias"
  /// </li>
  /// </ul>
  /// If you don't specify an encryption key, the output of the transcription
  /// job is encrypted with the default Amazon S3 key (SSE-S3).
  ///
  /// If you specify a KMS key to encrypt your output, you must also specify an
  /// output location in the <code>OutputBucketName</code> parameter.
  ///
  /// Parameter [settings] :
  /// A <code>Settings</code> object that provides optional settings for a
  /// transcription job.
  Future<StartTranscriptionJobResponse> startTranscriptionJob({
    @_s.required LanguageCode languageCode,
    @_s.required Media media,
    @_s.required String transcriptionJobName,
    ContentRedaction contentRedaction,
    JobExecutionSettings jobExecutionSettings,
    MediaFormat mediaFormat,
    int mediaSampleRateHertz,
    String outputBucketName,
    String outputEncryptionKMSKeyId,
    Settings settings,
  }) async {
    ArgumentError.checkNotNull(languageCode, 'languageCode');
    ArgumentError.checkNotNull(media, 'media');
    ArgumentError.checkNotNull(transcriptionJobName, 'transcriptionJobName');
    _s.validateStringLength(
      'transcriptionJobName',
      transcriptionJobName,
      1,
      200,
      isRequired: true,
    );
    _s.validateStringPattern(
      'transcriptionJobName',
      transcriptionJobName,
      r'''^[0-9a-zA-Z._-]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'mediaSampleRateHertz',
      mediaSampleRateHertz,
      8000,
      48000,
    );
    _s.validateStringLength(
      'outputBucketName',
      outputBucketName,
      0,
      64,
    );
    _s.validateStringPattern(
      'outputBucketName',
      outputBucketName,
      r'''[a-z0-9][\.\-a-z0-9]{1,61}[a-z0-9]''',
    );
    _s.validateStringLength(
      'outputEncryptionKMSKeyId',
      outputEncryptionKMSKeyId,
      1,
      2048,
    );
    _s.validateStringPattern(
      'outputEncryptionKMSKeyId',
      outputEncryptionKMSKeyId,
      r'''^[A-Za-z0-9][A-Za-z0-9:_/+=,@.-]{0,2048}$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.StartTranscriptionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LanguageCode': languageCode?.toValue() ?? '',
        'Media': media,
        'TranscriptionJobName': transcriptionJobName,
        if (contentRedaction != null) 'ContentRedaction': contentRedaction,
        if (jobExecutionSettings != null)
          'JobExecutionSettings': jobExecutionSettings,
        if (mediaFormat != null) 'MediaFormat': mediaFormat.toValue(),
        if (mediaSampleRateHertz != null)
          'MediaSampleRateHertz': mediaSampleRateHertz,
        if (outputBucketName != null) 'OutputBucketName': outputBucketName,
        if (outputEncryptionKMSKeyId != null)
          'OutputEncryptionKMSKeyId': outputEncryptionKMSKeyId,
        if (settings != null) 'Settings': settings,
      },
    );

    return StartTranscriptionJobResponse.fromJson(jsonResponse.body);
  }

  /// Updates an existing vocabulary with new values. The
  /// <code>UpdateVocabulary</code> operation overwrites all of the existing
  /// information with the values that you provide in the request.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [languageCode] :
  /// The language code of the vocabulary entries.
  ///
  /// Parameter [vocabularyName] :
  /// The name of the vocabulary to update. The name is case-sensitive.
  ///
  /// Parameter [phrases] :
  /// An array of strings containing the vocabulary entries.
  ///
  /// Parameter [vocabularyFileUri] :
  /// The S3 location of the text file that contains the definition of the
  /// custom vocabulary. The URI must be in the same region as the API endpoint
  /// that you are calling. The general form is
  ///
  /// <code>
  /// https://s3.&lt;aws-region&gt;.amazonaws.com/&lt;bucket-name&gt;/&lt;keyprefix&gt;/&lt;objectkey&gt;
  /// </code>
  ///
  /// For example:
  ///
  /// <code>https://s3.us-east-1.amazonaws.com/examplebucket/vocab.txt</code>
  ///
  /// For more information about S3 object names, see <a
  /// href="http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#object-keys">Object
  /// Keys</a> in the <i>Amazon S3 Developer Guide</i>.
  ///
  /// For more information about custom vocabularies, see <a
  /// href="http://docs.aws.amazon.com/transcribe/latest/dg/how-it-works.html#how-vocabulary">Custom
  /// Vocabularies</a>.
  Future<UpdateVocabularyResponse> updateVocabulary({
    @_s.required LanguageCode languageCode,
    @_s.required String vocabularyName,
    List<String> phrases,
    String vocabularyFileUri,
  }) async {
    ArgumentError.checkNotNull(languageCode, 'languageCode');
    ArgumentError.checkNotNull(vocabularyName, 'vocabularyName');
    _s.validateStringLength(
      'vocabularyName',
      vocabularyName,
      1,
      200,
      isRequired: true,
    );
    _s.validateStringPattern(
      'vocabularyName',
      vocabularyName,
      r'''^[0-9a-zA-Z._-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'vocabularyFileUri',
      vocabularyFileUri,
      1,
      2000,
    );
    _s.validateStringPattern(
      'vocabularyFileUri',
      vocabularyFileUri,
      r'''(s3://|http(s*)://).+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.UpdateVocabulary'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LanguageCode': languageCode?.toValue() ?? '',
        'VocabularyName': vocabularyName,
        if (phrases != null) 'Phrases': phrases,
        if (vocabularyFileUri != null) 'VocabularyFileUri': vocabularyFileUri,
      },
    );

    return UpdateVocabularyResponse.fromJson(jsonResponse.body);
  }

  /// Updates a vocabulary filter with a new list of filtered words.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [vocabularyFilterName] :
  /// The name of the vocabulary filter to update.
  ///
  /// Parameter [vocabularyFilterFileUri] :
  /// The Amazon S3 location of a text file used as input to create the
  /// vocabulary filter. Only use characters from the character set defined for
  /// custom vocabularies. For a list of character sets, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/how-vocabulary.html#charsets">Character
  /// Sets for Custom Vocabularies</a>.
  ///
  /// The specified file must be less than 50 KB of UTF-8 characters.
  ///
  /// If you provide the location of a list of words in the
  /// <code>VocabularyFilterFileUri</code> parameter, you can't use the
  /// <code>Words</code> parameter.
  ///
  /// Parameter [words] :
  /// The words to use in the vocabulary filter. Only use characters from the
  /// character set defined for custom vocabularies. For a list of character
  /// sets, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/how-vocabulary.html#charsets">Character
  /// Sets for Custom Vocabularies</a>.
  ///
  /// If you provide a list of words in the <code>Words</code> parameter, you
  /// can't use the <code>VocabularyFilterFileUri</code> parameter.
  Future<UpdateVocabularyFilterResponse> updateVocabularyFilter({
    @_s.required String vocabularyFilterName,
    String vocabularyFilterFileUri,
    List<String> words,
  }) async {
    ArgumentError.checkNotNull(vocabularyFilterName, 'vocabularyFilterName');
    _s.validateStringLength(
      'vocabularyFilterName',
      vocabularyFilterName,
      1,
      200,
      isRequired: true,
    );
    _s.validateStringPattern(
      'vocabularyFilterName',
      vocabularyFilterName,
      r'''^[0-9a-zA-Z._-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'vocabularyFilterFileUri',
      vocabularyFilterFileUri,
      1,
      2000,
    );
    _s.validateStringPattern(
      'vocabularyFilterFileUri',
      vocabularyFilterFileUri,
      r'''(s3://|http(s*)://).+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.UpdateVocabularyFilter'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'VocabularyFilterName': vocabularyFilterName,
        if (vocabularyFilterFileUri != null)
          'VocabularyFilterFileUri': vocabularyFilterFileUri,
        if (words != null) 'Words': words,
      },
    );

    return UpdateVocabularyFilterResponse.fromJson(jsonResponse.body);
  }
}

/// Settings for content redaction within a transcription job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ContentRedaction {
  /// The output transcript file stored in either the default S3 bucket or in a
  /// bucket you specify.
  ///
  /// When you choose <code>redacted</code> Amazon Transcribe outputs only the
  /// redacted transcript.
  ///
  /// When you choose <code>redacted_and_unredacted</code> Amazon Transcribe
  /// outputs both the redacted and unredacted transcripts.
  @_s.JsonKey(name: 'RedactionOutput')
  final RedactionOutput redactionOutput;

  /// Request parameter that defines the entities to be redacted. The only
  /// accepted value is <code>PII</code>.
  @_s.JsonKey(name: 'RedactionType')
  final RedactionType redactionType;

  ContentRedaction({
    @_s.required this.redactionOutput,
    @_s.required this.redactionType,
  });
  factory ContentRedaction.fromJson(Map<String, dynamic> json) =>
      _$ContentRedactionFromJson(json);

  Map<String, dynamic> toJson() => _$ContentRedactionToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateVocabularyFilterResponse {
  /// The language code of the words in the collection.
  @_s.JsonKey(name: 'LanguageCode')
  final LanguageCode languageCode;

  /// The date and time that the vocabulary filter was modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedTime')
  final DateTime lastModifiedTime;

  /// The name of the vocabulary filter.
  @_s.JsonKey(name: 'VocabularyFilterName')
  final String vocabularyFilterName;

  CreateVocabularyFilterResponse({
    this.languageCode,
    this.lastModifiedTime,
    this.vocabularyFilterName,
  });
  factory CreateVocabularyFilterResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateVocabularyFilterResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateVocabularyResponse {
  /// If the <code>VocabularyState</code> field is <code>FAILED</code>, this field
  /// contains information about why the job failed.
  @_s.JsonKey(name: 'FailureReason')
  final String failureReason;

  /// The language code of the vocabulary entries.
  @_s.JsonKey(name: 'LanguageCode')
  final LanguageCode languageCode;

  /// The date and time that the vocabulary was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedTime')
  final DateTime lastModifiedTime;

  /// The name of the vocabulary.
  @_s.JsonKey(name: 'VocabularyName')
  final String vocabularyName;

  /// The processing state of the vocabulary. When the
  /// <code>VocabularyState</code> field contains <code>READY</code> the
  /// vocabulary is ready to be used in a <code>StartTranscriptionJob</code>
  /// request.
  @_s.JsonKey(name: 'VocabularyState')
  final VocabularyState vocabularyState;

  CreateVocabularyResponse({
    this.failureReason,
    this.languageCode,
    this.lastModifiedTime,
    this.vocabularyName,
    this.vocabularyState,
  });
  factory CreateVocabularyResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateVocabularyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetMedicalTranscriptionJobResponse {
  /// An object that contains the results of the medical transcription job.
  @_s.JsonKey(name: 'MedicalTranscriptionJob')
  final MedicalTranscriptionJob medicalTranscriptionJob;

  GetMedicalTranscriptionJobResponse({
    this.medicalTranscriptionJob,
  });
  factory GetMedicalTranscriptionJobResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetMedicalTranscriptionJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetTranscriptionJobResponse {
  /// An object that contains the results of the transcription job.
  @_s.JsonKey(name: 'TranscriptionJob')
  final TranscriptionJob transcriptionJob;

  GetTranscriptionJobResponse({
    this.transcriptionJob,
  });
  factory GetTranscriptionJobResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTranscriptionJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetVocabularyFilterResponse {
  /// The URI of the list of words in the vocabulary filter. You can use this URI
  /// to get the list of words.
  @_s.JsonKey(name: 'DownloadUri')
  final String downloadUri;

  /// The language code of the words in the vocabulary filter.
  @_s.JsonKey(name: 'LanguageCode')
  final LanguageCode languageCode;

  /// The date and time that the contents of the vocabulary filter were updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedTime')
  final DateTime lastModifiedTime;

  /// The name of the vocabulary filter.
  @_s.JsonKey(name: 'VocabularyFilterName')
  final String vocabularyFilterName;

  GetVocabularyFilterResponse({
    this.downloadUri,
    this.languageCode,
    this.lastModifiedTime,
    this.vocabularyFilterName,
  });
  factory GetVocabularyFilterResponse.fromJson(Map<String, dynamic> json) =>
      _$GetVocabularyFilterResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetVocabularyResponse {
  /// The S3 location where the vocabulary is stored. Use this URI to get the
  /// contents of the vocabulary. The URI is available for a limited time.
  @_s.JsonKey(name: 'DownloadUri')
  final String downloadUri;

  /// If the <code>VocabularyState</code> field is <code>FAILED</code>, this field
  /// contains information about why the job failed.
  @_s.JsonKey(name: 'FailureReason')
  final String failureReason;

  /// The language code of the vocabulary entries.
  @_s.JsonKey(name: 'LanguageCode')
  final LanguageCode languageCode;

  /// The date and time that the vocabulary was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedTime')
  final DateTime lastModifiedTime;

  /// The name of the vocabulary to return.
  @_s.JsonKey(name: 'VocabularyName')
  final String vocabularyName;

  /// The processing state of the vocabulary.
  @_s.JsonKey(name: 'VocabularyState')
  final VocabularyState vocabularyState;

  GetVocabularyResponse({
    this.downloadUri,
    this.failureReason,
    this.languageCode,
    this.lastModifiedTime,
    this.vocabularyName,
    this.vocabularyState,
  });
  factory GetVocabularyResponse.fromJson(Map<String, dynamic> json) =>
      _$GetVocabularyResponseFromJson(json);
}

/// Provides information about when a transcription job should be executed.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class JobExecutionSettings {
  /// Indicates whether a job should be queued by Amazon Transcribe when the
  /// concurrent execution limit is exceeded. When the
  /// <code>AllowDeferredExecution</code> field is true, jobs are queued and
  /// executed when the number of executing jobs falls below the concurrent
  /// execution limit. If the field is false, Amazon Transcribe returns a
  /// <code>LimitExceededException</code> exception.
  ///
  /// If you specify the <code>AllowDeferredExecution</code> field, you must
  /// specify the <code>DataAccessRoleArn</code> field.
  @_s.JsonKey(name: 'AllowDeferredExecution')
  final bool allowDeferredExecution;

  /// The Amazon Resource Name (ARN) of a role that has access to the S3 bucket
  /// that contains the input files. Amazon Transcribe assumes this role to read
  /// queued media files. If you have specified an output S3 bucket for the
  /// transcription results, this role should have access to the output bucket as
  /// well.
  ///
  /// If you specify the <code>AllowDeferredExecution</code> field, you must
  /// specify the <code>DataAccessRoleArn</code> field.
  @_s.JsonKey(name: 'DataAccessRoleArn')
  final String dataAccessRoleArn;

  JobExecutionSettings({
    this.allowDeferredExecution,
    this.dataAccessRoleArn,
  });
  factory JobExecutionSettings.fromJson(Map<String, dynamic> json) =>
      _$JobExecutionSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$JobExecutionSettingsToJson(this);
}

enum LanguageCode {
  @_s.JsonValue('en-US')
  enUs,
  @_s.JsonValue('es-US')
  esUs,
  @_s.JsonValue('en-AU')
  enAu,
  @_s.JsonValue('fr-CA')
  frCa,
  @_s.JsonValue('en-GB')
  enGb,
  @_s.JsonValue('de-DE')
  deDe,
  @_s.JsonValue('pt-BR')
  ptBr,
  @_s.JsonValue('fr-FR')
  frFr,
  @_s.JsonValue('it-IT')
  itIt,
  @_s.JsonValue('ko-KR')
  koKr,
  @_s.JsonValue('es-ES')
  esEs,
  @_s.JsonValue('en-IN')
  enIn,
  @_s.JsonValue('hi-IN')
  hiIn,
  @_s.JsonValue('ar-SA')
  arSa,
  @_s.JsonValue('ru-RU')
  ruRu,
  @_s.JsonValue('zh-CN')
  zhCn,
  @_s.JsonValue('nl-NL')
  nlNl,
  @_s.JsonValue('id-ID')
  idId,
  @_s.JsonValue('ta-IN')
  taIn,
  @_s.JsonValue('fa-IR')
  faIr,
  @_s.JsonValue('en-IE')
  enIe,
  @_s.JsonValue('en-AB')
  enAb,
  @_s.JsonValue('en-WL')
  enWl,
  @_s.JsonValue('pt-PT')
  ptPt,
  @_s.JsonValue('te-IN')
  teIn,
  @_s.JsonValue('tr-TR')
  trTr,
  @_s.JsonValue('de-CH')
  deCh,
  @_s.JsonValue('he-IL')
  heIl,
  @_s.JsonValue('ms-MY')
  msMy,
  @_s.JsonValue('ja-JP')
  jaJp,
  @_s.JsonValue('ar-AE')
  arAe,
}

extension on LanguageCode {
  String toValue() {
    switch (this) {
      case LanguageCode.enUs:
        return 'en-US';
      case LanguageCode.esUs:
        return 'es-US';
      case LanguageCode.enAu:
        return 'en-AU';
      case LanguageCode.frCa:
        return 'fr-CA';
      case LanguageCode.enGb:
        return 'en-GB';
      case LanguageCode.deDe:
        return 'de-DE';
      case LanguageCode.ptBr:
        return 'pt-BR';
      case LanguageCode.frFr:
        return 'fr-FR';
      case LanguageCode.itIt:
        return 'it-IT';
      case LanguageCode.koKr:
        return 'ko-KR';
      case LanguageCode.esEs:
        return 'es-ES';
      case LanguageCode.enIn:
        return 'en-IN';
      case LanguageCode.hiIn:
        return 'hi-IN';
      case LanguageCode.arSa:
        return 'ar-SA';
      case LanguageCode.ruRu:
        return 'ru-RU';
      case LanguageCode.zhCn:
        return 'zh-CN';
      case LanguageCode.nlNl:
        return 'nl-NL';
      case LanguageCode.idId:
        return 'id-ID';
      case LanguageCode.taIn:
        return 'ta-IN';
      case LanguageCode.faIr:
        return 'fa-IR';
      case LanguageCode.enIe:
        return 'en-IE';
      case LanguageCode.enAb:
        return 'en-AB';
      case LanguageCode.enWl:
        return 'en-WL';
      case LanguageCode.ptPt:
        return 'pt-PT';
      case LanguageCode.teIn:
        return 'te-IN';
      case LanguageCode.trTr:
        return 'tr-TR';
      case LanguageCode.deCh:
        return 'de-CH';
      case LanguageCode.heIl:
        return 'he-IL';
      case LanguageCode.msMy:
        return 'ms-MY';
      case LanguageCode.jaJp:
        return 'ja-JP';
      case LanguageCode.arAe:
        return 'ar-AE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListMedicalTranscriptionJobsResponse {
  /// A list of objects containing summary information for a transcription job.
  @_s.JsonKey(name: 'MedicalTranscriptionJobSummaries')
  final List<MedicalTranscriptionJobSummary> medicalTranscriptionJobSummaries;

  /// The <code>ListMedicalTranscriptionJobs</code> operation returns a page of
  /// jobs at a time. The maximum size of the page is set by the
  /// <code>MaxResults</code> parameter. If the number of jobs exceeds what can
  /// fit on a page, Amazon Transcribe Medical returns the <code>NextPage</code>
  /// token. Include the token in the next request to the
  /// <code>ListMedicalTranscriptionJobs</code> operation to return in the next
  /// page of jobs.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The requested status of the medical transcription jobs returned.
  @_s.JsonKey(name: 'Status')
  final TranscriptionJobStatus status;

  ListMedicalTranscriptionJobsResponse({
    this.medicalTranscriptionJobSummaries,
    this.nextToken,
    this.status,
  });
  factory ListMedicalTranscriptionJobsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListMedicalTranscriptionJobsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTranscriptionJobsResponse {
  /// The <code>ListTranscriptionJobs</code> operation returns a page of jobs at a
  /// time. The maximum size of the page is set by the <code>MaxResults</code>
  /// parameter. If there are more jobs in the list than the page size, Amazon
  /// Transcribe returns the <code>NextPage</code> token. Include the token in the
  /// next request to the <code>ListTranscriptionJobs</code> operation to return
  /// in the next page of jobs.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The requested status of the jobs returned.
  @_s.JsonKey(name: 'Status')
  final TranscriptionJobStatus status;

  /// A list of objects containing summary information for a transcription job.
  @_s.JsonKey(name: 'TranscriptionJobSummaries')
  final List<TranscriptionJobSummary> transcriptionJobSummaries;

  ListTranscriptionJobsResponse({
    this.nextToken,
    this.status,
    this.transcriptionJobSummaries,
  });
  factory ListTranscriptionJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTranscriptionJobsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListVocabulariesResponse {
  /// The <code>ListVocabularies</code> operation returns a page of vocabularies
  /// at a time. The maximum size of the page is set by the
  /// <code>MaxResults</code> parameter. If there are more jobs in the list than
  /// the page size, Amazon Transcribe returns the <code>NextPage</code> token.
  /// Include the token in the next request to the <code>ListVocabularies</code>
  /// operation to return in the next page of jobs.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The requested vocabulary state.
  @_s.JsonKey(name: 'Status')
  final TranscriptionJobStatus status;

  /// A list of objects that describe the vocabularies that match the search
  /// criteria in the request.
  @_s.JsonKey(name: 'Vocabularies')
  final List<VocabularyInfo> vocabularies;

  ListVocabulariesResponse({
    this.nextToken,
    this.status,
    this.vocabularies,
  });
  factory ListVocabulariesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListVocabulariesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListVocabularyFiltersResponse {
  /// The <code>ListVocabularyFilters</code> operation returns a page of
  /// collections at a time. The maximum size of the page is set by the
  /// <code>MaxResults</code> parameter. If there are more jobs in the list than
  /// the page size, Amazon Transcribe returns the <code>NextPage</code> token.
  /// Include the token in the next request to the
  /// <code>ListVocabularyFilters</code> operation to return in the next page of
  /// jobs.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The list of vocabulary filters. It contains at most <code>MaxResults</code>
  /// number of filters. If there are more filters, call the
  /// <code>ListVocabularyFilters</code> operation again with the
  /// <code>NextToken</code> parameter in the request set to the value of the
  /// <code>NextToken</code> field in the response.
  @_s.JsonKey(name: 'VocabularyFilters')
  final List<VocabularyFilterInfo> vocabularyFilters;

  ListVocabularyFiltersResponse({
    this.nextToken,
    this.vocabularyFilters,
  });
  factory ListVocabularyFiltersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListVocabularyFiltersResponseFromJson(json);
}

/// Describes the input media file in a transcription request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Media {
  /// The S3 object location of the input media file. The URI must be in the same
  /// region as the API endpoint that you are calling. The general form is:
  ///
  /// <code> s3://&lt;bucket-name&gt;/&lt;keyprefix&gt;/&lt;objectkey&gt; </code>
  ///
  /// For example:
  ///
  /// <code>s3://examplebucket/example.mp4</code>
  ///
  /// <code>s3://examplebucket/mediadocs/example.mp4</code>
  ///
  /// For more information about S3 object names, see <a
  /// href="http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#object-keys">Object
  /// Keys</a> in the <i>Amazon S3 Developer Guide</i>.
  @_s.JsonKey(name: 'MediaFileUri')
  final String mediaFileUri;

  Media({
    this.mediaFileUri,
  });
  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);

  Map<String, dynamic> toJson() => _$MediaToJson(this);
}

enum MediaFormat {
  @_s.JsonValue('mp3')
  mp3,
  @_s.JsonValue('mp4')
  mp4,
  @_s.JsonValue('wav')
  wav,
  @_s.JsonValue('flac')
  flac,
}

extension on MediaFormat {
  String toValue() {
    switch (this) {
      case MediaFormat.mp3:
        return 'mp3';
      case MediaFormat.mp4:
        return 'mp4';
      case MediaFormat.wav:
        return 'wav';
      case MediaFormat.flac:
        return 'flac';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Identifies the location of a medical transcript.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MedicalTranscript {
  /// The S3 object location of the medical transcript.
  ///
  /// Use this URI to access the medical transcript. This URI points to the S3
  /// bucket you created to store the medical transcript.
  @_s.JsonKey(name: 'TranscriptFileUri')
  final String transcriptFileUri;

  MedicalTranscript({
    this.transcriptFileUri,
  });
  factory MedicalTranscript.fromJson(Map<String, dynamic> json) =>
      _$MedicalTranscriptFromJson(json);
}

/// The data structure that containts the information for a medical
/// transcription job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MedicalTranscriptionJob {
  /// A timestamp that shows when the job was completed.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CompletionTime')
  final DateTime completionTime;

  /// A timestamp that shows when the job was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTime')
  final DateTime creationTime;

  /// If the <code>TranscriptionJobStatus</code> field is <code>FAILED</code>,
  /// this field contains information about why the job failed.
  ///
  /// The <code>FailureReason</code> field contains one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>Unsupported media format</code>- The media format specified in the
  /// <code>MediaFormat</code> field of the request isn't valid. See the
  /// description of the <code>MediaFormat</code> field for a list of valid
  /// values.
  /// </li>
  /// <li>
  /// <code>The media format provided does not match the detected media
  /// format</code>- The media format of the audio file doesn't match the format
  /// specified in the <code>MediaFormat</code> field in the request. Check the
  /// media format of your media file and make sure the two values match.
  /// </li>
  /// <li>
  /// <code>Invalid sample rate for audio file</code>- The sample rate specified
  /// in the <code>MediaSampleRateHertz</code> of the request isn't valid. The
  /// sample rate must be between 8000 and 48000 Hertz.
  /// </li>
  /// <li>
  /// <code>The sample rate provided does not match the detected sample
  /// rate</code>- The sample rate in the audio file doesn't match the sample rate
  /// specified in the <code>MediaSampleRateHertz</code> field in the request.
  /// Check the sample rate of your media file and make sure that the two values
  /// match.
  /// </li>
  /// <li>
  /// <code>Invalid file size: file size too large</code>- The size of your audio
  /// file is larger than what Amazon Transcribe Medical can process. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/limits-guidelines.html#limits">Guidlines
  /// and Quotas</a> in the <i>Amazon Transcribe Medical Guide</i>
  /// </li>
  /// <li>
  /// <code>Invalid number of channels: number of channels too large</code>- Your
  /// audio contains more channels than Amazon Transcribe Medical is configured to
  /// process. To request additional channels, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/transcribe-medical.html">Amazon
  /// Transcribe Medical Endpoints and Quotas</a> in the <i>Amazon Web Services
  /// General Reference</i>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'FailureReason')
  final String failureReason;

  /// The language code for the language spoken in the source audio file. US
  /// English (en-US) is the only supported language for medical transcriptions.
  /// Any other value you enter for language code results in a
  /// <code>BadRequestException</code> error.
  @_s.JsonKey(name: 'LanguageCode')
  final LanguageCode languageCode;
  @_s.JsonKey(name: 'Media')
  final Media media;

  /// The format of the input media file.
  @_s.JsonKey(name: 'MediaFormat')
  final MediaFormat mediaFormat;

  /// The sample rate, in Hertz, of the source audio containing medical
  /// information.
  ///
  /// If you don't specify the sample rate, Amazon Transcribe Medical determines
  /// it for you. If you choose to specify the sample rate, it must match the rate
  /// detected by Amazon Transcribe Medical. In most cases, you should leave the
  /// <code>MediaSampleHertz</code> blank and let Amazon Transcribe Medical
  /// determine the sample rate.
  @_s.JsonKey(name: 'MediaSampleRateHertz')
  final int mediaSampleRateHertz;

  /// The name for a given medical transcription job.
  @_s.JsonKey(name: 'MedicalTranscriptionJobName')
  final String medicalTranscriptionJobName;

  /// Object that contains object.
  @_s.JsonKey(name: 'Settings')
  final MedicalTranscriptionSetting settings;

  /// The medical specialty of any clinicians providing a dictation or having a
  /// conversation. <code>PRIMARYCARE</code> is the only available setting for
  /// this object. This specialty enables you to generate transcriptions for the
  /// following medical fields:
  ///
  /// <ul>
  /// <li>
  /// Family Medicine
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Specialty')
  final Specialty specialty;

  /// A timestamp that shows when the job started processing.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  /// An object that contains the <code>MedicalTranscript</code>. The
  /// <code>MedicalTranscript</code> contains the <code>TranscriptFileUri</code>.
  @_s.JsonKey(name: 'Transcript')
  final MedicalTranscript transcript;

  /// The completion status of a medical transcription job.
  @_s.JsonKey(name: 'TranscriptionJobStatus')
  final TranscriptionJobStatus transcriptionJobStatus;

  /// The type of speech in the transcription job. <code>CONVERSATION</code> is
  /// generally used for patient-physician dialogues. <code>DICTATION</code> is
  /// the setting for physicians speaking their notes after seeing a patient. For
  /// more information, see <a>how-it-works-med</a>
  @_s.JsonKey(name: 'Type')
  final Type type;

  MedicalTranscriptionJob({
    this.completionTime,
    this.creationTime,
    this.failureReason,
    this.languageCode,
    this.media,
    this.mediaFormat,
    this.mediaSampleRateHertz,
    this.medicalTranscriptionJobName,
    this.settings,
    this.specialty,
    this.startTime,
    this.transcript,
    this.transcriptionJobStatus,
    this.type,
  });
  factory MedicalTranscriptionJob.fromJson(Map<String, dynamic> json) =>
      _$MedicalTranscriptionJobFromJson(json);
}

/// Provides summary information about a transcription job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MedicalTranscriptionJobSummary {
  /// A timestamp that shows when the job was completed.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CompletionTime')
  final DateTime completionTime;

  /// A timestamp that shows when the medical transcription job was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTime')
  final DateTime creationTime;

  /// If the <code>TranscriptionJobStatus</code> field is <code>FAILED</code>, a
  /// description of the error.
  @_s.JsonKey(name: 'FailureReason')
  final String failureReason;

  /// The language of the transcript in the source audio file.
  @_s.JsonKey(name: 'LanguageCode')
  final LanguageCode languageCode;

  /// The name of a medical transcription job.
  @_s.JsonKey(name: 'MedicalTranscriptionJobName')
  final String medicalTranscriptionJobName;

  /// Indicates the location of the transcription job's output.
  ///
  /// The <code>CUSTOMER_BUCKET</code> is the S3 location provided in the
  /// <code>OutputBucketName</code> field when the
  @_s.JsonKey(name: 'OutputLocationType')
  final OutputLocationType outputLocationType;

  /// The medical specialty of the transcription job. <code>Primary care</code> is
  /// the only valid value.
  @_s.JsonKey(name: 'Specialty')
  final Specialty specialty;

  /// A timestamp that shows when the job began processing.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  /// The status of the medical transcription job.
  @_s.JsonKey(name: 'TranscriptionJobStatus')
  final TranscriptionJobStatus transcriptionJobStatus;

  /// The speech of the clinician in the input audio.
  @_s.JsonKey(name: 'Type')
  final Type type;

  MedicalTranscriptionJobSummary({
    this.completionTime,
    this.creationTime,
    this.failureReason,
    this.languageCode,
    this.medicalTranscriptionJobName,
    this.outputLocationType,
    this.specialty,
    this.startTime,
    this.transcriptionJobStatus,
    this.type,
  });
  factory MedicalTranscriptionJobSummary.fromJson(Map<String, dynamic> json) =>
      _$MedicalTranscriptionJobSummaryFromJson(json);
}

/// Optional settings for the <a>StartMedicalTranscriptionJob</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MedicalTranscriptionSetting {
  /// Instructs Amazon Transcribe Medical to process each audio channel separately
  /// and then merge the transcription output of each channel into a single
  /// transcription.
  ///
  /// Amazon Transcribe Medical also produces a transcription of each item
  /// detected on an audio channel, including the start time and end time of the
  /// item and alternative transcriptions of item. The alternative transcriptions
  /// also come with confidence scores provided by Amazon Transcribe Medical.
  ///
  /// You can't set both <code>ShowSpeakerLabels</code> and
  /// <code>ChannelIdentification</code> in the same request. If you set both,
  /// your request returns a <code>BadRequestException</code>
  @_s.JsonKey(name: 'ChannelIdentification')
  final bool channelIdentification;

  /// The maximum number of alternatives that you tell the service to return. If
  /// you specify the <code>MaxAlternatives</code> field, you must set the
  /// <code>ShowAlternatives</code> field to true.
  @_s.JsonKey(name: 'MaxAlternatives')
  final int maxAlternatives;

  /// The maximum number of speakers to identify in the input audio. If there are
  /// more speakers in the audio than this number, multiple speakers are
  /// identified as a single speaker. If you specify the
  /// <code>MaxSpeakerLabels</code> field, you must set the
  /// <code>ShowSpeakerLabels</code> field to true.
  @_s.JsonKey(name: 'MaxSpeakerLabels')
  final int maxSpeakerLabels;

  /// Determines whether alternative transcripts are generated along with the
  /// transcript that has the highest confidence. If you set
  /// <code>ShowAlternatives</code> field to true, you must also set the maximum
  /// number of alternatives to return in the <code>MaxAlternatives</code> field.
  @_s.JsonKey(name: 'ShowAlternatives')
  final bool showAlternatives;

  /// Determines whether the transcription job uses speaker recognition to
  /// identify different speakers in the input audio. Speaker recongition labels
  /// individual speakers in the audio file. If you set the
  /// <code>ShowSpeakerLabels</code> field to true, you must also set the maximum
  /// number of speaker labels in the <code>MaxSpeakerLabels</code> field.
  ///
  /// You can't set both <code>ShowSpeakerLabels</code> and
  /// <code>ChannelIdentification</code> in the same request. If you set both,
  /// your request returns a <code>BadRequestException</code>.
  @_s.JsonKey(name: 'ShowSpeakerLabels')
  final bool showSpeakerLabels;

  MedicalTranscriptionSetting({
    this.channelIdentification,
    this.maxAlternatives,
    this.maxSpeakerLabels,
    this.showAlternatives,
    this.showSpeakerLabels,
  });
  factory MedicalTranscriptionSetting.fromJson(Map<String, dynamic> json) =>
      _$MedicalTranscriptionSettingFromJson(json);

  Map<String, dynamic> toJson() => _$MedicalTranscriptionSettingToJson(this);
}

enum OutputLocationType {
  @_s.JsonValue('CUSTOMER_BUCKET')
  customerBucket,
  @_s.JsonValue('SERVICE_BUCKET')
  serviceBucket,
}

enum RedactionOutput {
  @_s.JsonValue('redacted')
  redacted,
  @_s.JsonValue('redacted_and_unredacted')
  redactedAndUnredacted,
}

enum RedactionType {
  @_s.JsonValue('PII')
  pii,
}

/// Provides optional settings for the <code>StartTranscriptionJob</code>
/// operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Settings {
  /// Instructs Amazon Transcribe to process each audio channel separately and
  /// then merge the transcription output of each channel into a single
  /// transcription.
  ///
  /// Amazon Transcribe also produces a transcription of each item detected on an
  /// audio channel, including the start time and end time of the item and
  /// alternative transcriptions of the item including the confidence that Amazon
  /// Transcribe has in the transcription.
  ///
  /// You can't set both <code>ShowSpeakerLabels</code> and
  /// <code>ChannelIdentification</code> in the same request. If you set both,
  /// your request returns a <code>BadRequestException</code>.
  @_s.JsonKey(name: 'ChannelIdentification')
  final bool channelIdentification;

  /// The number of alternative transcriptions that the service should return. If
  /// you specify the <code>MaxAlternatives</code> field, you must set the
  /// <code>ShowAlternatives</code> field to true.
  @_s.JsonKey(name: 'MaxAlternatives')
  final int maxAlternatives;

  /// The maximum number of speakers to identify in the input audio. If there are
  /// more speakers in the audio than this number, multiple speakers are
  /// identified as a single speaker. If you specify the
  /// <code>MaxSpeakerLabels</code> field, you must set the
  /// <code>ShowSpeakerLabels</code> field to true.
  @_s.JsonKey(name: 'MaxSpeakerLabels')
  final int maxSpeakerLabels;

  /// Determines whether the transcription contains alternative transcriptions. If
  /// you set the <code>ShowAlternatives</code> field to true, you must also set
  /// the maximum number of alternatives to return in the
  /// <code>MaxAlternatives</code> field.
  @_s.JsonKey(name: 'ShowAlternatives')
  final bool showAlternatives;

  /// Determines whether the transcription job uses speaker recognition to
  /// identify different speakers in the input audio. Speaker recognition labels
  /// individual speakers in the audio file. If you set the
  /// <code>ShowSpeakerLabels</code> field to true, you must also set the maximum
  /// number of speaker labels <code>MaxSpeakerLabels</code> field.
  ///
  /// You can't set both <code>ShowSpeakerLabels</code> and
  /// <code>ChannelIdentification</code> in the same request. If you set both,
  /// your request returns a <code>BadRequestException</code>.
  @_s.JsonKey(name: 'ShowSpeakerLabels')
  final bool showSpeakerLabels;

  /// Set to <code>mask</code> to remove filtered text from the transcript and
  /// replace it with three asterisks ("***") as placeholder text. Set to
  /// <code>remove</code> to remove filtered text from the transcript without
  /// using placeholder text.
  @_s.JsonKey(name: 'VocabularyFilterMethod')
  final VocabularyFilterMethod vocabularyFilterMethod;

  /// The name of the vocabulary filter to use when transcribing the audio. The
  /// filter that you specify must have the same language code as the
  /// transcription job.
  @_s.JsonKey(name: 'VocabularyFilterName')
  final String vocabularyFilterName;

  /// The name of a vocabulary to use when processing the transcription job.
  @_s.JsonKey(name: 'VocabularyName')
  final String vocabularyName;

  Settings({
    this.channelIdentification,
    this.maxAlternatives,
    this.maxSpeakerLabels,
    this.showAlternatives,
    this.showSpeakerLabels,
    this.vocabularyFilterMethod,
    this.vocabularyFilterName,
    this.vocabularyName,
  });
  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsToJson(this);
}

enum Specialty {
  @_s.JsonValue('PRIMARYCARE')
  primarycare,
}

extension on Specialty {
  String toValue() {
    switch (this) {
      case Specialty.primarycare:
        return 'PRIMARYCARE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartMedicalTranscriptionJobResponse {
  /// A batch job submitted to transcribe medical speech to text.
  @_s.JsonKey(name: 'MedicalTranscriptionJob')
  final MedicalTranscriptionJob medicalTranscriptionJob;

  StartMedicalTranscriptionJobResponse({
    this.medicalTranscriptionJob,
  });
  factory StartMedicalTranscriptionJobResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StartMedicalTranscriptionJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartTranscriptionJobResponse {
  /// An object containing details of the asynchronous transcription job.
  @_s.JsonKey(name: 'TranscriptionJob')
  final TranscriptionJob transcriptionJob;

  StartTranscriptionJobResponse({
    this.transcriptionJob,
  });
  factory StartTranscriptionJobResponse.fromJson(Map<String, dynamic> json) =>
      _$StartTranscriptionJobResponseFromJson(json);
}

/// Identifies the location of a transcription.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Transcript {
  /// The S3 object location of the redacted transcript.
  ///
  /// Use this URI to access the redacated transcript. If you specified an S3
  /// bucket in the <code>OutputBucketName</code> field when you created the job,
  /// this is the URI of that bucket. If you chose to store the transcript in
  /// Amazon Transcribe, this is a shareable URL that provides secure access to
  /// that location.
  @_s.JsonKey(name: 'RedactedTranscriptFileUri')
  final String redactedTranscriptFileUri;

  /// The S3 object location of the the transcript.
  ///
  /// Use this URI to access the transcript. If you specified an S3 bucket in the
  /// <code>OutputBucketName</code> field when you created the job, this is the
  /// URI of that bucket. If you chose to store the transcript in Amazon
  /// Transcribe, this is a shareable URL that provides secure access to that
  /// location.
  @_s.JsonKey(name: 'TranscriptFileUri')
  final String transcriptFileUri;

  Transcript({
    this.redactedTranscriptFileUri,
    this.transcriptFileUri,
  });
  factory Transcript.fromJson(Map<String, dynamic> json) =>
      _$TranscriptFromJson(json);
}

/// Describes an asynchronous transcription job that was created with the
/// <code>StartTranscriptionJob</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TranscriptionJob {
  /// A timestamp that shows when the job was completed.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CompletionTime')
  final DateTime completionTime;

  /// An object that describes content redaction settings for the transcription
  /// job.
  @_s.JsonKey(name: 'ContentRedaction')
  final ContentRedaction contentRedaction;

  /// A timestamp that shows when the job was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTime')
  final DateTime creationTime;

  /// If the <code>TranscriptionJobStatus</code> field is <code>FAILED</code>,
  /// this field contains information about why the job failed.
  ///
  /// The <code>FailureReason</code> field can contain one of the following
  /// values:
  ///
  /// <ul>
  /// <li>
  /// <code>Unsupported media format</code> - The media format specified in the
  /// <code>MediaFormat</code> field of the request isn't valid. See the
  /// description of the <code>MediaFormat</code> field for a list of valid
  /// values.
  /// </li>
  /// <li>
  /// <code>The media format provided does not match the detected media
  /// format</code> - The media format of the audio file doesn't match the format
  /// specified in the <code>MediaFormat</code> field in the request. Check the
  /// media format of your media file and make sure that the two values match.
  /// </li>
  /// <li>
  /// <code>Invalid sample rate for audio file</code> - The sample rate specified
  /// in the <code>MediaSampleRateHertz</code> of the request isn't valid. The
  /// sample rate must be between 8000 and 48000 Hertz.
  /// </li>
  /// <li>
  /// <code>The sample rate provided does not match the detected sample
  /// rate</code> - The sample rate in the audio file doesn't match the sample
  /// rate specified in the <code>MediaSampleRateHertz</code> field in the
  /// request. Check the sample rate of your media file and make sure that the two
  /// values match.
  /// </li>
  /// <li>
  /// <code>Invalid file size: file size too large</code> - The size of your audio
  /// file is larger than Amazon Transcribe can process. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/limits-guidelines.html#limits">Limits</a>
  /// in the <i>Amazon Transcribe Developer Guide</i>.
  /// </li>
  /// <li>
  /// <code>Invalid number of channels: number of channels too large</code> - Your
  /// audio contains more channels than Amazon Transcribe is configured to
  /// process. To request additional channels, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html#limits-amazon-transcribe">Amazon
  /// Transcribe Limits</a> in the <i>Amazon Web Services General Reference</i>.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'FailureReason')
  final String failureReason;

  /// Provides information about how a transcription job is executed.
  @_s.JsonKey(name: 'JobExecutionSettings')
  final JobExecutionSettings jobExecutionSettings;

  /// The language code for the input speech.
  @_s.JsonKey(name: 'LanguageCode')
  final LanguageCode languageCode;

  /// An object that describes the input media for the transcription job.
  @_s.JsonKey(name: 'Media')
  final Media media;

  /// The format of the input media file.
  @_s.JsonKey(name: 'MediaFormat')
  final MediaFormat mediaFormat;

  /// The sample rate, in Hertz, of the audio track in the input media file.
  @_s.JsonKey(name: 'MediaSampleRateHertz')
  final int mediaSampleRateHertz;

  /// Optional settings for the transcription job. Use these settings to turn on
  /// speaker recognition, to set the maximum number of speakers that should be
  /// identified and to specify a custom vocabulary to use when processing the
  /// transcription job.
  @_s.JsonKey(name: 'Settings')
  final Settings settings;

  /// A timestamp that shows with the job was started processing.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  /// An object that describes the output of the transcription job.
  @_s.JsonKey(name: 'Transcript')
  final Transcript transcript;

  /// The name of the transcription job.
  @_s.JsonKey(name: 'TranscriptionJobName')
  final String transcriptionJobName;

  /// The status of the transcription job.
  @_s.JsonKey(name: 'TranscriptionJobStatus')
  final TranscriptionJobStatus transcriptionJobStatus;

  TranscriptionJob({
    this.completionTime,
    this.contentRedaction,
    this.creationTime,
    this.failureReason,
    this.jobExecutionSettings,
    this.languageCode,
    this.media,
    this.mediaFormat,
    this.mediaSampleRateHertz,
    this.settings,
    this.startTime,
    this.transcript,
    this.transcriptionJobName,
    this.transcriptionJobStatus,
  });
  factory TranscriptionJob.fromJson(Map<String, dynamic> json) =>
      _$TranscriptionJobFromJson(json);
}

enum TranscriptionJobStatus {
  @_s.JsonValue('QUEUED')
  queued,
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('COMPLETED')
  completed,
}

extension on TranscriptionJobStatus {
  String toValue() {
    switch (this) {
      case TranscriptionJobStatus.queued:
        return 'QUEUED';
      case TranscriptionJobStatus.inProgress:
        return 'IN_PROGRESS';
      case TranscriptionJobStatus.failed:
        return 'FAILED';
      case TranscriptionJobStatus.completed:
        return 'COMPLETED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Provides a summary of information about a transcription job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TranscriptionJobSummary {
  /// A timestamp that shows when the job was completed.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CompletionTime')
  final DateTime completionTime;

  /// The content redaction settings of the transcription job.
  @_s.JsonKey(name: 'ContentRedaction')
  final ContentRedaction contentRedaction;

  /// A timestamp that shows when the job was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTime')
  final DateTime creationTime;

  /// If the <code>TranscriptionJobStatus</code> field is <code>FAILED</code>, a
  /// description of the error.
  @_s.JsonKey(name: 'FailureReason')
  final String failureReason;

  /// The language code for the input speech.
  @_s.JsonKey(name: 'LanguageCode')
  final LanguageCode languageCode;

  /// Indicates the location of the output of the transcription job.
  ///
  /// If the value is <code>CUSTOMER_BUCKET</code> then the location is the S3
  /// bucket specified in the <code>outputBucketName</code> field when the
  /// transcription job was started with the <code>StartTranscriptionJob</code>
  /// operation.
  ///
  /// If the value is <code>SERVICE_BUCKET</code> then the output is stored by
  /// Amazon Transcribe and can be retrieved using the URI in the
  /// <code>GetTranscriptionJob</code> response's <code>TranscriptFileUri</code>
  /// field.
  @_s.JsonKey(name: 'OutputLocationType')
  final OutputLocationType outputLocationType;

  /// A timestamp that shows when the job started processing.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  /// The name of the transcription job.
  @_s.JsonKey(name: 'TranscriptionJobName')
  final String transcriptionJobName;

  /// The status of the transcription job. When the status is
  /// <code>COMPLETED</code>, use the <code>GetTranscriptionJob</code> operation
  /// to get the results of the transcription.
  @_s.JsonKey(name: 'TranscriptionJobStatus')
  final TranscriptionJobStatus transcriptionJobStatus;

  TranscriptionJobSummary({
    this.completionTime,
    this.contentRedaction,
    this.creationTime,
    this.failureReason,
    this.languageCode,
    this.outputLocationType,
    this.startTime,
    this.transcriptionJobName,
    this.transcriptionJobStatus,
  });
  factory TranscriptionJobSummary.fromJson(Map<String, dynamic> json) =>
      _$TranscriptionJobSummaryFromJson(json);
}

enum Type {
  @_s.JsonValue('CONVERSATION')
  conversation,
  @_s.JsonValue('DICTATION')
  dictation,
}

extension on Type {
  String toValue() {
    switch (this) {
      case Type.conversation:
        return 'CONVERSATION';
      case Type.dictation:
        return 'DICTATION';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateVocabularyFilterResponse {
  /// The language code of the words in the vocabulary filter.
  @_s.JsonKey(name: 'LanguageCode')
  final LanguageCode languageCode;

  /// The date and time that the vocabulary filter was updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedTime')
  final DateTime lastModifiedTime;

  /// The name of the updated vocabulary filter.
  @_s.JsonKey(name: 'VocabularyFilterName')
  final String vocabularyFilterName;

  UpdateVocabularyFilterResponse({
    this.languageCode,
    this.lastModifiedTime,
    this.vocabularyFilterName,
  });
  factory UpdateVocabularyFilterResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateVocabularyFilterResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateVocabularyResponse {
  /// The language code of the vocabulary entries.
  @_s.JsonKey(name: 'LanguageCode')
  final LanguageCode languageCode;

  /// The date and time that the vocabulary was updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedTime')
  final DateTime lastModifiedTime;

  /// The name of the vocabulary that was updated.
  @_s.JsonKey(name: 'VocabularyName')
  final String vocabularyName;

  /// The processing state of the vocabulary. When the
  /// <code>VocabularyState</code> field contains <code>READY</code> the
  /// vocabulary is ready to be used in a <code>StartTranscriptionJob</code>
  /// request.
  @_s.JsonKey(name: 'VocabularyState')
  final VocabularyState vocabularyState;

  UpdateVocabularyResponse({
    this.languageCode,
    this.lastModifiedTime,
    this.vocabularyName,
    this.vocabularyState,
  });
  factory UpdateVocabularyResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateVocabularyResponseFromJson(json);
}

/// Provides information about a vocabulary filter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VocabularyFilterInfo {
  /// The language code of the words in the vocabulary filter.
  @_s.JsonKey(name: 'LanguageCode')
  final LanguageCode languageCode;

  /// The date and time that the vocabulary was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedTime')
  final DateTime lastModifiedTime;

  /// The name of the vocabulary filter. The name must be unique in the account
  /// that holds the filter.
  @_s.JsonKey(name: 'VocabularyFilterName')
  final String vocabularyFilterName;

  VocabularyFilterInfo({
    this.languageCode,
    this.lastModifiedTime,
    this.vocabularyFilterName,
  });
  factory VocabularyFilterInfo.fromJson(Map<String, dynamic> json) =>
      _$VocabularyFilterInfoFromJson(json);
}

enum VocabularyFilterMethod {
  @_s.JsonValue('remove')
  remove,
  @_s.JsonValue('mask')
  mask,
}

/// Provides information about a custom vocabulary.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VocabularyInfo {
  /// The language code of the vocabulary entries.
  @_s.JsonKey(name: 'LanguageCode')
  final LanguageCode languageCode;

  /// The date and time that the vocabulary was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedTime')
  final DateTime lastModifiedTime;

  /// The name of the vocabulary.
  @_s.JsonKey(name: 'VocabularyName')
  final String vocabularyName;

  /// The processing state of the vocabulary. If the state is <code>READY</code>
  /// you can use the vocabulary in a <code>StartTranscriptionJob</code> request.
  @_s.JsonKey(name: 'VocabularyState')
  final VocabularyState vocabularyState;

  VocabularyInfo({
    this.languageCode,
    this.lastModifiedTime,
    this.vocabularyName,
    this.vocabularyState,
  });
  factory VocabularyInfo.fromJson(Map<String, dynamic> json) =>
      _$VocabularyInfoFromJson(json);
}

enum VocabularyState {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('READY')
  ready,
  @_s.JsonValue('FAILED')
  failed,
}

extension on VocabularyState {
  String toValue() {
    switch (this) {
      case VocabularyState.pending:
        return 'PENDING';
      case VocabularyState.ready:
        return 'READY';
      case VocabularyState.failed:
        return 'FAILED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String type, String message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalFailureException extends _s.GenericAwsException {
  InternalFailureException({String type, String message})
      : super(type: type, code: 'InternalFailureException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String type, String message})
      : super(type: type, code: 'NotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalFailureException': (type, message) =>
      InternalFailureException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
};
