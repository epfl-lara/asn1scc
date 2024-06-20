; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39940 () Bool)

(assert start!39940)

(declare-fun b!181500 () Bool)

(declare-fun e!126018 () Bool)

(declare-datatypes ((array!9700 0))(
  ( (array!9701 (arr!5207 (Array (_ BitVec 32) (_ BitVec 8))) (size!4277 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7662 0))(
  ( (BitStream!7663 (buf!4726 array!9700) (currentByte!8948 (_ BitVec 32)) (currentBit!8943 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7662)

(declare-datatypes ((Unit!13051 0))(
  ( (Unit!13052) )
))
(declare-datatypes ((tuple2!15632 0))(
  ( (tuple2!15633 (_1!8461 Unit!13051) (_2!8461 BitStream!7662)) )
))
(declare-fun lt!278921 () tuple2!15632)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!181500 (= e!126018 (invariant!0 (currentBit!8943 thiss!1204) (currentByte!8948 thiss!1204) (size!4277 (buf!4726 (_2!8461 lt!278921)))))))

(declare-fun b!181501 () Bool)

(declare-fun res!150759 () Bool)

(declare-fun e!126023 () Bool)

(assert (=> b!181501 (=> res!150759 e!126023)))

(declare-fun lt!278917 () tuple2!15632)

(declare-fun isPrefixOf!0 (BitStream!7662 BitStream!7662) Bool)

(assert (=> b!181501 (= res!150759 (not (isPrefixOf!0 thiss!1204 (_2!8461 lt!278917))))))

(declare-fun b!181502 () Bool)

(declare-fun res!150761 () Bool)

(declare-fun e!126027 () Bool)

(assert (=> b!181502 (=> (not res!150761) (not e!126027))))

(assert (=> b!181502 (= res!150761 (isPrefixOf!0 thiss!1204 (_2!8461 lt!278917)))))

(declare-fun b!181503 () Bool)

(declare-fun res!150760 () Bool)

(declare-fun e!126028 () Bool)

(assert (=> b!181503 (=> (not res!150760) (not e!126028))))

(assert (=> b!181503 (= res!150760 (invariant!0 (currentBit!8943 thiss!1204) (currentByte!8948 thiss!1204) (size!4277 (buf!4726 thiss!1204))))))

(declare-fun b!181504 () Bool)

(declare-fun e!126021 () Bool)

(declare-fun lt!278911 () (_ BitVec 64))

(assert (=> b!181504 (= e!126021 (= (bvand lt!278911 #b1111111111111111111111111111111111111111111111111111111111111111) lt!278911))))

(declare-fun b!181505 () Bool)

(declare-fun e!126020 () Bool)

(assert (=> b!181505 (= e!126020 e!126028)))

(declare-fun res!150755 () Bool)

(assert (=> b!181505 (=> (not res!150755) (not e!126028))))

(declare-fun lt!278923 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!181505 (= res!150755 (validate_offset_bits!1 ((_ sign_extend 32) (size!4277 (buf!4726 thiss!1204))) ((_ sign_extend 32) (currentByte!8948 thiss!1204)) ((_ sign_extend 32) (currentBit!8943 thiss!1204)) lt!278923))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!181505 (= lt!278923 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!181506 () Bool)

(declare-fun res!150752 () Bool)

(assert (=> b!181506 (=> res!150752 e!126023)))

(assert (=> b!181506 (= res!150752 (not (isPrefixOf!0 (_2!8461 lt!278917) (_2!8461 lt!278921))))))

(declare-fun res!150747 () Bool)

(assert (=> start!39940 (=> (not res!150747) (not e!126020))))

(assert (=> start!39940 (= res!150747 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39940 e!126020))

(assert (=> start!39940 true))

(declare-fun e!126022 () Bool)

(declare-fun inv!12 (BitStream!7662) Bool)

(assert (=> start!39940 (and (inv!12 thiss!1204) e!126022)))

(declare-fun b!181507 () Bool)

(declare-fun res!150750 () Bool)

(assert (=> b!181507 (=> (not res!150750) (not e!126028))))

(assert (=> b!181507 (= res!150750 (not (= i!590 nBits!348)))))

(declare-fun b!181508 () Bool)

(declare-fun array_inv!4018 (array!9700) Bool)

(assert (=> b!181508 (= e!126022 (array_inv!4018 (buf!4726 thiss!1204)))))

(declare-fun b!181509 () Bool)

(declare-fun e!126025 () Bool)

(assert (=> b!181509 (= e!126028 (not e!126025))))

(declare-fun res!150748 () Bool)

(assert (=> b!181509 (=> res!150748 e!126025)))

(declare-fun lt!278922 () (_ BitVec 64))

(declare-fun lt!278915 () (_ BitVec 64))

(assert (=> b!181509 (= res!150748 (not (= lt!278922 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!278915))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!181509 (= lt!278922 (bitIndex!0 (size!4277 (buf!4726 (_2!8461 lt!278917))) (currentByte!8948 (_2!8461 lt!278917)) (currentBit!8943 (_2!8461 lt!278917))))))

(assert (=> b!181509 (= lt!278915 (bitIndex!0 (size!4277 (buf!4726 thiss!1204)) (currentByte!8948 thiss!1204) (currentBit!8943 thiss!1204)))))

(declare-fun e!126017 () Bool)

(assert (=> b!181509 e!126017))

(declare-fun res!150745 () Bool)

(assert (=> b!181509 (=> (not res!150745) (not e!126017))))

(assert (=> b!181509 (= res!150745 (= (size!4277 (buf!4726 thiss!1204)) (size!4277 (buf!4726 (_2!8461 lt!278917)))))))

(declare-fun lt!278927 () Bool)

(declare-fun appendBit!0 (BitStream!7662 Bool) tuple2!15632)

(assert (=> b!181509 (= lt!278917 (appendBit!0 thiss!1204 lt!278927))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!181509 (= lt!278927 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!181510 () Bool)

(declare-fun res!150756 () Bool)

(assert (=> b!181510 (=> res!150756 e!126023)))

(assert (=> b!181510 (= res!150756 (not (invariant!0 (currentBit!8943 (_2!8461 lt!278921)) (currentByte!8948 (_2!8461 lt!278921)) (size!4277 (buf!4726 (_2!8461 lt!278921))))))))

(declare-fun b!181511 () Bool)

(assert (=> b!181511 (= e!126017 e!126027)))

(declare-fun res!150762 () Bool)

(assert (=> b!181511 (=> (not res!150762) (not e!126027))))

(declare-fun lt!278925 () (_ BitVec 64))

(declare-fun lt!278910 () (_ BitVec 64))

(assert (=> b!181511 (= res!150762 (= lt!278925 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!278910)))))

(assert (=> b!181511 (= lt!278925 (bitIndex!0 (size!4277 (buf!4726 (_2!8461 lt!278917))) (currentByte!8948 (_2!8461 lt!278917)) (currentBit!8943 (_2!8461 lt!278917))))))

(assert (=> b!181511 (= lt!278910 (bitIndex!0 (size!4277 (buf!4726 thiss!1204)) (currentByte!8948 thiss!1204) (currentBit!8943 thiss!1204)))))

(declare-fun b!181512 () Bool)

(declare-fun e!126019 () Bool)

(declare-datatypes ((tuple2!15634 0))(
  ( (tuple2!15635 (_1!8462 BitStream!7662) (_2!8462 Bool)) )
))
(declare-fun lt!278909 () tuple2!15634)

(assert (=> b!181512 (= e!126019 (= (bitIndex!0 (size!4277 (buf!4726 (_1!8462 lt!278909))) (currentByte!8948 (_1!8462 lt!278909)) (currentBit!8943 (_1!8462 lt!278909))) lt!278925))))

(declare-fun b!181513 () Bool)

(assert (=> b!181513 (= e!126023 e!126021)))

(declare-fun res!150749 () Bool)

(assert (=> b!181513 (=> res!150749 e!126021)))

(declare-datatypes ((tuple2!15636 0))(
  ( (tuple2!15637 (_1!8463 BitStream!7662) (_2!8463 BitStream!7662)) )
))
(declare-fun lt!278918 () tuple2!15636)

(assert (=> b!181513 (= res!150749 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4277 (buf!4726 (_1!8463 lt!278918)))) ((_ sign_extend 32) (currentByte!8948 (_1!8463 lt!278918))) ((_ sign_extend 32) (currentBit!8943 (_1!8463 lt!278918))) lt!278923)))))

(assert (=> b!181513 (validate_offset_bits!1 ((_ sign_extend 32) (size!4277 (buf!4726 (_2!8461 lt!278921)))) ((_ sign_extend 32) (currentByte!8948 thiss!1204)) ((_ sign_extend 32) (currentBit!8943 thiss!1204)) lt!278923)))

(declare-fun lt!278916 () Unit!13051)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7662 array!9700 (_ BitVec 64)) Unit!13051)

(assert (=> b!181513 (= lt!278916 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4726 (_2!8461 lt!278921)) lt!278923))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!181513 (= lt!278911 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun readBitPure!0 (BitStream!7662) tuple2!15634)

(assert (=> b!181513 (= (_2!8462 (readBitPure!0 (_1!8463 lt!278918))) lt!278927)))

(declare-fun lt!278920 () tuple2!15636)

(declare-fun reader!0 (BitStream!7662 BitStream!7662) tuple2!15636)

(assert (=> b!181513 (= lt!278920 (reader!0 (_2!8461 lt!278917) (_2!8461 lt!278921)))))

(assert (=> b!181513 (= lt!278918 (reader!0 thiss!1204 (_2!8461 lt!278921)))))

(declare-fun e!126024 () Bool)

(assert (=> b!181513 e!126024))

(declare-fun res!150757 () Bool)

(assert (=> b!181513 (=> (not res!150757) (not e!126024))))

(declare-fun lt!278914 () tuple2!15634)

(declare-fun lt!278912 () tuple2!15634)

(assert (=> b!181513 (= res!150757 (= (bitIndex!0 (size!4277 (buf!4726 (_1!8462 lt!278914))) (currentByte!8948 (_1!8462 lt!278914)) (currentBit!8943 (_1!8462 lt!278914))) (bitIndex!0 (size!4277 (buf!4726 (_1!8462 lt!278912))) (currentByte!8948 (_1!8462 lt!278912)) (currentBit!8943 (_1!8462 lt!278912)))))))

(declare-fun lt!278919 () Unit!13051)

(declare-fun lt!278926 () BitStream!7662)

(declare-fun readBitPrefixLemma!0 (BitStream!7662 BitStream!7662) Unit!13051)

(assert (=> b!181513 (= lt!278919 (readBitPrefixLemma!0 lt!278926 (_2!8461 lt!278921)))))

(assert (=> b!181513 (= lt!278912 (readBitPure!0 (BitStream!7663 (buf!4726 (_2!8461 lt!278921)) (currentByte!8948 thiss!1204) (currentBit!8943 thiss!1204))))))

(assert (=> b!181513 (= lt!278914 (readBitPure!0 lt!278926))))

(assert (=> b!181513 e!126018))

(declare-fun res!150751 () Bool)

(assert (=> b!181513 (=> (not res!150751) (not e!126018))))

(assert (=> b!181513 (= res!150751 (invariant!0 (currentBit!8943 thiss!1204) (currentByte!8948 thiss!1204) (size!4277 (buf!4726 (_2!8461 lt!278917)))))))

(assert (=> b!181513 (= lt!278926 (BitStream!7663 (buf!4726 (_2!8461 lt!278917)) (currentByte!8948 thiss!1204) (currentBit!8943 thiss!1204)))))

(declare-fun b!181514 () Bool)

(assert (=> b!181514 (= e!126027 e!126019)))

(declare-fun res!150753 () Bool)

(assert (=> b!181514 (=> (not res!150753) (not e!126019))))

(assert (=> b!181514 (= res!150753 (and (= (_2!8462 lt!278909) lt!278927) (= (_1!8462 lt!278909) (_2!8461 lt!278917))))))

(declare-fun readerFrom!0 (BitStream!7662 (_ BitVec 32) (_ BitVec 32)) BitStream!7662)

(assert (=> b!181514 (= lt!278909 (readBitPure!0 (readerFrom!0 (_2!8461 lt!278917) (currentBit!8943 thiss!1204) (currentByte!8948 thiss!1204))))))

(declare-fun b!181515 () Bool)

(assert (=> b!181515 (= e!126024 (= (_2!8462 lt!278914) (_2!8462 lt!278912)))))

(declare-fun b!181516 () Bool)

(assert (=> b!181516 (= e!126025 e!126023)))

(declare-fun res!150746 () Bool)

(assert (=> b!181516 (=> res!150746 e!126023)))

(declare-fun lt!278913 () (_ BitVec 64))

(assert (=> b!181516 (= res!150746 (not (= lt!278913 (bvsub (bvsub (bvadd lt!278922 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!181516 (= lt!278913 (bitIndex!0 (size!4277 (buf!4726 (_2!8461 lt!278921))) (currentByte!8948 (_2!8461 lt!278921)) (currentBit!8943 (_2!8461 lt!278921))))))

(assert (=> b!181516 (isPrefixOf!0 thiss!1204 (_2!8461 lt!278921))))

(declare-fun lt!278924 () Unit!13051)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7662 BitStream!7662 BitStream!7662) Unit!13051)

(assert (=> b!181516 (= lt!278924 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8461 lt!278917) (_2!8461 lt!278921)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7662 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15632)

(assert (=> b!181516 (= lt!278921 (appendBitsLSBFirstLoopTR!0 (_2!8461 lt!278917) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!181517 () Bool)

(declare-fun res!150754 () Bool)

(assert (=> b!181517 (=> res!150754 e!126021)))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!181517 (= res!150754 (not (= (bvand lt!278911 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!181518 () Bool)

(declare-fun res!150758 () Bool)

(assert (=> b!181518 (=> res!150758 e!126023)))

(assert (=> b!181518 (= res!150758 (or (not (= (size!4277 (buf!4726 (_2!8461 lt!278921))) (size!4277 (buf!4726 thiss!1204)))) (not (= lt!278913 (bvsub (bvadd lt!278915 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(assert (= (and start!39940 res!150747) b!181505))

(assert (= (and b!181505 res!150755) b!181503))

(assert (= (and b!181503 res!150760) b!181507))

(assert (= (and b!181507 res!150750) b!181509))

(assert (= (and b!181509 res!150745) b!181511))

(assert (= (and b!181511 res!150762) b!181502))

(assert (= (and b!181502 res!150761) b!181514))

(assert (= (and b!181514 res!150753) b!181512))

(assert (= (and b!181509 (not res!150748)) b!181516))

(assert (= (and b!181516 (not res!150746)) b!181510))

(assert (= (and b!181510 (not res!150756)) b!181518))

(assert (= (and b!181518 (not res!150758)) b!181506))

(assert (= (and b!181506 (not res!150752)) b!181501))

(assert (= (and b!181501 (not res!150759)) b!181513))

(assert (= (and b!181513 res!150751) b!181500))

(assert (= (and b!181513 res!150757) b!181515))

(assert (= (and b!181513 (not res!150749)) b!181517))

(assert (= (and b!181517 (not res!150754)) b!181504))

(assert (= start!39940 b!181508))

(declare-fun m!282545 () Bool)

(assert (=> b!181509 m!282545))

(declare-fun m!282547 () Bool)

(assert (=> b!181509 m!282547))

(declare-fun m!282549 () Bool)

(assert (=> b!181509 m!282549))

(declare-fun m!282551 () Bool)

(assert (=> b!181503 m!282551))

(declare-fun m!282553 () Bool)

(assert (=> b!181513 m!282553))

(declare-fun m!282555 () Bool)

(assert (=> b!181513 m!282555))

(declare-fun m!282557 () Bool)

(assert (=> b!181513 m!282557))

(declare-fun m!282559 () Bool)

(assert (=> b!181513 m!282559))

(declare-fun m!282561 () Bool)

(assert (=> b!181513 m!282561))

(declare-fun m!282563 () Bool)

(assert (=> b!181513 m!282563))

(declare-fun m!282565 () Bool)

(assert (=> b!181513 m!282565))

(declare-fun m!282567 () Bool)

(assert (=> b!181513 m!282567))

(declare-fun m!282569 () Bool)

(assert (=> b!181513 m!282569))

(declare-fun m!282571 () Bool)

(assert (=> b!181513 m!282571))

(declare-fun m!282573 () Bool)

(assert (=> b!181513 m!282573))

(declare-fun m!282575 () Bool)

(assert (=> b!181513 m!282575))

(declare-fun m!282577 () Bool)

(assert (=> b!181513 m!282577))

(declare-fun m!282579 () Bool)

(assert (=> b!181505 m!282579))

(declare-fun m!282581 () Bool)

(assert (=> b!181506 m!282581))

(declare-fun m!282583 () Bool)

(assert (=> b!181517 m!282583))

(declare-fun m!282585 () Bool)

(assert (=> b!181510 m!282585))

(declare-fun m!282587 () Bool)

(assert (=> b!181514 m!282587))

(assert (=> b!181514 m!282587))

(declare-fun m!282589 () Bool)

(assert (=> b!181514 m!282589))

(declare-fun m!282591 () Bool)

(assert (=> b!181501 m!282591))

(declare-fun m!282593 () Bool)

(assert (=> start!39940 m!282593))

(declare-fun m!282595 () Bool)

(assert (=> b!181516 m!282595))

(declare-fun m!282597 () Bool)

(assert (=> b!181516 m!282597))

(declare-fun m!282599 () Bool)

(assert (=> b!181516 m!282599))

(declare-fun m!282601 () Bool)

(assert (=> b!181516 m!282601))

(declare-fun m!282603 () Bool)

(assert (=> b!181508 m!282603))

(assert (=> b!181511 m!282545))

(assert (=> b!181511 m!282547))

(declare-fun m!282605 () Bool)

(assert (=> b!181512 m!282605))

(declare-fun m!282607 () Bool)

(assert (=> b!181500 m!282607))

(assert (=> b!181502 m!282591))

(check-sat (not b!181509) (not b!181502) (not start!39940) (not b!181506) (not b!181517) (not b!181510) (not b!181511) (not b!181516) (not b!181513) (not b!181508) (not b!181503) (not b!181512) (not b!181514) (not b!181501) (not b!181505) (not b!181500))
