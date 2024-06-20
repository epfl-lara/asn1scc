; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72194 () Bool)

(assert start!72194)

(declare-fun b!323657 () Bool)

(declare-fun e!233162 () Bool)

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(assert (=> b!323657 (= e!233162 (and (bvslt i!743 nBits!548) (or (bvslt ((_ sign_extend 32) i!743) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt ((_ sign_extend 32) i!743) #b0000000000000000000000000000000000000000000000000000000001000000))))))

(declare-fun b!323658 () Bool)

(declare-fun e!233165 () Bool)

(declare-fun e!233164 () Bool)

(assert (=> b!323658 (= e!233165 e!233164)))

(declare-fun res!265694 () Bool)

(assert (=> b!323658 (=> (not res!265694) (not e!233164))))

(declare-datatypes ((array!20686 0))(
  ( (array!20687 (arr!10096 (Array (_ BitVec 32) (_ BitVec 8))) (size!9004 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14170 0))(
  ( (BitStream!14171 (buf!8146 array!20686) (currentByte!15023 (_ BitVec 32)) (currentBit!15018 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!23708 0))(
  ( (tuple2!23709 (_1!13483 (_ BitVec 64)) (_2!13483 BitStream!14170)) )
))
(declare-fun lt!446151 () tuple2!23708)

(declare-fun thiss!1793 () BitStream!14170)

(assert (=> b!323658 (= res!265694 (= (buf!8146 (_2!13483 lt!446151)) (buf!8146 thiss!1793)))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-datatypes ((tuple2!23710 0))(
  ( (tuple2!23711 (_1!13484 Bool) (_2!13484 BitStream!14170)) )
))
(declare-fun lt!446152 () tuple2!23710)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!14170 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23708)

(assert (=> b!323658 (= lt!446151 (readNBitsLSBFirstsLoop!0 (_2!13484 lt!446152) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13484 lt!446152) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!14170) tuple2!23710)

(assert (=> b!323658 (= lt!446152 (readBit!0 thiss!1793))))

(declare-fun b!323659 () Bool)

(assert (=> b!323659 (= e!233164 e!233162)))

(declare-fun res!265689 () Bool)

(assert (=> b!323659 (=> (not res!265689) (not e!233162))))

(declare-fun lt!446150 () (_ BitVec 64))

(assert (=> b!323659 (= res!265689 (= (bvand (_1!13483 lt!446151) lt!446150) (bvand acc!161 lt!446150)))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323659 (= lt!446150 (onesLSBLong!0 i!743))))

(declare-fun b!323660 () Bool)

(declare-fun res!265696 () Bool)

(assert (=> b!323660 (=> (not res!265696) (not e!233165))))

(assert (=> b!323660 (= res!265696 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(declare-fun b!323661 () Bool)

(declare-fun res!265691 () Bool)

(assert (=> b!323661 (=> (not res!265691) (not e!233164))))

(declare-fun lt!446153 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323661 (= res!265691 (= (bitIndex!0 (size!9004 (buf!8146 (_2!13483 lt!446151))) (currentByte!15023 (_2!13483 lt!446151)) (currentBit!15018 (_2!13483 lt!446151))) (bvadd (bitIndex!0 (size!9004 (buf!8146 thiss!1793)) (currentByte!15023 thiss!1793) (currentBit!15018 thiss!1793)) lt!446153)))))

(declare-fun b!323662 () Bool)

(declare-fun res!265693 () Bool)

(assert (=> b!323662 (=> (not res!265693) (not e!233162))))

(assert (=> b!323662 (= res!265693 (= (bvand (_1!13483 lt!446151) (onesLSBLong!0 nBits!548)) (_1!13483 lt!446151)))))

(declare-fun res!265690 () Bool)

(declare-fun e!233161 () Bool)

(assert (=> start!72194 (=> (not res!265690) (not e!233161))))

(assert (=> start!72194 (= res!265690 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!72194 e!233161))

(assert (=> start!72194 true))

(declare-fun e!233163 () Bool)

(declare-fun inv!12 (BitStream!14170) Bool)

(assert (=> start!72194 (and (inv!12 thiss!1793) e!233163)))

(declare-fun b!323663 () Bool)

(declare-fun array_inv!8556 (array!20686) Bool)

(assert (=> b!323663 (= e!233163 (array_inv!8556 (buf!8146 thiss!1793)))))

(declare-fun b!323664 () Bool)

(declare-fun res!265695 () Bool)

(assert (=> b!323664 (=> (not res!265695) (not e!233165))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323664 (= res!265695 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!323665 () Bool)

(assert (=> b!323665 (= e!233161 e!233165)))

(declare-fun res!265692 () Bool)

(assert (=> b!323665 (=> (not res!265692) (not e!233165))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!323665 (= res!265692 (validate_offset_bits!1 ((_ sign_extend 32) (size!9004 (buf!8146 thiss!1793))) ((_ sign_extend 32) (currentByte!15023 thiss!1793)) ((_ sign_extend 32) (currentBit!15018 thiss!1793)) lt!446153))))

(assert (=> b!323665 (= lt!446153 ((_ sign_extend 32) (bvsub nBits!548 i!743)))))

(assert (= (and start!72194 res!265690) b!323665))

(assert (= (and b!323665 res!265692) b!323664))

(assert (= (and b!323664 res!265695) b!323660))

(assert (= (and b!323660 res!265696) b!323658))

(assert (= (and b!323658 res!265694) b!323661))

(assert (= (and b!323661 res!265691) b!323659))

(assert (= (and b!323659 res!265689) b!323662))

(assert (= (and b!323662 res!265693) b!323657))

(assert (= start!72194 b!323663))

(declare-fun m!461685 () Bool)

(assert (=> b!323659 m!461685))

(declare-fun m!461687 () Bool)

(assert (=> b!323665 m!461687))

(declare-fun m!461689 () Bool)

(assert (=> b!323662 m!461689))

(declare-fun m!461691 () Bool)

(assert (=> b!323663 m!461691))

(declare-fun m!461693 () Bool)

(assert (=> start!72194 m!461693))

(declare-fun m!461695 () Bool)

(assert (=> b!323661 m!461695))

(declare-fun m!461697 () Bool)

(assert (=> b!323661 m!461697))

(declare-fun m!461699 () Bool)

(assert (=> b!323658 m!461699))

(declare-fun m!461701 () Bool)

(assert (=> b!323658 m!461701))

(declare-fun m!461703 () Bool)

(assert (=> b!323664 m!461703))

(push 1)

(assert (not b!323659))

(assert (not b!323661))

(assert (not b!323664))

(assert (not b!323658))

(assert (not b!323665))

(assert (not start!72194))

(assert (not b!323662))

(assert (not b!323663))

(check-sat)

(pop 1)

(push 1)

(check-sat)

