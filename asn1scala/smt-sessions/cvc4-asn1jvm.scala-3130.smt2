; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71982 () Bool)

(assert start!71982)

(declare-fun b!322834 () Bool)

(declare-fun e!232616 () Bool)

(declare-datatypes ((array!20603 0))(
  ( (array!20604 (arr!10059 (Array (_ BitVec 32) (_ BitVec 8))) (size!8967 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14096 0))(
  ( (BitStream!14097 (buf!8109 array!20603) (currentByte!14965 (_ BitVec 32)) (currentBit!14960 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14096)

(declare-fun array_inv!8519 (array!20603) Bool)

(assert (=> b!322834 (= e!232616 (array_inv!8519 (buf!8109 thiss!1793)))))

(declare-fun b!322835 () Bool)

(declare-fun e!232614 () Bool)

(declare-fun e!232617 () Bool)

(assert (=> b!322835 (= e!232614 e!232617)))

(declare-fun res!265014 () Bool)

(assert (=> b!322835 (=> (not res!265014) (not e!232617))))

(declare-fun lt!445554 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!322835 (= res!265014 (validate_offset_bits!1 ((_ sign_extend 32) (size!8967 (buf!8109 thiss!1793))) ((_ sign_extend 32) (currentByte!14965 thiss!1793)) ((_ sign_extend 32) (currentBit!14960 thiss!1793)) lt!445554))))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-fun i!743 () (_ BitVec 32))

(assert (=> b!322835 (= lt!445554 ((_ sign_extend 32) (bvsub nBits!548 i!743)))))

(declare-fun res!265017 () Bool)

(assert (=> start!71982 (=> (not res!265017) (not e!232614))))

(assert (=> start!71982 (= res!265017 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71982 e!232614))

(assert (=> start!71982 true))

(declare-fun inv!12 (BitStream!14096) Bool)

(assert (=> start!71982 (and (inv!12 thiss!1793) e!232616)))

(declare-fun acc!161 () (_ BitVec 64))

(declare-fun e!232613 () Bool)

(declare-datatypes ((tuple2!23626 0))(
  ( (tuple2!23627 (_1!13442 (_ BitVec 64)) (_2!13442 BitStream!14096)) )
))
(declare-fun lt!445553 () tuple2!23626)

(declare-fun b!322836 () Bool)

(declare-fun lt!445556 () (_ BitVec 64))

(assert (=> b!322836 (= e!232613 (and (= (bvand (_1!13442 lt!445553) lt!445556) (bvand acc!161 lt!445556)) (bvsgt #b00000000000000000000000000000000 nBits!548)))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322836 (= lt!445556 (onesLSBLong!0 i!743))))

(declare-fun b!322837 () Bool)

(assert (=> b!322837 (= e!232617 e!232613)))

(declare-fun res!265016 () Bool)

(assert (=> b!322837 (=> (not res!265016) (not e!232613))))

(assert (=> b!322837 (= res!265016 (= (buf!8109 (_2!13442 lt!445553)) (buf!8109 thiss!1793)))))

(declare-datatypes ((tuple2!23628 0))(
  ( (tuple2!23629 (_1!13443 Bool) (_2!13443 BitStream!14096)) )
))
(declare-fun lt!445555 () tuple2!23628)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!14096 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23626)

(assert (=> b!322837 (= lt!445553 (readNBitsLSBFirstsLoop!0 (_2!13443 lt!445555) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13443 lt!445555) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!14096) tuple2!23628)

(assert (=> b!322837 (= lt!445555 (readBit!0 thiss!1793))))

(declare-fun b!322838 () Bool)

(declare-fun res!265013 () Bool)

(assert (=> b!322838 (=> (not res!265013) (not e!232617))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322838 (= res!265013 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!322839 () Bool)

(declare-fun res!265018 () Bool)

(assert (=> b!322839 (=> (not res!265018) (not e!232613))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322839 (= res!265018 (= (bitIndex!0 (size!8967 (buf!8109 (_2!13442 lt!445553))) (currentByte!14965 (_2!13442 lt!445553)) (currentBit!14960 (_2!13442 lt!445553))) (bvadd (bitIndex!0 (size!8967 (buf!8109 thiss!1793)) (currentByte!14965 thiss!1793) (currentBit!14960 thiss!1793)) lt!445554)))))

(declare-fun b!322840 () Bool)

(declare-fun res!265015 () Bool)

(assert (=> b!322840 (=> (not res!265015) (not e!232617))))

(assert (=> b!322840 (= res!265015 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(assert (= (and start!71982 res!265017) b!322835))

(assert (= (and b!322835 res!265014) b!322838))

(assert (= (and b!322838 res!265013) b!322840))

(assert (= (and b!322840 res!265015) b!322837))

(assert (= (and b!322837 res!265016) b!322839))

(assert (= (and b!322839 res!265018) b!322836))

(assert (= start!71982 b!322834))

(declare-fun m!461079 () Bool)

(assert (=> b!322838 m!461079))

(declare-fun m!461081 () Bool)

(assert (=> b!322834 m!461081))

(declare-fun m!461083 () Bool)

(assert (=> start!71982 m!461083))

(declare-fun m!461085 () Bool)

(assert (=> b!322835 m!461085))

(declare-fun m!461087 () Bool)

(assert (=> b!322837 m!461087))

(declare-fun m!461089 () Bool)

(assert (=> b!322837 m!461089))

(declare-fun m!461091 () Bool)

(assert (=> b!322839 m!461091))

(declare-fun m!461093 () Bool)

(assert (=> b!322839 m!461093))

(declare-fun m!461095 () Bool)

(assert (=> b!322836 m!461095))

(push 1)

(assert (not b!322836))

(assert (not b!322839))

(assert (not b!322838))

(assert (not b!322835))

(assert (not b!322837))

(assert (not b!322834))

(assert (not start!71982))

(check-sat)

(pop 1)

(push 1)

(check-sat)

