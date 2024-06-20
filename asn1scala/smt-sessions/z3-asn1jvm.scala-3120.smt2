; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71680 () Bool)

(assert start!71680)

(declare-fun b!321963 () Bool)

(declare-fun res!264280 () Bool)

(declare-fun e!232032 () Bool)

(assert (=> b!321963 (=> (not res!264280) (not e!232032))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-fun acc!161 () (_ BitVec 64))

(assert (=> b!321963 (= res!264280 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (= nBits!548 i!743)))))

(declare-fun res!264279 () Bool)

(assert (=> start!71680 (=> (not res!264279) (not e!232032))))

(assert (=> start!71680 (= res!264279 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71680 e!232032))

(assert (=> start!71680 true))

(declare-datatypes ((array!20526 0))(
  ( (array!20527 (arr!10028 (Array (_ BitVec 32) (_ BitVec 8))) (size!8936 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14034 0))(
  ( (BitStream!14035 (buf!8078 array!20526) (currentByte!14889 (_ BitVec 32)) (currentBit!14884 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14034)

(declare-fun e!232030 () Bool)

(declare-fun inv!12 (BitStream!14034) Bool)

(assert (=> start!71680 (and (inv!12 thiss!1793) e!232030)))

(declare-fun b!321964 () Bool)

(declare-fun res!264277 () Bool)

(assert (=> b!321964 (=> (not res!264277) (not e!232032))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!321964 (= res!264277 (validate_offset_bits!1 ((_ sign_extend 32) (size!8936 (buf!8078 thiss!1793))) ((_ sign_extend 32) (currentByte!14889 thiss!1793)) ((_ sign_extend 32) (currentBit!14884 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!321965 () Bool)

(declare-fun res!264278 () Bool)

(assert (=> b!321965 (=> (not res!264278) (not e!232032))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321965 (= res!264278 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!321966 () Bool)

(assert (=> b!321966 (= e!232032 false)))

(declare-fun lt!444704 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321966 (= lt!444704 (bitIndex!0 (size!8936 (buf!8078 thiss!1793)) (currentByte!14889 thiss!1793) (currentBit!14884 thiss!1793)))))

(declare-fun b!321967 () Bool)

(declare-fun array_inv!8488 (array!20526) Bool)

(assert (=> b!321967 (= e!232030 (array_inv!8488 (buf!8078 thiss!1793)))))

(assert (= (and start!71680 res!264279) b!321964))

(assert (= (and b!321964 res!264277) b!321965))

(assert (= (and b!321965 res!264278) b!321963))

(assert (= (and b!321963 res!264280) b!321966))

(assert (= start!71680 b!321967))

(declare-fun m!460231 () Bool)

(assert (=> b!321964 m!460231))

(declare-fun m!460233 () Bool)

(assert (=> b!321967 m!460233))

(declare-fun m!460235 () Bool)

(assert (=> b!321966 m!460235))

(declare-fun m!460237 () Bool)

(assert (=> b!321965 m!460237))

(declare-fun m!460239 () Bool)

(assert (=> start!71680 m!460239))

(check-sat (not b!321966) (not b!321964) (not b!321967) (not start!71680) (not b!321965))
