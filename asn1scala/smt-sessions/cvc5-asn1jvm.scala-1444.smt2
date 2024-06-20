; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39614 () Bool)

(assert start!39614)

(declare-fun b!178838 () Bool)

(declare-fun res!148360 () Bool)

(declare-fun e!124465 () Bool)

(assert (=> b!178838 (=> res!148360 e!124465)))

(declare-datatypes ((array!9629 0))(
  ( (array!9630 (arr!5176 (Array (_ BitVec 32) (_ BitVec 8))) (size!4246 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7600 0))(
  ( (BitStream!7601 (buf!4689 array!9629) (currentByte!8887 (_ BitVec 32)) (currentBit!8882 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12872 0))(
  ( (Unit!12873) )
))
(declare-datatypes ((tuple2!15416 0))(
  ( (tuple2!15417 (_1!8353 Unit!12872) (_2!8353 BitStream!7600)) )
))
(declare-fun lt!274409 () tuple2!15416)

(declare-fun lt!274408 () tuple2!15416)

(declare-fun isPrefixOf!0 (BitStream!7600 BitStream!7600) Bool)

(assert (=> b!178838 (= res!148360 (not (isPrefixOf!0 (_2!8353 lt!274409) (_2!8353 lt!274408))))))

(declare-fun b!178839 () Bool)

(declare-fun e!124459 () Bool)

(declare-fun e!124458 () Bool)

(assert (=> b!178839 (= e!124459 e!124458)))

(declare-fun res!148371 () Bool)

(assert (=> b!178839 (=> (not res!148371) (not e!124458))))

(declare-fun lt!274411 () (_ BitVec 64))

(declare-fun lt!274407 () (_ BitVec 64))

(assert (=> b!178839 (= res!148371 (= lt!274411 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!274407)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!178839 (= lt!274411 (bitIndex!0 (size!4246 (buf!4689 (_2!8353 lt!274409))) (currentByte!8887 (_2!8353 lt!274409)) (currentBit!8882 (_2!8353 lt!274409))))))

(declare-fun thiss!1204 () BitStream!7600)

(assert (=> b!178839 (= lt!274407 (bitIndex!0 (size!4246 (buf!4689 thiss!1204)) (currentByte!8887 thiss!1204) (currentBit!8882 thiss!1204)))))

(declare-fun b!178840 () Bool)

(declare-fun res!148364 () Bool)

(assert (=> b!178840 (=> res!148364 e!124465)))

(assert (=> b!178840 (= res!148364 (not (isPrefixOf!0 thiss!1204 (_2!8353 lt!274409))))))

(declare-fun b!178841 () Bool)

(assert (=> b!178841 (= e!124465 true)))

(declare-fun e!124457 () Bool)

(assert (=> b!178841 e!124457))

(declare-fun res!148359 () Bool)

(assert (=> b!178841 (=> (not res!148359) (not e!124457))))

(declare-datatypes ((tuple2!15418 0))(
  ( (tuple2!15419 (_1!8354 BitStream!7600) (_2!8354 Bool)) )
))
(declare-fun lt!274401 () tuple2!15418)

(declare-fun lt!274402 () tuple2!15418)

(assert (=> b!178841 (= res!148359 (= (bitIndex!0 (size!4246 (buf!4689 (_1!8354 lt!274401))) (currentByte!8887 (_1!8354 lt!274401)) (currentBit!8882 (_1!8354 lt!274401))) (bitIndex!0 (size!4246 (buf!4689 (_1!8354 lt!274402))) (currentByte!8887 (_1!8354 lt!274402)) (currentBit!8882 (_1!8354 lt!274402)))))))

(declare-fun lt!274410 () Unit!12872)

(declare-fun lt!274406 () BitStream!7600)

(declare-fun readBitPrefixLemma!0 (BitStream!7600 BitStream!7600) Unit!12872)

(assert (=> b!178841 (= lt!274410 (readBitPrefixLemma!0 lt!274406 (_2!8353 lt!274408)))))

(declare-fun readBitPure!0 (BitStream!7600) tuple2!15418)

(assert (=> b!178841 (= lt!274402 (readBitPure!0 (BitStream!7601 (buf!4689 (_2!8353 lt!274408)) (currentByte!8887 thiss!1204) (currentBit!8882 thiss!1204))))))

(assert (=> b!178841 (= lt!274401 (readBitPure!0 lt!274406))))

(declare-fun e!124463 () Bool)

(assert (=> b!178841 e!124463))

(declare-fun res!148365 () Bool)

(assert (=> b!178841 (=> (not res!148365) (not e!124463))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!178841 (= res!148365 (invariant!0 (currentBit!8882 thiss!1204) (currentByte!8887 thiss!1204) (size!4246 (buf!4689 (_2!8353 lt!274409)))))))

(assert (=> b!178841 (= lt!274406 (BitStream!7601 (buf!4689 (_2!8353 lt!274409)) (currentByte!8887 thiss!1204) (currentBit!8882 thiss!1204)))))

(declare-fun b!178842 () Bool)

(assert (=> b!178842 (= e!124463 (invariant!0 (currentBit!8882 thiss!1204) (currentByte!8887 thiss!1204) (size!4246 (buf!4689 (_2!8353 lt!274408)))))))

(declare-fun res!148366 () Bool)

(declare-fun e!124464 () Bool)

(assert (=> start!39614 (=> (not res!148366) (not e!124464))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!39614 (= res!148366 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39614 e!124464))

(assert (=> start!39614 true))

(declare-fun e!124462 () Bool)

(declare-fun inv!12 (BitStream!7600) Bool)

(assert (=> start!39614 (and (inv!12 thiss!1204) e!124462)))

(declare-fun b!178843 () Bool)

(declare-fun e!124456 () Bool)

(assert (=> b!178843 (= e!124464 (not e!124456))))

(declare-fun res!148370 () Bool)

(assert (=> b!178843 (=> res!148370 e!124456)))

(declare-fun lt!274403 () (_ BitVec 64))

(declare-fun lt!274404 () (_ BitVec 64))

(assert (=> b!178843 (= res!148370 (not (= lt!274403 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!274404))))))

(assert (=> b!178843 (= lt!274403 (bitIndex!0 (size!4246 (buf!4689 (_2!8353 lt!274409))) (currentByte!8887 (_2!8353 lt!274409)) (currentBit!8882 (_2!8353 lt!274409))))))

(assert (=> b!178843 (= lt!274404 (bitIndex!0 (size!4246 (buf!4689 thiss!1204)) (currentByte!8887 thiss!1204) (currentBit!8882 thiss!1204)))))

(assert (=> b!178843 e!124459))

(declare-fun res!148358 () Bool)

(assert (=> b!178843 (=> (not res!148358) (not e!124459))))

(assert (=> b!178843 (= res!148358 (= (size!4246 (buf!4689 thiss!1204)) (size!4246 (buf!4689 (_2!8353 lt!274409)))))))

(declare-fun lt!274405 () Bool)

(declare-fun appendBit!0 (BitStream!7600 Bool) tuple2!15416)

(assert (=> b!178843 (= lt!274409 (appendBit!0 thiss!1204 lt!274405))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!178843 (= lt!274405 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!178844 () Bool)

(declare-fun e!124461 () Bool)

(declare-fun lt!274399 () tuple2!15418)

(assert (=> b!178844 (= e!124461 (= (bitIndex!0 (size!4246 (buf!4689 (_1!8354 lt!274399))) (currentByte!8887 (_1!8354 lt!274399)) (currentBit!8882 (_1!8354 lt!274399))) lt!274411))))

(declare-fun b!178845 () Bool)

(assert (=> b!178845 (= e!124456 e!124465)))

(declare-fun res!148357 () Bool)

(assert (=> b!178845 (=> res!148357 e!124465)))

(declare-fun lt!274400 () (_ BitVec 64))

(assert (=> b!178845 (= res!148357 (not (= lt!274400 (bvsub (bvsub (bvadd lt!274403 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!178845 (= lt!274400 (bitIndex!0 (size!4246 (buf!4689 (_2!8353 lt!274408))) (currentByte!8887 (_2!8353 lt!274408)) (currentBit!8882 (_2!8353 lt!274408))))))

(assert (=> b!178845 (isPrefixOf!0 thiss!1204 (_2!8353 lt!274408))))

(declare-fun lt!274412 () Unit!12872)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7600 BitStream!7600 BitStream!7600) Unit!12872)

(assert (=> b!178845 (= lt!274412 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8353 lt!274409) (_2!8353 lt!274408)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7600 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15416)

(assert (=> b!178845 (= lt!274408 (appendBitsLSBFirstLoopTR!0 (_2!8353 lt!274409) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!178846 () Bool)

(declare-fun res!148367 () Bool)

(assert (=> b!178846 (=> (not res!148367) (not e!124464))))

(assert (=> b!178846 (= res!148367 (not (= i!590 nBits!348)))))

(declare-fun b!178847 () Bool)

(declare-fun res!148356 () Bool)

(assert (=> b!178847 (=> res!148356 e!124465)))

(assert (=> b!178847 (= res!148356 (or (not (= (size!4246 (buf!4689 (_2!8353 lt!274408))) (size!4246 (buf!4689 thiss!1204)))) (not (= lt!274400 (bvsub (bvadd lt!274404 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!178848 () Bool)

(declare-fun res!148362 () Bool)

(assert (=> b!178848 (=> (not res!148362) (not e!124458))))

(assert (=> b!178848 (= res!148362 (isPrefixOf!0 thiss!1204 (_2!8353 lt!274409)))))

(declare-fun b!178849 () Bool)

(declare-fun res!148361 () Bool)

(assert (=> b!178849 (=> res!148361 e!124465)))

(assert (=> b!178849 (= res!148361 (not (invariant!0 (currentBit!8882 (_2!8353 lt!274408)) (currentByte!8887 (_2!8353 lt!274408)) (size!4246 (buf!4689 (_2!8353 lt!274408))))))))

(declare-fun b!178850 () Bool)

(declare-fun res!148369 () Bool)

(assert (=> b!178850 (=> (not res!148369) (not e!124464))))

(assert (=> b!178850 (= res!148369 (invariant!0 (currentBit!8882 thiss!1204) (currentByte!8887 thiss!1204) (size!4246 (buf!4689 thiss!1204))))))

(declare-fun b!178851 () Bool)

(declare-fun array_inv!3987 (array!9629) Bool)

(assert (=> b!178851 (= e!124462 (array_inv!3987 (buf!4689 thiss!1204)))))

(declare-fun b!178852 () Bool)

(declare-fun res!148363 () Bool)

(assert (=> b!178852 (=> (not res!148363) (not e!124464))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!178852 (= res!148363 (validate_offset_bits!1 ((_ sign_extend 32) (size!4246 (buf!4689 thiss!1204))) ((_ sign_extend 32) (currentByte!8887 thiss!1204)) ((_ sign_extend 32) (currentBit!8882 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!178853 () Bool)

(assert (=> b!178853 (= e!124457 (= (_2!8354 lt!274401) (_2!8354 lt!274402)))))

(declare-fun b!178854 () Bool)

(assert (=> b!178854 (= e!124458 e!124461)))

(declare-fun res!148368 () Bool)

(assert (=> b!178854 (=> (not res!148368) (not e!124461))))

(assert (=> b!178854 (= res!148368 (and (= (_2!8354 lt!274399) lt!274405) (= (_1!8354 lt!274399) (_2!8353 lt!274409))))))

(declare-fun readerFrom!0 (BitStream!7600 (_ BitVec 32) (_ BitVec 32)) BitStream!7600)

(assert (=> b!178854 (= lt!274399 (readBitPure!0 (readerFrom!0 (_2!8353 lt!274409) (currentBit!8882 thiss!1204) (currentByte!8887 thiss!1204))))))

(assert (= (and start!39614 res!148366) b!178852))

(assert (= (and b!178852 res!148363) b!178850))

(assert (= (and b!178850 res!148369) b!178846))

(assert (= (and b!178846 res!148367) b!178843))

(assert (= (and b!178843 res!148358) b!178839))

(assert (= (and b!178839 res!148371) b!178848))

(assert (= (and b!178848 res!148362) b!178854))

(assert (= (and b!178854 res!148368) b!178844))

(assert (= (and b!178843 (not res!148370)) b!178845))

(assert (= (and b!178845 (not res!148357)) b!178849))

(assert (= (and b!178849 (not res!148361)) b!178847))

(assert (= (and b!178847 (not res!148356)) b!178838))

(assert (= (and b!178838 (not res!148360)) b!178840))

(assert (= (and b!178840 (not res!148364)) b!178841))

(assert (= (and b!178841 res!148365) b!178842))

(assert (= (and b!178841 res!148359) b!178853))

(assert (= start!39614 b!178851))

(declare-fun m!278923 () Bool)

(assert (=> b!178842 m!278923))

(declare-fun m!278925 () Bool)

(assert (=> b!178854 m!278925))

(assert (=> b!178854 m!278925))

(declare-fun m!278927 () Bool)

(assert (=> b!178854 m!278927))

(declare-fun m!278929 () Bool)

(assert (=> b!178841 m!278929))

(declare-fun m!278931 () Bool)

(assert (=> b!178841 m!278931))

(declare-fun m!278933 () Bool)

(assert (=> b!178841 m!278933))

(declare-fun m!278935 () Bool)

(assert (=> b!178841 m!278935))

(declare-fun m!278937 () Bool)

(assert (=> b!178841 m!278937))

(declare-fun m!278939 () Bool)

(assert (=> b!178841 m!278939))

(declare-fun m!278941 () Bool)

(assert (=> b!178839 m!278941))

(declare-fun m!278943 () Bool)

(assert (=> b!178839 m!278943))

(declare-fun m!278945 () Bool)

(assert (=> b!178838 m!278945))

(declare-fun m!278947 () Bool)

(assert (=> b!178845 m!278947))

(declare-fun m!278949 () Bool)

(assert (=> b!178845 m!278949))

(declare-fun m!278951 () Bool)

(assert (=> b!178845 m!278951))

(declare-fun m!278953 () Bool)

(assert (=> b!178845 m!278953))

(assert (=> b!178843 m!278941))

(assert (=> b!178843 m!278943))

(declare-fun m!278955 () Bool)

(assert (=> b!178843 m!278955))

(declare-fun m!278957 () Bool)

(assert (=> b!178844 m!278957))

(declare-fun m!278959 () Bool)

(assert (=> b!178848 m!278959))

(declare-fun m!278961 () Bool)

(assert (=> b!178852 m!278961))

(declare-fun m!278963 () Bool)

(assert (=> b!178850 m!278963))

(declare-fun m!278965 () Bool)

(assert (=> start!39614 m!278965))

(declare-fun m!278967 () Bool)

(assert (=> b!178851 m!278967))

(assert (=> b!178840 m!278959))

(declare-fun m!278969 () Bool)

(assert (=> b!178849 m!278969))

(push 1)

