; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39944 () Bool)

(assert start!39944)

(declare-fun b!181610 () Bool)

(declare-fun res!150849 () Bool)

(declare-fun e!126093 () Bool)

(assert (=> b!181610 (=> (not res!150849) (not e!126093))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!181610 (= res!150849 (not (= i!590 nBits!348)))))

(declare-fun b!181611 () Bool)

(declare-fun res!150850 () Bool)

(declare-fun e!126089 () Bool)

(assert (=> b!181611 (=> res!150850 e!126089)))

(declare-datatypes ((array!9704 0))(
  ( (array!9705 (arr!5209 (Array (_ BitVec 32) (_ BitVec 8))) (size!4279 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7666 0))(
  ( (BitStream!7667 (buf!4728 array!9704) (currentByte!8950 (_ BitVec 32)) (currentBit!8945 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!13055 0))(
  ( (Unit!13056) )
))
(declare-datatypes ((tuple2!15644 0))(
  ( (tuple2!15645 (_1!8467 Unit!13055) (_2!8467 BitStream!7666)) )
))
(declare-fun lt!279034 () tuple2!15644)

(declare-fun lt!279024 () tuple2!15644)

(declare-fun isPrefixOf!0 (BitStream!7666 BitStream!7666) Bool)

(assert (=> b!181611 (= res!150850 (not (isPrefixOf!0 (_2!8467 lt!279034) (_2!8467 lt!279024))))))

(declare-fun b!181612 () Bool)

(declare-fun e!126088 () Bool)

(assert (=> b!181612 (= e!126093 (not e!126088))))

(declare-fun res!150858 () Bool)

(assert (=> b!181612 (=> res!150858 e!126088)))

(declare-fun lt!279041 () (_ BitVec 64))

(declare-fun lt!279031 () (_ BitVec 64))

(assert (=> b!181612 (= res!150858 (not (= lt!279041 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!279031))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!181612 (= lt!279041 (bitIndex!0 (size!4279 (buf!4728 (_2!8467 lt!279034))) (currentByte!8950 (_2!8467 lt!279034)) (currentBit!8945 (_2!8467 lt!279034))))))

(declare-fun thiss!1204 () BitStream!7666)

(assert (=> b!181612 (= lt!279031 (bitIndex!0 (size!4279 (buf!4728 thiss!1204)) (currentByte!8950 thiss!1204) (currentBit!8945 thiss!1204)))))

(declare-fun e!126092 () Bool)

(assert (=> b!181612 e!126092))

(declare-fun res!150859 () Bool)

(assert (=> b!181612 (=> (not res!150859) (not e!126092))))

(assert (=> b!181612 (= res!150859 (= (size!4279 (buf!4728 thiss!1204)) (size!4279 (buf!4728 (_2!8467 lt!279034)))))))

(declare-fun lt!279030 () Bool)

(declare-fun appendBit!0 (BitStream!7666 Bool) tuple2!15644)

(assert (=> b!181612 (= lt!279034 (appendBit!0 thiss!1204 lt!279030))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!181612 (= lt!279030 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!181613 () Bool)

(declare-fun res!150852 () Bool)

(assert (=> b!181613 (=> (not res!150852) (not e!126093))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!181613 (= res!150852 (invariant!0 (currentBit!8945 thiss!1204) (currentByte!8950 thiss!1204) (size!4279 (buf!4728 thiss!1204))))))

(declare-fun b!181614 () Bool)

(declare-fun e!126091 () Bool)

(declare-fun e!126097 () Bool)

(assert (=> b!181614 (= e!126091 e!126097)))

(declare-fun res!150855 () Bool)

(assert (=> b!181614 (=> (not res!150855) (not e!126097))))

(declare-datatypes ((tuple2!15646 0))(
  ( (tuple2!15647 (_1!8468 BitStream!7666) (_2!8468 Bool)) )
))
(declare-fun lt!279033 () tuple2!15646)

(assert (=> b!181614 (= res!150855 (and (= (_2!8468 lt!279033) lt!279030) (= (_1!8468 lt!279033) (_2!8467 lt!279034))))))

(declare-fun readBitPure!0 (BitStream!7666) tuple2!15646)

(declare-fun readerFrom!0 (BitStream!7666 (_ BitVec 32) (_ BitVec 32)) BitStream!7666)

(assert (=> b!181614 (= lt!279033 (readBitPure!0 (readerFrom!0 (_2!8467 lt!279034) (currentBit!8945 thiss!1204) (currentByte!8950 thiss!1204))))))

(declare-fun res!150860 () Bool)

(declare-fun e!126096 () Bool)

(assert (=> start!39944 (=> (not res!150860) (not e!126096))))

(assert (=> start!39944 (= res!150860 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39944 e!126096))

(assert (=> start!39944 true))

(declare-fun e!126087 () Bool)

(declare-fun inv!12 (BitStream!7666) Bool)

(assert (=> start!39944 (and (inv!12 thiss!1204) e!126087)))

(declare-fun b!181615 () Bool)

(assert (=> b!181615 (= e!126088 e!126089)))

(declare-fun res!150856 () Bool)

(assert (=> b!181615 (=> res!150856 e!126089)))

(declare-fun lt!279025 () (_ BitVec 64))

(assert (=> b!181615 (= res!150856 (not (= lt!279025 (bvsub (bvsub (bvadd lt!279041 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!181615 (= lt!279025 (bitIndex!0 (size!4279 (buf!4728 (_2!8467 lt!279024))) (currentByte!8950 (_2!8467 lt!279024)) (currentBit!8945 (_2!8467 lt!279024))))))

(assert (=> b!181615 (isPrefixOf!0 thiss!1204 (_2!8467 lt!279024))))

(declare-fun lt!279036 () Unit!13055)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7666 BitStream!7666 BitStream!7666) Unit!13055)

(assert (=> b!181615 (= lt!279036 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8467 lt!279034) (_2!8467 lt!279024)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7666 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15644)

(assert (=> b!181615 (= lt!279024 (appendBitsLSBFirstLoopTR!0 (_2!8467 lt!279034) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!181616 () Bool)

(assert (=> b!181616 (= e!126092 e!126091)))

(declare-fun res!150857 () Bool)

(assert (=> b!181616 (=> (not res!150857) (not e!126091))))

(declare-fun lt!279027 () (_ BitVec 64))

(declare-fun lt!279038 () (_ BitVec 64))

(assert (=> b!181616 (= res!150857 (= lt!279027 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!279038)))))

(assert (=> b!181616 (= lt!279027 (bitIndex!0 (size!4279 (buf!4728 (_2!8467 lt!279034))) (currentByte!8950 (_2!8467 lt!279034)) (currentBit!8945 (_2!8467 lt!279034))))))

(assert (=> b!181616 (= lt!279038 (bitIndex!0 (size!4279 (buf!4728 thiss!1204)) (currentByte!8950 thiss!1204) (currentBit!8945 thiss!1204)))))

(declare-fun b!181617 () Bool)

(declare-fun res!150853 () Bool)

(assert (=> b!181617 (=> res!150853 e!126089)))

(assert (=> b!181617 (= res!150853 (or (not (= (size!4279 (buf!4728 (_2!8467 lt!279024))) (size!4279 (buf!4728 thiss!1204)))) (not (= lt!279025 (bvsub (bvadd lt!279031 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!181618 () Bool)

(declare-fun res!150851 () Bool)

(assert (=> b!181618 (=> res!150851 e!126089)))

(assert (=> b!181618 (= res!150851 (not (isPrefixOf!0 thiss!1204 (_2!8467 lt!279034))))))

(declare-fun b!181619 () Bool)

(assert (=> b!181619 (= e!126089 true)))

(declare-datatypes ((tuple2!15648 0))(
  ( (tuple2!15649 (_1!8469 BitStream!7666) (_2!8469 (_ BitVec 64))) )
))
(declare-fun lt!279040 () tuple2!15648)

(declare-datatypes ((tuple2!15650 0))(
  ( (tuple2!15651 (_1!8470 BitStream!7666) (_2!8470 BitStream!7666)) )
))
(declare-fun lt!279023 () tuple2!15650)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7666 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15648)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!181619 (= lt!279040 (readNBitsLSBFirstsLoopPure!0 (_1!8470 lt!279023) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(declare-fun lt!279026 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!181619 (validate_offset_bits!1 ((_ sign_extend 32) (size!4279 (buf!4728 (_2!8467 lt!279024)))) ((_ sign_extend 32) (currentByte!8950 thiss!1204)) ((_ sign_extend 32) (currentBit!8945 thiss!1204)) lt!279026)))

(declare-fun lt!279032 () Unit!13055)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7666 array!9704 (_ BitVec 64)) Unit!13055)

(assert (=> b!181619 (= lt!279032 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4728 (_2!8467 lt!279024)) lt!279026))))

(assert (=> b!181619 (= (_2!8468 (readBitPure!0 (_1!8470 lt!279023))) lt!279030)))

(declare-fun lt!279035 () tuple2!15650)

(declare-fun reader!0 (BitStream!7666 BitStream!7666) tuple2!15650)

(assert (=> b!181619 (= lt!279035 (reader!0 (_2!8467 lt!279034) (_2!8467 lt!279024)))))

(assert (=> b!181619 (= lt!279023 (reader!0 thiss!1204 (_2!8467 lt!279024)))))

(declare-fun e!126095 () Bool)

(assert (=> b!181619 e!126095))

(declare-fun res!150854 () Bool)

(assert (=> b!181619 (=> (not res!150854) (not e!126095))))

(declare-fun lt!279029 () tuple2!15646)

(declare-fun lt!279037 () tuple2!15646)

(assert (=> b!181619 (= res!150854 (= (bitIndex!0 (size!4279 (buf!4728 (_1!8468 lt!279029))) (currentByte!8950 (_1!8468 lt!279029)) (currentBit!8945 (_1!8468 lt!279029))) (bitIndex!0 (size!4279 (buf!4728 (_1!8468 lt!279037))) (currentByte!8950 (_1!8468 lt!279037)) (currentBit!8945 (_1!8468 lt!279037)))))))

(declare-fun lt!279028 () Unit!13055)

(declare-fun lt!279039 () BitStream!7666)

(declare-fun readBitPrefixLemma!0 (BitStream!7666 BitStream!7666) Unit!13055)

(assert (=> b!181619 (= lt!279028 (readBitPrefixLemma!0 lt!279039 (_2!8467 lt!279024)))))

(assert (=> b!181619 (= lt!279037 (readBitPure!0 (BitStream!7667 (buf!4728 (_2!8467 lt!279024)) (currentByte!8950 thiss!1204) (currentBit!8945 thiss!1204))))))

(assert (=> b!181619 (= lt!279029 (readBitPure!0 lt!279039))))

(declare-fun e!126090 () Bool)

(assert (=> b!181619 e!126090))

(declare-fun res!150861 () Bool)

(assert (=> b!181619 (=> (not res!150861) (not e!126090))))

(assert (=> b!181619 (= res!150861 (invariant!0 (currentBit!8945 thiss!1204) (currentByte!8950 thiss!1204) (size!4279 (buf!4728 (_2!8467 lt!279034)))))))

(assert (=> b!181619 (= lt!279039 (BitStream!7667 (buf!4728 (_2!8467 lt!279034)) (currentByte!8950 thiss!1204) (currentBit!8945 thiss!1204)))))

(declare-fun b!181620 () Bool)

(declare-fun array_inv!4020 (array!9704) Bool)

(assert (=> b!181620 (= e!126087 (array_inv!4020 (buf!4728 thiss!1204)))))

(declare-fun b!181621 () Bool)

(assert (=> b!181621 (= e!126096 e!126093)))

(declare-fun res!150864 () Bool)

(assert (=> b!181621 (=> (not res!150864) (not e!126093))))

(assert (=> b!181621 (= res!150864 (validate_offset_bits!1 ((_ sign_extend 32) (size!4279 (buf!4728 thiss!1204))) ((_ sign_extend 32) (currentByte!8950 thiss!1204)) ((_ sign_extend 32) (currentBit!8945 thiss!1204)) lt!279026))))

(assert (=> b!181621 (= lt!279026 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!181622 () Bool)

(assert (=> b!181622 (= e!126095 (= (_2!8468 lt!279029) (_2!8468 lt!279037)))))

(declare-fun b!181623 () Bool)

(assert (=> b!181623 (= e!126097 (= (bitIndex!0 (size!4279 (buf!4728 (_1!8468 lt!279033))) (currentByte!8950 (_1!8468 lt!279033)) (currentBit!8945 (_1!8468 lt!279033))) lt!279027))))

(declare-fun b!181624 () Bool)

(declare-fun res!150863 () Bool)

(assert (=> b!181624 (=> res!150863 e!126089)))

(assert (=> b!181624 (= res!150863 (not (invariant!0 (currentBit!8945 (_2!8467 lt!279024)) (currentByte!8950 (_2!8467 lt!279024)) (size!4279 (buf!4728 (_2!8467 lt!279024))))))))

(declare-fun b!181625 () Bool)

(assert (=> b!181625 (= e!126090 (invariant!0 (currentBit!8945 thiss!1204) (currentByte!8950 thiss!1204) (size!4279 (buf!4728 (_2!8467 lt!279024)))))))

(declare-fun b!181626 () Bool)

(declare-fun res!150862 () Bool)

(assert (=> b!181626 (=> (not res!150862) (not e!126091))))

(assert (=> b!181626 (= res!150862 (isPrefixOf!0 thiss!1204 (_2!8467 lt!279034)))))

(assert (= (and start!39944 res!150860) b!181621))

(assert (= (and b!181621 res!150864) b!181613))

(assert (= (and b!181613 res!150852) b!181610))

(assert (= (and b!181610 res!150849) b!181612))

(assert (= (and b!181612 res!150859) b!181616))

(assert (= (and b!181616 res!150857) b!181626))

(assert (= (and b!181626 res!150862) b!181614))

(assert (= (and b!181614 res!150855) b!181623))

(assert (= (and b!181612 (not res!150858)) b!181615))

(assert (= (and b!181615 (not res!150856)) b!181624))

(assert (= (and b!181624 (not res!150863)) b!181617))

(assert (= (and b!181617 (not res!150853)) b!181611))

(assert (= (and b!181611 (not res!150850)) b!181618))

(assert (= (and b!181618 (not res!150851)) b!181619))

(assert (= (and b!181619 res!150861) b!181625))

(assert (= (and b!181619 res!150854) b!181622))

(assert (= start!39944 b!181620))

(declare-fun m!282673 () Bool)

(assert (=> b!181620 m!282673))

(declare-fun m!282675 () Bool)

(assert (=> b!181624 m!282675))

(declare-fun m!282677 () Bool)

(assert (=> b!181614 m!282677))

(assert (=> b!181614 m!282677))

(declare-fun m!282679 () Bool)

(assert (=> b!181614 m!282679))

(declare-fun m!282681 () Bool)

(assert (=> b!181625 m!282681))

(declare-fun m!282683 () Bool)

(assert (=> b!181615 m!282683))

(declare-fun m!282685 () Bool)

(assert (=> b!181615 m!282685))

(declare-fun m!282687 () Bool)

(assert (=> b!181615 m!282687))

(declare-fun m!282689 () Bool)

(assert (=> b!181615 m!282689))

(declare-fun m!282691 () Bool)

(assert (=> b!181613 m!282691))

(declare-fun m!282693 () Bool)

(assert (=> start!39944 m!282693))

(declare-fun m!282695 () Bool)

(assert (=> b!181623 m!282695))

(declare-fun m!282697 () Bool)

(assert (=> b!181611 m!282697))

(declare-fun m!282699 () Bool)

(assert (=> b!181619 m!282699))

(declare-fun m!282701 () Bool)

(assert (=> b!181619 m!282701))

(declare-fun m!282703 () Bool)

(assert (=> b!181619 m!282703))

(declare-fun m!282705 () Bool)

(assert (=> b!181619 m!282705))

(declare-fun m!282707 () Bool)

(assert (=> b!181619 m!282707))

(declare-fun m!282709 () Bool)

(assert (=> b!181619 m!282709))

(declare-fun m!282711 () Bool)

(assert (=> b!181619 m!282711))

(declare-fun m!282713 () Bool)

(assert (=> b!181619 m!282713))

(declare-fun m!282715 () Bool)

(assert (=> b!181619 m!282715))

(declare-fun m!282717 () Bool)

(assert (=> b!181619 m!282717))

(declare-fun m!282719 () Bool)

(assert (=> b!181619 m!282719))

(declare-fun m!282721 () Bool)

(assert (=> b!181619 m!282721))

(declare-fun m!282723 () Bool)

(assert (=> b!181619 m!282723))

(declare-fun m!282725 () Bool)

(assert (=> b!181612 m!282725))

(declare-fun m!282727 () Bool)

(assert (=> b!181612 m!282727))

(declare-fun m!282729 () Bool)

(assert (=> b!181612 m!282729))

(declare-fun m!282731 () Bool)

(assert (=> b!181618 m!282731))

(declare-fun m!282733 () Bool)

(assert (=> b!181621 m!282733))

(assert (=> b!181626 m!282731))

(assert (=> b!181616 m!282725))

(assert (=> b!181616 m!282727))

(push 1)

(assert (not start!39944))

(assert (not b!181621))

(assert (not b!181613))

(assert (not b!181616))

(assert (not b!181612))

(assert (not b!181618))

(assert (not b!181625))

(assert (not b!181620))

(assert (not b!181624))

(assert (not b!181619))

