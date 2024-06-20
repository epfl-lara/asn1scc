; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72196 () Bool)

(assert start!72196)

(declare-fun b!323684 () Bool)

(declare-fun e!233183 () Bool)

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(assert (=> b!323684 (= e!233183 (and (bvslt i!743 nBits!548) (or (bvslt ((_ sign_extend 32) i!743) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt ((_ sign_extend 32) i!743) #b0000000000000000000000000000000000000000000000000000000001000000))))))

(declare-fun b!323685 () Bool)

(declare-fun res!265719 () Bool)

(declare-fun e!233179 () Bool)

(assert (=> b!323685 (=> (not res!265719) (not e!233179))))

(declare-datatypes ((array!20688 0))(
  ( (array!20689 (arr!10097 (Array (_ BitVec 32) (_ BitVec 8))) (size!9005 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14172 0))(
  ( (BitStream!14173 (buf!8147 array!20688) (currentByte!15024 (_ BitVec 32)) (currentBit!15019 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!23712 0))(
  ( (tuple2!23713 (_1!13485 (_ BitVec 64)) (_2!13485 BitStream!14172)) )
))
(declare-fun lt!446165 () tuple2!23712)

(declare-fun lt!446163 () (_ BitVec 64))

(declare-fun thiss!1793 () BitStream!14172)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323685 (= res!265719 (= (bitIndex!0 (size!9005 (buf!8147 (_2!13485 lt!446165))) (currentByte!15024 (_2!13485 lt!446165)) (currentBit!15019 (_2!13485 lt!446165))) (bvadd (bitIndex!0 (size!9005 (buf!8147 thiss!1793)) (currentByte!15024 thiss!1793) (currentBit!15019 thiss!1793)) lt!446163)))))

(declare-fun res!265718 () Bool)

(declare-fun e!233184 () Bool)

(assert (=> start!72196 (=> (not res!265718) (not e!233184))))

(assert (=> start!72196 (= res!265718 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!72196 e!233184))

(assert (=> start!72196 true))

(declare-fun e!233180 () Bool)

(declare-fun inv!12 (BitStream!14172) Bool)

(assert (=> start!72196 (and (inv!12 thiss!1793) e!233180)))

(declare-fun b!323686 () Bool)

(declare-fun array_inv!8557 (array!20688) Bool)

(assert (=> b!323686 (= e!233180 (array_inv!8557 (buf!8147 thiss!1793)))))

(declare-fun b!323687 () Bool)

(declare-fun res!265717 () Bool)

(declare-fun e!233182 () Bool)

(assert (=> b!323687 (=> (not res!265717) (not e!233182))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323687 (= res!265717 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!323688 () Bool)

(assert (=> b!323688 (= e!233182 e!233179)))

(declare-fun res!265720 () Bool)

(assert (=> b!323688 (=> (not res!265720) (not e!233179))))

(assert (=> b!323688 (= res!265720 (= (buf!8147 (_2!13485 lt!446165)) (buf!8147 thiss!1793)))))

(declare-datatypes ((tuple2!23714 0))(
  ( (tuple2!23715 (_1!13486 Bool) (_2!13486 BitStream!14172)) )
))
(declare-fun lt!446164 () tuple2!23714)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!14172 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23712)

(assert (=> b!323688 (= lt!446165 (readNBitsLSBFirstsLoop!0 (_2!13486 lt!446164) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13486 lt!446164) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!14172) tuple2!23714)

(assert (=> b!323688 (= lt!446164 (readBit!0 thiss!1793))))

(declare-fun b!323689 () Bool)

(assert (=> b!323689 (= e!233179 e!233183)))

(declare-fun res!265713 () Bool)

(assert (=> b!323689 (=> (not res!265713) (not e!233183))))

(declare-fun lt!446162 () (_ BitVec 64))

(assert (=> b!323689 (= res!265713 (= (bvand (_1!13485 lt!446165) lt!446162) (bvand acc!161 lt!446162)))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323689 (= lt!446162 (onesLSBLong!0 i!743))))

(declare-fun b!323690 () Bool)

(declare-fun res!265716 () Bool)

(assert (=> b!323690 (=> (not res!265716) (not e!233182))))

(assert (=> b!323690 (= res!265716 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(declare-fun b!323691 () Bool)

(declare-fun res!265714 () Bool)

(assert (=> b!323691 (=> (not res!265714) (not e!233183))))

(assert (=> b!323691 (= res!265714 (= (bvand (_1!13485 lt!446165) (onesLSBLong!0 nBits!548)) (_1!13485 lt!446165)))))

(declare-fun b!323692 () Bool)

(assert (=> b!323692 (= e!233184 e!233182)))

(declare-fun res!265715 () Bool)

(assert (=> b!323692 (=> (not res!265715) (not e!233182))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!323692 (= res!265715 (validate_offset_bits!1 ((_ sign_extend 32) (size!9005 (buf!8147 thiss!1793))) ((_ sign_extend 32) (currentByte!15024 thiss!1793)) ((_ sign_extend 32) (currentBit!15019 thiss!1793)) lt!446163))))

(assert (=> b!323692 (= lt!446163 ((_ sign_extend 32) (bvsub nBits!548 i!743)))))

(assert (= (and start!72196 res!265718) b!323692))

(assert (= (and b!323692 res!265715) b!323687))

(assert (= (and b!323687 res!265717) b!323690))

(assert (= (and b!323690 res!265716) b!323688))

(assert (= (and b!323688 res!265720) b!323685))

(assert (= (and b!323685 res!265719) b!323689))

(assert (= (and b!323689 res!265713) b!323691))

(assert (= (and b!323691 res!265714) b!323684))

(assert (= start!72196 b!323686))

(declare-fun m!461705 () Bool)

(assert (=> b!323686 m!461705))

(declare-fun m!461707 () Bool)

(assert (=> start!72196 m!461707))

(declare-fun m!461709 () Bool)

(assert (=> b!323687 m!461709))

(declare-fun m!461711 () Bool)

(assert (=> b!323689 m!461711))

(declare-fun m!461713 () Bool)

(assert (=> b!323692 m!461713))

(declare-fun m!461715 () Bool)

(assert (=> b!323685 m!461715))

(declare-fun m!461717 () Bool)

(assert (=> b!323685 m!461717))

(declare-fun m!461719 () Bool)

(assert (=> b!323688 m!461719))

(declare-fun m!461721 () Bool)

(assert (=> b!323688 m!461721))

(declare-fun m!461723 () Bool)

(assert (=> b!323691 m!461723))

(check-sat (not start!72196) (not b!323692) (not b!323688) (not b!323686) (not b!323685) (not b!323689) (not b!323687) (not b!323691))
(check-sat)
