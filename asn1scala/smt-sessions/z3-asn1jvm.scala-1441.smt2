; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39598 () Bool)

(assert start!39598)

(declare-fun b!178408 () Bool)

(declare-fun res!147957 () Bool)

(declare-fun e!124243 () Bool)

(assert (=> b!178408 (=> (not res!147957) (not e!124243))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!178408 (= res!147957 (not (= i!590 nBits!348)))))

(declare-fun b!178409 () Bool)

(declare-fun e!124246 () Bool)

(declare-fun e!124244 () Bool)

(assert (=> b!178409 (= e!124246 e!124244)))

(declare-fun res!147953 () Bool)

(assert (=> b!178409 (=> res!147953 e!124244)))

(declare-datatypes ((array!9613 0))(
  ( (array!9614 (arr!5168 (Array (_ BitVec 32) (_ BitVec 8))) (size!4238 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7584 0))(
  ( (BitStream!7585 (buf!4681 array!9613) (currentByte!8879 (_ BitVec 32)) (currentBit!8874 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12856 0))(
  ( (Unit!12857) )
))
(declare-datatypes ((tuple2!15384 0))(
  ( (tuple2!15385 (_1!8337 Unit!12856) (_2!8337 BitStream!7584)) )
))
(declare-fun lt!274110 () tuple2!15384)

(declare-fun lt!274109 () tuple2!15384)

(assert (=> b!178409 (= res!147953 (not (= (size!4238 (buf!4681 (_2!8337 lt!274110))) (size!4238 (buf!4681 (_2!8337 lt!274109))))))))

(declare-fun thiss!1204 () BitStream!7584)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!178409 (invariant!0 (currentBit!8874 thiss!1204) (currentByte!8879 thiss!1204) (size!4238 (buf!4681 (_2!8337 lt!274110))))))

(declare-fun b!178410 () Bool)

(declare-fun res!147959 () Bool)

(assert (=> b!178410 (=> res!147959 e!124244)))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!178410 (= res!147959 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!4238 (buf!4681 (_2!8337 lt!274110)))) ((_ sign_extend 32) (currentByte!8879 thiss!1204)) ((_ sign_extend 32) (currentBit!8874 thiss!1204)))))))

(declare-fun b!178411 () Bool)

(declare-fun res!147966 () Bool)

(assert (=> b!178411 (=> (not res!147966) (not e!124243))))

(assert (=> b!178411 (= res!147966 (invariant!0 (currentBit!8874 thiss!1204) (currentByte!8879 thiss!1204) (size!4238 (buf!4681 thiss!1204))))))

(declare-fun b!178412 () Bool)

(declare-fun e!124241 () Bool)

(assert (=> b!178412 (= e!124241 e!124246)))

(declare-fun res!147963 () Bool)

(assert (=> b!178412 (=> res!147963 e!124246)))

(declare-fun lt!274118 () (_ BitVec 64))

(declare-fun lt!274114 () (_ BitVec 64))

(assert (=> b!178412 (= res!147963 (not (= lt!274114 (bvsub (bvsub (bvadd lt!274118 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!178412 (= lt!274114 (bitIndex!0 (size!4238 (buf!4681 (_2!8337 lt!274109))) (currentByte!8879 (_2!8337 lt!274109)) (currentBit!8874 (_2!8337 lt!274109))))))

(declare-fun isPrefixOf!0 (BitStream!7584 BitStream!7584) Bool)

(assert (=> b!178412 (isPrefixOf!0 thiss!1204 (_2!8337 lt!274109))))

(declare-fun lt!274116 () Unit!12856)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7584 BitStream!7584 BitStream!7584) Unit!12856)

(assert (=> b!178412 (= lt!274116 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8337 lt!274110) (_2!8337 lt!274109)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7584 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15384)

(assert (=> b!178412 (= lt!274109 (appendBitsLSBFirstLoopTR!0 (_2!8337 lt!274110) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!178413 () Bool)

(declare-fun res!147951 () Bool)

(assert (=> b!178413 (=> res!147951 e!124246)))

(declare-fun lt!274117 () (_ BitVec 64))

(assert (=> b!178413 (= res!147951 (or (not (= (size!4238 (buf!4681 (_2!8337 lt!274109))) (size!4238 (buf!4681 thiss!1204)))) (not (= lt!274114 (bvsub (bvadd lt!274117 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!178414 () Bool)

(declare-fun e!124242 () Bool)

(declare-fun e!124238 () Bool)

(assert (=> b!178414 (= e!124242 e!124238)))

(declare-fun res!147962 () Bool)

(assert (=> b!178414 (=> (not res!147962) (not e!124238))))

(declare-fun lt!274112 () (_ BitVec 64))

(declare-fun lt!274113 () (_ BitVec 64))

(assert (=> b!178414 (= res!147962 (= lt!274112 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!274113)))))

(assert (=> b!178414 (= lt!274112 (bitIndex!0 (size!4238 (buf!4681 (_2!8337 lt!274110))) (currentByte!8879 (_2!8337 lt!274110)) (currentBit!8874 (_2!8337 lt!274110))))))

(assert (=> b!178414 (= lt!274113 (bitIndex!0 (size!4238 (buf!4681 thiss!1204)) (currentByte!8879 thiss!1204) (currentBit!8874 thiss!1204)))))

(declare-fun b!178415 () Bool)

(declare-fun res!147960 () Bool)

(assert (=> b!178415 (=> (not res!147960) (not e!124243))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!178415 (= res!147960 (validate_offset_bits!1 ((_ sign_extend 32) (size!4238 (buf!4681 thiss!1204))) ((_ sign_extend 32) (currentByte!8879 thiss!1204)) ((_ sign_extend 32) (currentBit!8874 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!178416 () Bool)

(declare-fun res!147955 () Bool)

(assert (=> b!178416 (=> res!147955 e!124244)))

(declare-fun arrayBitRangesEq!0 (array!9613 array!9613 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!178416 (= res!147955 (not (arrayBitRangesEq!0 (buf!4681 (_2!8337 lt!274110)) (buf!4681 (_2!8337 lt!274109)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4238 (buf!4681 (_2!8337 lt!274110))) (currentByte!8879 thiss!1204) (currentBit!8874 thiss!1204))))))))

(declare-fun b!178417 () Bool)

(declare-fun res!147964 () Bool)

(assert (=> b!178417 (=> (not res!147964) (not e!124238))))

(assert (=> b!178417 (= res!147964 (isPrefixOf!0 thiss!1204 (_2!8337 lt!274110)))))

(declare-fun b!178418 () Bool)

(declare-fun res!147961 () Bool)

(assert (=> b!178418 (=> res!147961 e!124246)))

(assert (=> b!178418 (= res!147961 (not (invariant!0 (currentBit!8874 (_2!8337 lt!274109)) (currentByte!8879 (_2!8337 lt!274109)) (size!4238 (buf!4681 (_2!8337 lt!274109))))))))

(declare-fun b!178419 () Bool)

(declare-fun e!124240 () Bool)

(declare-datatypes ((tuple2!15386 0))(
  ( (tuple2!15387 (_1!8338 BitStream!7584) (_2!8338 Bool)) )
))
(declare-fun lt!274108 () tuple2!15386)

(assert (=> b!178419 (= e!124240 (= (bitIndex!0 (size!4238 (buf!4681 (_1!8338 lt!274108))) (currentByte!8879 (_1!8338 lt!274108)) (currentBit!8874 (_1!8338 lt!274108))) lt!274112))))

(declare-fun b!178420 () Bool)

(assert (=> b!178420 (= e!124244 true)))

(declare-fun lt!274115 () tuple2!15386)

(declare-fun readBitPure!0 (BitStream!7584) tuple2!15386)

(assert (=> b!178420 (= lt!274115 (readBitPure!0 (BitStream!7585 (buf!4681 (_2!8337 lt!274109)) (currentByte!8879 thiss!1204) (currentBit!8874 thiss!1204))))))

(declare-fun lt!274111 () tuple2!15386)

(assert (=> b!178420 (= lt!274111 (readBitPure!0 (BitStream!7585 (buf!4681 (_2!8337 lt!274110)) (currentByte!8879 thiss!1204) (currentBit!8874 thiss!1204))))))

(assert (=> b!178420 (invariant!0 (currentBit!8874 thiss!1204) (currentByte!8879 thiss!1204) (size!4238 (buf!4681 (_2!8337 lt!274109))))))

(declare-fun res!147958 () Bool)

(assert (=> start!39598 (=> (not res!147958) (not e!124243))))

(assert (=> start!39598 (= res!147958 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39598 e!124243))

(assert (=> start!39598 true))

(declare-fun e!124245 () Bool)

(declare-fun inv!12 (BitStream!7584) Bool)

(assert (=> start!39598 (and (inv!12 thiss!1204) e!124245)))

(declare-fun b!178421 () Bool)

(assert (=> b!178421 (= e!124238 e!124240)))

(declare-fun res!147950 () Bool)

(assert (=> b!178421 (=> (not res!147950) (not e!124240))))

(declare-fun lt!274107 () Bool)

(assert (=> b!178421 (= res!147950 (and (= (_2!8338 lt!274108) lt!274107) (= (_1!8338 lt!274108) (_2!8337 lt!274110))))))

(declare-fun readerFrom!0 (BitStream!7584 (_ BitVec 32) (_ BitVec 32)) BitStream!7584)

(assert (=> b!178421 (= lt!274108 (readBitPure!0 (readerFrom!0 (_2!8337 lt!274110) (currentBit!8874 thiss!1204) (currentByte!8879 thiss!1204))))))

(declare-fun b!178422 () Bool)

(declare-fun res!147956 () Bool)

(assert (=> b!178422 (=> res!147956 e!124246)))

(assert (=> b!178422 (= res!147956 (not (isPrefixOf!0 (_2!8337 lt!274110) (_2!8337 lt!274109))))))

(declare-fun b!178423 () Bool)

(declare-fun array_inv!3979 (array!9613) Bool)

(assert (=> b!178423 (= e!124245 (array_inv!3979 (buf!4681 thiss!1204)))))

(declare-fun b!178424 () Bool)

(assert (=> b!178424 (= e!124243 (not e!124241))))

(declare-fun res!147965 () Bool)

(assert (=> b!178424 (=> res!147965 e!124241)))

(assert (=> b!178424 (= res!147965 (not (= lt!274118 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!274117))))))

(assert (=> b!178424 (= lt!274118 (bitIndex!0 (size!4238 (buf!4681 (_2!8337 lt!274110))) (currentByte!8879 (_2!8337 lt!274110)) (currentBit!8874 (_2!8337 lt!274110))))))

(assert (=> b!178424 (= lt!274117 (bitIndex!0 (size!4238 (buf!4681 thiss!1204)) (currentByte!8879 thiss!1204) (currentBit!8874 thiss!1204)))))

(assert (=> b!178424 e!124242))

(declare-fun res!147952 () Bool)

(assert (=> b!178424 (=> (not res!147952) (not e!124242))))

(assert (=> b!178424 (= res!147952 (= (size!4238 (buf!4681 thiss!1204)) (size!4238 (buf!4681 (_2!8337 lt!274110)))))))

(declare-fun appendBit!0 (BitStream!7584 Bool) tuple2!15384)

(assert (=> b!178424 (= lt!274110 (appendBit!0 thiss!1204 lt!274107))))

(assert (=> b!178424 (= lt!274107 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!178425 () Bool)

(declare-fun res!147954 () Bool)

(assert (=> b!178425 (=> res!147954 e!124246)))

(assert (=> b!178425 (= res!147954 (not (isPrefixOf!0 thiss!1204 (_2!8337 lt!274110))))))

(assert (= (and start!39598 res!147958) b!178415))

(assert (= (and b!178415 res!147960) b!178411))

(assert (= (and b!178411 res!147966) b!178408))

(assert (= (and b!178408 res!147957) b!178424))

(assert (= (and b!178424 res!147952) b!178414))

(assert (= (and b!178414 res!147962) b!178417))

(assert (= (and b!178417 res!147964) b!178421))

(assert (= (and b!178421 res!147950) b!178419))

(assert (= (and b!178424 (not res!147965)) b!178412))

(assert (= (and b!178412 (not res!147963)) b!178418))

(assert (= (and b!178418 (not res!147961)) b!178413))

(assert (= (and b!178413 (not res!147951)) b!178422))

(assert (= (and b!178422 (not res!147956)) b!178425))

(assert (= (and b!178425 (not res!147954)) b!178409))

(assert (= (and b!178409 (not res!147953)) b!178410))

(assert (= (and b!178410 (not res!147959)) b!178416))

(assert (= (and b!178416 (not res!147955)) b!178420))

(assert (= start!39598 b!178423))

(declare-fun m!278539 () Bool)

(assert (=> b!178424 m!278539))

(declare-fun m!278541 () Bool)

(assert (=> b!178424 m!278541))

(declare-fun m!278543 () Bool)

(assert (=> b!178424 m!278543))

(declare-fun m!278545 () Bool)

(assert (=> b!178425 m!278545))

(declare-fun m!278547 () Bool)

(assert (=> b!178419 m!278547))

(declare-fun m!278549 () Bool)

(assert (=> b!178416 m!278549))

(declare-fun m!278551 () Bool)

(assert (=> b!178416 m!278551))

(assert (=> b!178417 m!278545))

(declare-fun m!278553 () Bool)

(assert (=> b!178412 m!278553))

(declare-fun m!278555 () Bool)

(assert (=> b!178412 m!278555))

(declare-fun m!278557 () Bool)

(assert (=> b!178412 m!278557))

(declare-fun m!278559 () Bool)

(assert (=> b!178412 m!278559))

(declare-fun m!278561 () Bool)

(assert (=> b!178418 m!278561))

(declare-fun m!278563 () Bool)

(assert (=> b!178409 m!278563))

(declare-fun m!278565 () Bool)

(assert (=> b!178415 m!278565))

(declare-fun m!278567 () Bool)

(assert (=> b!178411 m!278567))

(declare-fun m!278569 () Bool)

(assert (=> b!178410 m!278569))

(declare-fun m!278571 () Bool)

(assert (=> b!178421 m!278571))

(assert (=> b!178421 m!278571))

(declare-fun m!278573 () Bool)

(assert (=> b!178421 m!278573))

(declare-fun m!278575 () Bool)

(assert (=> b!178423 m!278575))

(assert (=> b!178414 m!278539))

(assert (=> b!178414 m!278541))

(declare-fun m!278577 () Bool)

(assert (=> b!178420 m!278577))

(declare-fun m!278579 () Bool)

(assert (=> b!178420 m!278579))

(declare-fun m!278581 () Bool)

(assert (=> b!178420 m!278581))

(declare-fun m!278583 () Bool)

(assert (=> start!39598 m!278583))

(declare-fun m!278585 () Bool)

(assert (=> b!178422 m!278585))

(check-sat (not b!178418) (not b!178423) (not b!178422) (not b!178421) (not b!178409) (not b!178425) (not b!178414) (not b!178416) (not b!178419) (not b!178420) (not b!178417) (not b!178410) (not b!178424) (not b!178412) (not b!178411) (not b!178415) (not start!39598))
