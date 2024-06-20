; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39624 () Bool)

(assert start!39624)

(declare-fun b!179093 () Bool)

(declare-fun e!124612 () Bool)

(declare-datatypes ((array!9639 0))(
  ( (array!9640 (arr!5181 (Array (_ BitVec 32) (_ BitVec 8))) (size!4251 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7610 0))(
  ( (BitStream!7611 (buf!4694 array!9639) (currentByte!8892 (_ BitVec 32)) (currentBit!8887 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15440 0))(
  ( (tuple2!15441 (_1!8365 BitStream!7610) (_2!8365 Bool)) )
))
(declare-fun lt!274620 () tuple2!15440)

(declare-fun lt!274630 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!179093 (= e!124612 (= (bitIndex!0 (size!4251 (buf!4694 (_1!8365 lt!274620))) (currentByte!8892 (_1!8365 lt!274620)) (currentBit!8887 (_1!8365 lt!274620))) lt!274630))))

(declare-fun b!179094 () Bool)

(declare-fun e!124609 () Bool)

(declare-fun e!124613 () Bool)

(assert (=> b!179094 (= e!124609 (not e!124613))))

(declare-fun res!148603 () Bool)

(assert (=> b!179094 (=> res!148603 e!124613)))

(declare-fun lt!274627 () (_ BitVec 64))

(declare-fun lt!274617 () (_ BitVec 64))

(assert (=> b!179094 (= res!148603 (not (= lt!274627 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!274617))))))

(declare-datatypes ((Unit!12882 0))(
  ( (Unit!12883) )
))
(declare-datatypes ((tuple2!15442 0))(
  ( (tuple2!15443 (_1!8366 Unit!12882) (_2!8366 BitStream!7610)) )
))
(declare-fun lt!274622 () tuple2!15442)

(assert (=> b!179094 (= lt!274627 (bitIndex!0 (size!4251 (buf!4694 (_2!8366 lt!274622))) (currentByte!8892 (_2!8366 lt!274622)) (currentBit!8887 (_2!8366 lt!274622))))))

(declare-fun thiss!1204 () BitStream!7610)

(assert (=> b!179094 (= lt!274617 (bitIndex!0 (size!4251 (buf!4694 thiss!1204)) (currentByte!8892 thiss!1204) (currentBit!8887 thiss!1204)))))

(declare-fun e!124608 () Bool)

(assert (=> b!179094 e!124608))

(declare-fun res!148610 () Bool)

(assert (=> b!179094 (=> (not res!148610) (not e!124608))))

(assert (=> b!179094 (= res!148610 (= (size!4251 (buf!4694 thiss!1204)) (size!4251 (buf!4694 (_2!8366 lt!274622)))))))

(declare-fun lt!274628 () Bool)

(declare-fun appendBit!0 (BitStream!7610 Bool) tuple2!15442)

(assert (=> b!179094 (= lt!274622 (appendBit!0 thiss!1204 lt!274628))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!179094 (= lt!274628 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!179095 () Bool)

(declare-fun res!148611 () Bool)

(declare-fun e!124614 () Bool)

(assert (=> b!179095 (=> res!148611 e!124614)))

(declare-fun lt!274623 () tuple2!15442)

(declare-fun isPrefixOf!0 (BitStream!7610 BitStream!7610) Bool)

(assert (=> b!179095 (= res!148611 (not (isPrefixOf!0 (_2!8366 lt!274622) (_2!8366 lt!274623))))))

(declare-fun b!179096 () Bool)

(declare-fun res!148608 () Bool)

(assert (=> b!179096 (=> res!148608 e!124614)))

(assert (=> b!179096 (= res!148608 (not (isPrefixOf!0 thiss!1204 (_2!8366 lt!274622))))))

(declare-fun b!179097 () Bool)

(declare-fun res!148607 () Bool)

(assert (=> b!179097 (=> res!148607 e!124614)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!179097 (= res!148607 (not (invariant!0 (currentBit!8887 (_2!8366 lt!274623)) (currentByte!8892 (_2!8366 lt!274623)) (size!4251 (buf!4694 (_2!8366 lt!274623))))))))

(declare-fun b!179098 () Bool)

(declare-fun res!148609 () Bool)

(assert (=> b!179098 (=> (not res!148609) (not e!124609))))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!179098 (= res!148609 (not (= i!590 nBits!348)))))

(declare-fun b!179099 () Bool)

(declare-fun e!124615 () Bool)

(assert (=> b!179099 (= e!124608 e!124615)))

(declare-fun res!148606 () Bool)

(assert (=> b!179099 (=> (not res!148606) (not e!124615))))

(declare-fun lt!274629 () (_ BitVec 64))

(assert (=> b!179099 (= res!148606 (= lt!274630 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!274629)))))

(assert (=> b!179099 (= lt!274630 (bitIndex!0 (size!4251 (buf!4694 (_2!8366 lt!274622))) (currentByte!8892 (_2!8366 lt!274622)) (currentBit!8887 (_2!8366 lt!274622))))))

(assert (=> b!179099 (= lt!274629 (bitIndex!0 (size!4251 (buf!4694 thiss!1204)) (currentByte!8892 thiss!1204) (currentBit!8887 thiss!1204)))))

(declare-fun b!179100 () Bool)

(declare-fun e!124606 () Bool)

(declare-fun array_inv!3992 (array!9639) Bool)

(assert (=> b!179100 (= e!124606 (array_inv!3992 (buf!4694 thiss!1204)))))

(declare-fun b!179101 () Bool)

(assert (=> b!179101 (= e!124614 true)))

(declare-datatypes ((tuple2!15444 0))(
  ( (tuple2!15445 (_1!8367 BitStream!7610) (_2!8367 BitStream!7610)) )
))
(declare-fun lt!274625 () tuple2!15444)

(declare-fun reader!0 (BitStream!7610 BitStream!7610) tuple2!15444)

(assert (=> b!179101 (= lt!274625 (reader!0 thiss!1204 (_2!8366 lt!274623)))))

(declare-fun e!124611 () Bool)

(assert (=> b!179101 e!124611))

(declare-fun res!148604 () Bool)

(assert (=> b!179101 (=> (not res!148604) (not e!124611))))

(declare-fun lt!274626 () tuple2!15440)

(declare-fun lt!274618 () tuple2!15440)

(assert (=> b!179101 (= res!148604 (= (bitIndex!0 (size!4251 (buf!4694 (_1!8365 lt!274626))) (currentByte!8892 (_1!8365 lt!274626)) (currentBit!8887 (_1!8365 lt!274626))) (bitIndex!0 (size!4251 (buf!4694 (_1!8365 lt!274618))) (currentByte!8892 (_1!8365 lt!274618)) (currentBit!8887 (_1!8365 lt!274618)))))))

(declare-fun lt!274631 () Unit!12882)

(declare-fun lt!274619 () BitStream!7610)

(declare-fun readBitPrefixLemma!0 (BitStream!7610 BitStream!7610) Unit!12882)

(assert (=> b!179101 (= lt!274631 (readBitPrefixLemma!0 lt!274619 (_2!8366 lt!274623)))))

(declare-fun readBitPure!0 (BitStream!7610) tuple2!15440)

(assert (=> b!179101 (= lt!274618 (readBitPure!0 (BitStream!7611 (buf!4694 (_2!8366 lt!274623)) (currentByte!8892 thiss!1204) (currentBit!8887 thiss!1204))))))

(assert (=> b!179101 (= lt!274626 (readBitPure!0 lt!274619))))

(declare-fun e!124607 () Bool)

(assert (=> b!179101 e!124607))

(declare-fun res!148598 () Bool)

(assert (=> b!179101 (=> (not res!148598) (not e!124607))))

(assert (=> b!179101 (= res!148598 (invariant!0 (currentBit!8887 thiss!1204) (currentByte!8892 thiss!1204) (size!4251 (buf!4694 (_2!8366 lt!274622)))))))

(assert (=> b!179101 (= lt!274619 (BitStream!7611 (buf!4694 (_2!8366 lt!274622)) (currentByte!8892 thiss!1204) (currentBit!8887 thiss!1204)))))

(declare-fun b!179102 () Bool)

(declare-fun res!148601 () Bool)

(assert (=> b!179102 (=> res!148601 e!124614)))

(declare-fun lt!274621 () (_ BitVec 64))

(assert (=> b!179102 (= res!148601 (or (not (= (size!4251 (buf!4694 (_2!8366 lt!274623))) (size!4251 (buf!4694 thiss!1204)))) (not (= lt!274621 (bvsub (bvadd lt!274617 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!179103 () Bool)

(declare-fun res!148596 () Bool)

(assert (=> b!179103 (=> (not res!148596) (not e!124609))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!179103 (= res!148596 (validate_offset_bits!1 ((_ sign_extend 32) (size!4251 (buf!4694 thiss!1204))) ((_ sign_extend 32) (currentByte!8892 thiss!1204)) ((_ sign_extend 32) (currentBit!8887 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!179104 () Bool)

(declare-fun res!148597 () Bool)

(assert (=> b!179104 (=> (not res!148597) (not e!124609))))

(assert (=> b!179104 (= res!148597 (invariant!0 (currentBit!8887 thiss!1204) (currentByte!8892 thiss!1204) (size!4251 (buf!4694 thiss!1204))))))

(declare-fun res!148605 () Bool)

(assert (=> start!39624 (=> (not res!148605) (not e!124609))))

(assert (=> start!39624 (= res!148605 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39624 e!124609))

(assert (=> start!39624 true))

(declare-fun inv!12 (BitStream!7610) Bool)

(assert (=> start!39624 (and (inv!12 thiss!1204) e!124606)))

(declare-fun b!179105 () Bool)

(assert (=> b!179105 (= e!124613 e!124614)))

(declare-fun res!148602 () Bool)

(assert (=> b!179105 (=> res!148602 e!124614)))

(assert (=> b!179105 (= res!148602 (not (= lt!274621 (bvsub (bvsub (bvadd lt!274627 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!179105 (= lt!274621 (bitIndex!0 (size!4251 (buf!4694 (_2!8366 lt!274623))) (currentByte!8892 (_2!8366 lt!274623)) (currentBit!8887 (_2!8366 lt!274623))))))

(assert (=> b!179105 (isPrefixOf!0 thiss!1204 (_2!8366 lt!274623))))

(declare-fun lt!274624 () Unit!12882)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7610 BitStream!7610 BitStream!7610) Unit!12882)

(assert (=> b!179105 (= lt!274624 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8366 lt!274622) (_2!8366 lt!274623)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7610 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15442)

(assert (=> b!179105 (= lt!274623 (appendBitsLSBFirstLoopTR!0 (_2!8366 lt!274622) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!179106 () Bool)

(assert (=> b!179106 (= e!124615 e!124612)))

(declare-fun res!148599 () Bool)

(assert (=> b!179106 (=> (not res!148599) (not e!124612))))

(assert (=> b!179106 (= res!148599 (and (= (_2!8365 lt!274620) lt!274628) (= (_1!8365 lt!274620) (_2!8366 lt!274622))))))

(declare-fun readerFrom!0 (BitStream!7610 (_ BitVec 32) (_ BitVec 32)) BitStream!7610)

(assert (=> b!179106 (= lt!274620 (readBitPure!0 (readerFrom!0 (_2!8366 lt!274622) (currentBit!8887 thiss!1204) (currentByte!8892 thiss!1204))))))

(declare-fun b!179107 () Bool)

(assert (=> b!179107 (= e!124607 (invariant!0 (currentBit!8887 thiss!1204) (currentByte!8892 thiss!1204) (size!4251 (buf!4694 (_2!8366 lt!274623)))))))

(declare-fun b!179108 () Bool)

(assert (=> b!179108 (= e!124611 (= (_2!8365 lt!274626) (_2!8365 lt!274618)))))

(declare-fun b!179109 () Bool)

(declare-fun res!148600 () Bool)

(assert (=> b!179109 (=> (not res!148600) (not e!124615))))

(assert (=> b!179109 (= res!148600 (isPrefixOf!0 thiss!1204 (_2!8366 lt!274622)))))

(assert (= (and start!39624 res!148605) b!179103))

(assert (= (and b!179103 res!148596) b!179104))

(assert (= (and b!179104 res!148597) b!179098))

(assert (= (and b!179098 res!148609) b!179094))

(assert (= (and b!179094 res!148610) b!179099))

(assert (= (and b!179099 res!148606) b!179109))

(assert (= (and b!179109 res!148600) b!179106))

(assert (= (and b!179106 res!148599) b!179093))

(assert (= (and b!179094 (not res!148603)) b!179105))

(assert (= (and b!179105 (not res!148602)) b!179097))

(assert (= (and b!179097 (not res!148607)) b!179102))

(assert (= (and b!179102 (not res!148601)) b!179095))

(assert (= (and b!179095 (not res!148611)) b!179096))

(assert (= (and b!179096 (not res!148608)) b!179101))

(assert (= (and b!179101 res!148598) b!179107))

(assert (= (and b!179101 res!148604) b!179108))

(assert (= start!39624 b!179100))

(declare-fun m!279167 () Bool)

(assert (=> b!179099 m!279167))

(declare-fun m!279169 () Bool)

(assert (=> b!179099 m!279169))

(declare-fun m!279171 () Bool)

(assert (=> b!179103 m!279171))

(declare-fun m!279173 () Bool)

(assert (=> b!179093 m!279173))

(declare-fun m!279175 () Bool)

(assert (=> b!179109 m!279175))

(declare-fun m!279177 () Bool)

(assert (=> b!179105 m!279177))

(declare-fun m!279179 () Bool)

(assert (=> b!179105 m!279179))

(declare-fun m!279181 () Bool)

(assert (=> b!179105 m!279181))

(declare-fun m!279183 () Bool)

(assert (=> b!179105 m!279183))

(assert (=> b!179094 m!279167))

(assert (=> b!179094 m!279169))

(declare-fun m!279185 () Bool)

(assert (=> b!179094 m!279185))

(declare-fun m!279187 () Bool)

(assert (=> b!179100 m!279187))

(declare-fun m!279189 () Bool)

(assert (=> b!179101 m!279189))

(declare-fun m!279191 () Bool)

(assert (=> b!179101 m!279191))

(declare-fun m!279193 () Bool)

(assert (=> b!179101 m!279193))

(declare-fun m!279195 () Bool)

(assert (=> b!179101 m!279195))

(declare-fun m!279197 () Bool)

(assert (=> b!179101 m!279197))

(declare-fun m!279199 () Bool)

(assert (=> b!179101 m!279199))

(declare-fun m!279201 () Bool)

(assert (=> b!179101 m!279201))

(declare-fun m!279203 () Bool)

(assert (=> b!179107 m!279203))

(declare-fun m!279205 () Bool)

(assert (=> b!179104 m!279205))

(declare-fun m!279207 () Bool)

(assert (=> b!179106 m!279207))

(assert (=> b!179106 m!279207))

(declare-fun m!279209 () Bool)

(assert (=> b!179106 m!279209))

(declare-fun m!279211 () Bool)

(assert (=> b!179097 m!279211))

(assert (=> b!179096 m!279175))

(declare-fun m!279213 () Bool)

(assert (=> start!39624 m!279213))

(declare-fun m!279215 () Bool)

(assert (=> b!179095 m!279215))

(push 1)

