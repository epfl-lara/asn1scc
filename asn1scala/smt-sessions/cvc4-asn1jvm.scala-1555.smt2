; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43630 () Bool)

(assert start!43630)

(declare-fun b!207053 () Bool)

(declare-fun e!141547 () Bool)

(declare-fun e!141542 () Bool)

(assert (=> b!207053 (= e!141547 e!141542)))

(declare-fun res!173677 () Bool)

(assert (=> b!207053 (=> res!173677 e!141542)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!323295 () (_ BitVec 64))

(declare-fun lt!323294 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!207053 (= res!173677 (not (= lt!323295 (bvsub (bvsub (bvadd lt!323294 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-datatypes ((array!10413 0))(
  ( (array!10414 (arr!5508 (Array (_ BitVec 32) (_ BitVec 8))) (size!4578 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8264 0))(
  ( (BitStream!8265 (buf!5083 array!10413) (currentByte!9601 (_ BitVec 32)) (currentBit!9596 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!14750 0))(
  ( (Unit!14751) )
))
(declare-datatypes ((tuple2!17730 0))(
  ( (tuple2!17731 (_1!9520 Unit!14750) (_2!9520 BitStream!8264)) )
))
(declare-fun lt!323311 () tuple2!17730)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!207053 (= lt!323295 (bitIndex!0 (size!4578 (buf!5083 (_2!9520 lt!323311))) (currentByte!9601 (_2!9520 lt!323311)) (currentBit!9596 (_2!9520 lt!323311))))))

(declare-fun thiss!1204 () BitStream!8264)

(declare-fun isPrefixOf!0 (BitStream!8264 BitStream!8264) Bool)

(assert (=> b!207053 (isPrefixOf!0 thiss!1204 (_2!9520 lt!323311))))

(declare-fun lt!323301 () tuple2!17730)

(declare-fun lt!323309 () Unit!14750)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8264 BitStream!8264 BitStream!8264) Unit!14750)

(assert (=> b!207053 (= lt!323309 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9520 lt!323301) (_2!9520 lt!323311)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8264 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17730)

(assert (=> b!207053 (= lt!323311 (appendBitsLSBFirstLoopTR!0 (_2!9520 lt!323301) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!207054 () Bool)

(declare-fun e!141552 () Bool)

(declare-fun array_inv!4319 (array!10413) Bool)

(assert (=> b!207054 (= e!141552 (array_inv!4319 (buf!5083 thiss!1204)))))

(declare-fun b!207055 () Bool)

(declare-fun res!173687 () Bool)

(declare-fun e!141544 () Bool)

(assert (=> b!207055 (=> (not res!173687) (not e!141544))))

(assert (=> b!207055 (= res!173687 (not (= i!590 nBits!348)))))

(declare-fun b!207056 () Bool)

(declare-fun e!141549 () Bool)

(declare-datatypes ((tuple2!17732 0))(
  ( (tuple2!17733 (_1!9521 BitStream!8264) (_2!9521 Bool)) )
))
(declare-fun lt!323296 () tuple2!17732)

(declare-fun lt!323305 () tuple2!17732)

(assert (=> b!207056 (= e!141549 (= (_2!9521 lt!323296) (_2!9521 lt!323305)))))

(declare-fun b!207057 () Bool)

(declare-fun res!173683 () Bool)

(assert (=> b!207057 (=> res!173683 e!141542)))

(declare-fun lt!323303 () (_ BitVec 64))

(assert (=> b!207057 (= res!173683 (or (not (= (size!4578 (buf!5083 (_2!9520 lt!323311))) (size!4578 (buf!5083 thiss!1204)))) (not (= lt!323295 (bvsub (bvadd lt!323303 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!207058 () Bool)

(declare-fun res!173688 () Bool)

(assert (=> b!207058 (=> (not res!173688) (not e!141544))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!207058 (= res!173688 (invariant!0 (currentBit!9596 thiss!1204) (currentByte!9601 thiss!1204) (size!4578 (buf!5083 thiss!1204))))))

(declare-fun b!207059 () Bool)

(declare-fun res!173681 () Bool)

(assert (=> b!207059 (=> res!173681 e!141542)))

(assert (=> b!207059 (= res!173681 (not (isPrefixOf!0 thiss!1204 (_2!9520 lt!323301))))))

(declare-fun b!207060 () Bool)

(declare-fun res!173686 () Bool)

(declare-fun e!141550 () Bool)

(assert (=> b!207060 (=> (not res!173686) (not e!141550))))

(assert (=> b!207060 (= res!173686 (isPrefixOf!0 thiss!1204 (_2!9520 lt!323301)))))

(declare-fun res!173689 () Bool)

(declare-fun e!141543 () Bool)

(assert (=> start!43630 (=> (not res!173689) (not e!141543))))

(assert (=> start!43630 (= res!173689 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43630 e!141543))

(assert (=> start!43630 true))

(declare-fun inv!12 (BitStream!8264) Bool)

(assert (=> start!43630 (and (inv!12 thiss!1204) e!141552)))

(declare-fun b!207061 () Bool)

(assert (=> b!207061 (= e!141544 (not e!141547))))

(declare-fun res!173678 () Bool)

(assert (=> b!207061 (=> res!173678 e!141547)))

(assert (=> b!207061 (= res!173678 (not (= lt!323294 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!323303))))))

(assert (=> b!207061 (= lt!323294 (bitIndex!0 (size!4578 (buf!5083 (_2!9520 lt!323301))) (currentByte!9601 (_2!9520 lt!323301)) (currentBit!9596 (_2!9520 lt!323301))))))

(assert (=> b!207061 (= lt!323303 (bitIndex!0 (size!4578 (buf!5083 thiss!1204)) (currentByte!9601 thiss!1204) (currentBit!9596 thiss!1204)))))

(declare-fun e!141546 () Bool)

(assert (=> b!207061 e!141546))

(declare-fun res!173675 () Bool)

(assert (=> b!207061 (=> (not res!173675) (not e!141546))))

(assert (=> b!207061 (= res!173675 (= (size!4578 (buf!5083 thiss!1204)) (size!4578 (buf!5083 (_2!9520 lt!323301)))))))

(declare-fun lt!323298 () Bool)

(declare-fun appendBit!0 (BitStream!8264 Bool) tuple2!17730)

(assert (=> b!207061 (= lt!323301 (appendBit!0 thiss!1204 lt!323298))))

(assert (=> b!207061 (= lt!323298 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!207062 () Bool)

(declare-fun lt!323306 () (_ BitVec 32))

(assert (=> b!207062 (= e!141542 (or (= lt!323306 #b00000000000000000000000000000000) (= lt!323306 (bvand (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001) #b10000000000000000000000000000000))))))

(assert (=> b!207062 (= lt!323306 (bvand (bvsub nBits!348 i!590) #b10000000000000000000000000000000))))

(declare-datatypes ((tuple2!17734 0))(
  ( (tuple2!17735 (_1!9522 BitStream!8264) (_2!9522 (_ BitVec 64))) )
))
(declare-fun lt!323299 () tuple2!17734)

(declare-datatypes ((tuple2!17736 0))(
  ( (tuple2!17737 (_1!9523 BitStream!8264) (_2!9523 BitStream!8264)) )
))
(declare-fun lt!323302 () tuple2!17736)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8264 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17734)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!207062 (= lt!323299 (readNBitsLSBFirstsLoopPure!0 (_1!9523 lt!323302) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(declare-fun lt!323293 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!207062 (validate_offset_bits!1 ((_ sign_extend 32) (size!4578 (buf!5083 (_2!9520 lt!323311)))) ((_ sign_extend 32) (currentByte!9601 thiss!1204)) ((_ sign_extend 32) (currentBit!9596 thiss!1204)) lt!323293)))

(declare-fun lt!323308 () Unit!14750)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8264 array!10413 (_ BitVec 64)) Unit!14750)

(assert (=> b!207062 (= lt!323308 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5083 (_2!9520 lt!323311)) lt!323293))))

(declare-fun readBitPure!0 (BitStream!8264) tuple2!17732)

(assert (=> b!207062 (= (_2!9521 (readBitPure!0 (_1!9523 lt!323302))) lt!323298)))

(declare-fun lt!323297 () tuple2!17736)

(declare-fun reader!0 (BitStream!8264 BitStream!8264) tuple2!17736)

(assert (=> b!207062 (= lt!323297 (reader!0 (_2!9520 lt!323301) (_2!9520 lt!323311)))))

(assert (=> b!207062 (= lt!323302 (reader!0 thiss!1204 (_2!9520 lt!323311)))))

(assert (=> b!207062 e!141549))

(declare-fun res!173679 () Bool)

(assert (=> b!207062 (=> (not res!173679) (not e!141549))))

(assert (=> b!207062 (= res!173679 (= (bitIndex!0 (size!4578 (buf!5083 (_1!9521 lt!323296))) (currentByte!9601 (_1!9521 lt!323296)) (currentBit!9596 (_1!9521 lt!323296))) (bitIndex!0 (size!4578 (buf!5083 (_1!9521 lt!323305))) (currentByte!9601 (_1!9521 lt!323305)) (currentBit!9596 (_1!9521 lt!323305)))))))

(declare-fun lt!323304 () Unit!14750)

(declare-fun lt!323310 () BitStream!8264)

(declare-fun readBitPrefixLemma!0 (BitStream!8264 BitStream!8264) Unit!14750)

(assert (=> b!207062 (= lt!323304 (readBitPrefixLemma!0 lt!323310 (_2!9520 lt!323311)))))

(assert (=> b!207062 (= lt!323305 (readBitPure!0 (BitStream!8265 (buf!5083 (_2!9520 lt!323311)) (currentByte!9601 thiss!1204) (currentBit!9596 thiss!1204))))))

(assert (=> b!207062 (= lt!323296 (readBitPure!0 lt!323310))))

(declare-fun e!141551 () Bool)

(assert (=> b!207062 e!141551))

(declare-fun res!173680 () Bool)

(assert (=> b!207062 (=> (not res!173680) (not e!141551))))

(assert (=> b!207062 (= res!173680 (invariant!0 (currentBit!9596 thiss!1204) (currentByte!9601 thiss!1204) (size!4578 (buf!5083 (_2!9520 lt!323301)))))))

(assert (=> b!207062 (= lt!323310 (BitStream!8265 (buf!5083 (_2!9520 lt!323301)) (currentByte!9601 thiss!1204) (currentBit!9596 thiss!1204)))))

(declare-fun b!207063 () Bool)

(assert (=> b!207063 (= e!141543 e!141544)))

(declare-fun res!173684 () Bool)

(assert (=> b!207063 (=> (not res!173684) (not e!141544))))

(assert (=> b!207063 (= res!173684 (validate_offset_bits!1 ((_ sign_extend 32) (size!4578 (buf!5083 thiss!1204))) ((_ sign_extend 32) (currentByte!9601 thiss!1204)) ((_ sign_extend 32) (currentBit!9596 thiss!1204)) lt!323293))))

(assert (=> b!207063 (= lt!323293 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!207064 () Bool)

(declare-fun e!141548 () Bool)

(declare-fun lt!323300 () tuple2!17732)

(declare-fun lt!323307 () (_ BitVec 64))

(assert (=> b!207064 (= e!141548 (= (bitIndex!0 (size!4578 (buf!5083 (_1!9521 lt!323300))) (currentByte!9601 (_1!9521 lt!323300)) (currentBit!9596 (_1!9521 lt!323300))) lt!323307))))

(declare-fun b!207065 () Bool)

(assert (=> b!207065 (= e!141551 (invariant!0 (currentBit!9596 thiss!1204) (currentByte!9601 thiss!1204) (size!4578 (buf!5083 (_2!9520 lt!323311)))))))

(declare-fun b!207066 () Bool)

(declare-fun res!173685 () Bool)

(assert (=> b!207066 (=> res!173685 e!141542)))

(assert (=> b!207066 (= res!173685 (not (isPrefixOf!0 (_2!9520 lt!323301) (_2!9520 lt!323311))))))

(declare-fun b!207067 () Bool)

(declare-fun res!173690 () Bool)

(assert (=> b!207067 (=> res!173690 e!141542)))

(assert (=> b!207067 (= res!173690 (not (invariant!0 (currentBit!9596 (_2!9520 lt!323311)) (currentByte!9601 (_2!9520 lt!323311)) (size!4578 (buf!5083 (_2!9520 lt!323311))))))))

(declare-fun b!207068 () Bool)

(assert (=> b!207068 (= e!141546 e!141550)))

(declare-fun res!173676 () Bool)

(assert (=> b!207068 (=> (not res!173676) (not e!141550))))

(declare-fun lt!323312 () (_ BitVec 64))

(assert (=> b!207068 (= res!173676 (= lt!323307 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!323312)))))

(assert (=> b!207068 (= lt!323307 (bitIndex!0 (size!4578 (buf!5083 (_2!9520 lt!323301))) (currentByte!9601 (_2!9520 lt!323301)) (currentBit!9596 (_2!9520 lt!323301))))))

(assert (=> b!207068 (= lt!323312 (bitIndex!0 (size!4578 (buf!5083 thiss!1204)) (currentByte!9601 thiss!1204) (currentBit!9596 thiss!1204)))))

(declare-fun b!207069 () Bool)

(assert (=> b!207069 (= e!141550 e!141548)))

(declare-fun res!173682 () Bool)

(assert (=> b!207069 (=> (not res!173682) (not e!141548))))

(assert (=> b!207069 (= res!173682 (and (= (_2!9521 lt!323300) lt!323298) (= (_1!9521 lt!323300) (_2!9520 lt!323301))))))

(declare-fun readerFrom!0 (BitStream!8264 (_ BitVec 32) (_ BitVec 32)) BitStream!8264)

(assert (=> b!207069 (= lt!323300 (readBitPure!0 (readerFrom!0 (_2!9520 lt!323301) (currentBit!9596 thiss!1204) (currentByte!9601 thiss!1204))))))

(assert (= (and start!43630 res!173689) b!207063))

(assert (= (and b!207063 res!173684) b!207058))

(assert (= (and b!207058 res!173688) b!207055))

(assert (= (and b!207055 res!173687) b!207061))

(assert (= (and b!207061 res!173675) b!207068))

(assert (= (and b!207068 res!173676) b!207060))

(assert (= (and b!207060 res!173686) b!207069))

(assert (= (and b!207069 res!173682) b!207064))

(assert (= (and b!207061 (not res!173678)) b!207053))

(assert (= (and b!207053 (not res!173677)) b!207067))

(assert (= (and b!207067 (not res!173690)) b!207057))

(assert (= (and b!207057 (not res!173683)) b!207066))

(assert (= (and b!207066 (not res!173685)) b!207059))

(assert (= (and b!207059 (not res!173681)) b!207062))

(assert (= (and b!207062 res!173680) b!207065))

(assert (= (and b!207062 res!173679) b!207056))

(assert (= start!43630 b!207054))

(declare-fun m!318715 () Bool)

(assert (=> b!207062 m!318715))

(declare-fun m!318717 () Bool)

(assert (=> b!207062 m!318717))

(declare-fun m!318719 () Bool)

(assert (=> b!207062 m!318719))

(declare-fun m!318721 () Bool)

(assert (=> b!207062 m!318721))

(declare-fun m!318723 () Bool)

(assert (=> b!207062 m!318723))

(declare-fun m!318725 () Bool)

(assert (=> b!207062 m!318725))

(declare-fun m!318727 () Bool)

(assert (=> b!207062 m!318727))

(declare-fun m!318729 () Bool)

(assert (=> b!207062 m!318729))

(declare-fun m!318731 () Bool)

(assert (=> b!207062 m!318731))

(declare-fun m!318733 () Bool)

(assert (=> b!207062 m!318733))

(declare-fun m!318735 () Bool)

(assert (=> b!207062 m!318735))

(declare-fun m!318737 () Bool)

(assert (=> b!207062 m!318737))

(declare-fun m!318739 () Bool)

(assert (=> b!207062 m!318739))

(declare-fun m!318741 () Bool)

(assert (=> b!207054 m!318741))

(declare-fun m!318743 () Bool)

(assert (=> b!207063 m!318743))

(declare-fun m!318745 () Bool)

(assert (=> b!207068 m!318745))

(declare-fun m!318747 () Bool)

(assert (=> b!207068 m!318747))

(declare-fun m!318749 () Bool)

(assert (=> b!207058 m!318749))

(assert (=> b!207061 m!318745))

(assert (=> b!207061 m!318747))

(declare-fun m!318751 () Bool)

(assert (=> b!207061 m!318751))

(declare-fun m!318753 () Bool)

(assert (=> b!207059 m!318753))

(declare-fun m!318755 () Bool)

(assert (=> b!207069 m!318755))

(assert (=> b!207069 m!318755))

(declare-fun m!318757 () Bool)

(assert (=> b!207069 m!318757))

(declare-fun m!318759 () Bool)

(assert (=> b!207064 m!318759))

(declare-fun m!318761 () Bool)

(assert (=> b!207066 m!318761))

(declare-fun m!318763 () Bool)

(assert (=> b!207053 m!318763))

(declare-fun m!318765 () Bool)

(assert (=> b!207053 m!318765))

(declare-fun m!318767 () Bool)

(assert (=> b!207053 m!318767))

(declare-fun m!318769 () Bool)

(assert (=> b!207053 m!318769))

(assert (=> b!207060 m!318753))

(declare-fun m!318771 () Bool)

(assert (=> b!207067 m!318771))

(declare-fun m!318773 () Bool)

(assert (=> b!207065 m!318773))

(declare-fun m!318775 () Bool)

(assert (=> start!43630 m!318775))

(push 1)

(assert (not b!207062))

(assert (not b!207061))

(assert (not b!207063))

(assert (not b!207066))

(assert (not b!207068))

(assert (not start!43630))

(assert (not b!207053))

(assert (not b!207069))

(assert (not b!207067))

(assert (not b!207058))

(assert (not b!207059))

(assert (not b!207060))

(assert (not b!207065))

(assert (not b!207054))

(assert (not b!207064))

(check-sat)

(pop 1)

(push 1)

(check-sat)

