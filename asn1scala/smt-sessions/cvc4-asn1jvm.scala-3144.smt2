; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72198 () Bool)

(assert start!72198)

(declare-fun b!323711 () Bool)

(declare-fun res!265741 () Bool)

(declare-fun e!233198 () Bool)

(assert (=> b!323711 (=> (not res!265741) (not e!233198))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323711 (= res!265741 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!323712 () Bool)

(declare-fun res!265742 () Bool)

(assert (=> b!323712 (=> (not res!265742) (not e!233198))))

(declare-fun nBits!548 () (_ BitVec 32))

(assert (=> b!323712 (= res!265742 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(declare-fun b!323713 () Bool)

(declare-fun e!233201 () Bool)

(assert (=> b!323713 (= e!233198 e!233201)))

(declare-fun res!265743 () Bool)

(assert (=> b!323713 (=> (not res!265743) (not e!233201))))

(declare-datatypes ((array!20690 0))(
  ( (array!20691 (arr!10098 (Array (_ BitVec 32) (_ BitVec 8))) (size!9006 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14174 0))(
  ( (BitStream!14175 (buf!8148 array!20690) (currentByte!15025 (_ BitVec 32)) (currentBit!15020 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!23716 0))(
  ( (tuple2!23717 (_1!13487 (_ BitVec 64)) (_2!13487 BitStream!14174)) )
))
(declare-fun lt!446175 () tuple2!23716)

(declare-fun thiss!1793 () BitStream!14174)

(assert (=> b!323713 (= res!265743 (= (buf!8148 (_2!13487 lt!446175)) (buf!8148 thiss!1793)))))

(declare-datatypes ((tuple2!23718 0))(
  ( (tuple2!23719 (_1!13488 Bool) (_2!13488 BitStream!14174)) )
))
(declare-fun lt!446174 () tuple2!23718)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!14174 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23716)

(assert (=> b!323713 (= lt!446175 (readNBitsLSBFirstsLoop!0 (_2!13488 lt!446174) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13488 lt!446174) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!14174) tuple2!23718)

(assert (=> b!323713 (= lt!446174 (readBit!0 thiss!1793))))

(declare-fun b!323714 () Bool)

(declare-fun res!265740 () Bool)

(assert (=> b!323714 (=> (not res!265740) (not e!233201))))

(declare-fun lt!446177 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323714 (= res!265740 (= (bitIndex!0 (size!9006 (buf!8148 (_2!13487 lt!446175))) (currentByte!15025 (_2!13487 lt!446175)) (currentBit!15020 (_2!13487 lt!446175))) (bvadd (bitIndex!0 (size!9006 (buf!8148 thiss!1793)) (currentByte!15025 thiss!1793) (currentBit!15020 thiss!1793)) lt!446177)))))

(declare-fun res!265737 () Bool)

(declare-fun e!233200 () Bool)

(assert (=> start!72198 (=> (not res!265737) (not e!233200))))

(assert (=> start!72198 (= res!265737 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!72198 e!233200))

(assert (=> start!72198 true))

(declare-fun e!233197 () Bool)

(declare-fun inv!12 (BitStream!14174) Bool)

(assert (=> start!72198 (and (inv!12 thiss!1793) e!233197)))

(declare-fun b!323715 () Bool)

(declare-fun array_inv!8558 (array!20690) Bool)

(assert (=> b!323715 (= e!233197 (array_inv!8558 (buf!8148 thiss!1793)))))

(declare-fun b!323716 () Bool)

(declare-fun res!265738 () Bool)

(declare-fun e!233199 () Bool)

(assert (=> b!323716 (=> (not res!265738) (not e!233199))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323716 (= res!265738 (= (bvand (_1!13487 lt!446175) (onesLSBLong!0 nBits!548)) (_1!13487 lt!446175)))))

(declare-fun b!323717 () Bool)

(assert (=> b!323717 (= e!233199 (and (bvslt i!743 nBits!548) (or (bvslt ((_ sign_extend 32) i!743) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt ((_ sign_extend 32) i!743) #b0000000000000000000000000000000000000000000000000000000001000000))))))

(declare-fun b!323718 () Bool)

(assert (=> b!323718 (= e!233201 e!233199)))

(declare-fun res!265739 () Bool)

(assert (=> b!323718 (=> (not res!265739) (not e!233199))))

(declare-fun lt!446176 () (_ BitVec 64))

(assert (=> b!323718 (= res!265739 (= (bvand (_1!13487 lt!446175) lt!446176) (bvand acc!161 lt!446176)))))

(assert (=> b!323718 (= lt!446176 (onesLSBLong!0 i!743))))

(declare-fun b!323719 () Bool)

(assert (=> b!323719 (= e!233200 e!233198)))

(declare-fun res!265744 () Bool)

(assert (=> b!323719 (=> (not res!265744) (not e!233198))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!323719 (= res!265744 (validate_offset_bits!1 ((_ sign_extend 32) (size!9006 (buf!8148 thiss!1793))) ((_ sign_extend 32) (currentByte!15025 thiss!1793)) ((_ sign_extend 32) (currentBit!15020 thiss!1793)) lt!446177))))

(assert (=> b!323719 (= lt!446177 ((_ sign_extend 32) (bvsub nBits!548 i!743)))))

(assert (= (and start!72198 res!265737) b!323719))

(assert (= (and b!323719 res!265744) b!323711))

(assert (= (and b!323711 res!265741) b!323712))

(assert (= (and b!323712 res!265742) b!323713))

(assert (= (and b!323713 res!265743) b!323714))

(assert (= (and b!323714 res!265740) b!323718))

(assert (= (and b!323718 res!265739) b!323716))

(assert (= (and b!323716 res!265738) b!323717))

(assert (= start!72198 b!323715))

(declare-fun m!461725 () Bool)

(assert (=> b!323716 m!461725))

(declare-fun m!461727 () Bool)

(assert (=> start!72198 m!461727))

(declare-fun m!461729 () Bool)

(assert (=> b!323715 m!461729))

(declare-fun m!461731 () Bool)

(assert (=> b!323711 m!461731))

(declare-fun m!461733 () Bool)

(assert (=> b!323719 m!461733))

(declare-fun m!461735 () Bool)

(assert (=> b!323713 m!461735))

(declare-fun m!461737 () Bool)

(assert (=> b!323713 m!461737))

(declare-fun m!461739 () Bool)

(assert (=> b!323718 m!461739))

(declare-fun m!461741 () Bool)

(assert (=> b!323714 m!461741))

(declare-fun m!461743 () Bool)

(assert (=> b!323714 m!461743))

(push 1)

(assert (not b!323711))

(assert (not b!323716))

(assert (not start!72198))

(assert (not b!323715))

(assert (not b!323718))

(assert (not b!323713))

(assert (not b!323714))

(assert (not b!323719))

(check-sat)

(pop 1)

(push 1)

(check-sat)

