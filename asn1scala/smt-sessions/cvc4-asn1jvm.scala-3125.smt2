; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71832 () Bool)

(assert start!71832)

(declare-fun b!322314 () Bool)

(declare-fun res!264585 () Bool)

(declare-fun e!232274 () Bool)

(assert (=> b!322314 (=> (not res!264585) (not e!232274))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-datatypes ((array!20567 0))(
  ( (array!20568 (arr!10044 (Array (_ BitVec 32) (_ BitVec 8))) (size!8952 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14066 0))(
  ( (BitStream!14067 (buf!8094 array!20567) (currentByte!14929 (_ BitVec 32)) (currentBit!14924 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14066)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!322314 (= res!264585 (validate_offset_bits!1 ((_ sign_extend 32) (size!8952 (buf!8094 thiss!1793))) ((_ sign_extend 32) (currentByte!14929 thiss!1793)) ((_ sign_extend 32) (currentBit!14924 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!322315 () Bool)

(declare-fun res!264586 () Bool)

(declare-fun e!232273 () Bool)

(assert (=> b!322315 (=> (not res!264586) (not e!232273))))

(declare-datatypes ((tuple2!23548 0))(
  ( (tuple2!23549 (_1!13403 Bool) (_2!13403 BitStream!14066)) )
))
(declare-fun lt!445002 () tuple2!23548)

(assert (=> b!322315 (= res!264586 (validate_offset_bits!1 ((_ sign_extend 32) (size!8952 (buf!8094 (_2!13403 lt!445002)))) ((_ sign_extend 32) (currentByte!14929 (_2!13403 lt!445002))) ((_ sign_extend 32) (currentBit!14924 (_2!13403 lt!445002))) ((_ sign_extend 32) (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743)))))))

(declare-fun b!322317 () Bool)

(declare-fun res!264584 () Bool)

(assert (=> b!322317 (=> (not res!264584) (not e!232273))))

(declare-fun lt!445004 () (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322317 (= res!264584 (= (bvand lt!445004 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!743)))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!322318 () Bool)

(declare-fun res!264580 () Bool)

(assert (=> b!322318 (=> (not res!264580) (not e!232274))))

(declare-fun acc!161 () (_ BitVec 64))

(assert (=> b!322318 (= res!264580 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!322319 () Bool)

(declare-fun e!232275 () Bool)

(assert (=> b!322319 (= e!232275 e!232273)))

(declare-fun res!264581 () Bool)

(assert (=> b!322319 (=> (not res!264581) (not e!232273))))

(assert (=> b!322319 (= res!264581 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!743)) (bvsle (bvadd #b00000000000000000000000000000001 i!743) nBits!548)))))

(assert (=> b!322319 (= lt!445004 (bvor acc!161 (ite (_1!13403 lt!445002) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBit!0 (BitStream!14066) tuple2!23548)

(assert (=> b!322319 (= lt!445002 (readBit!0 thiss!1793))))

(declare-fun b!322316 () Bool)

(declare-fun e!232272 () Bool)

(declare-fun array_inv!8504 (array!20567) Bool)

(assert (=> b!322316 (= e!232272 (array_inv!8504 (buf!8094 thiss!1793)))))

(declare-fun res!264582 () Bool)

(assert (=> start!71832 (=> (not res!264582) (not e!232274))))

(assert (=> start!71832 (= res!264582 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71832 e!232274))

(assert (=> start!71832 true))

(declare-fun inv!12 (BitStream!14066) Bool)

(assert (=> start!71832 (and (inv!12 thiss!1793) e!232272)))

(declare-fun b!322320 () Bool)

(assert (=> b!322320 (= e!232274 e!232275)))

(declare-fun res!264583 () Bool)

(assert (=> b!322320 (=> (not res!264583) (not e!232275))))

(declare-fun lt!445003 () (_ BitVec 64))

(assert (=> b!322320 (= res!264583 (and (= (bvand acc!161 lt!445003) acc!161) (not (= nBits!548 i!743))))))

(assert (=> b!322320 (= lt!445003 #b1111111111111111111111111111111111111111111111111111111111111111)))

(declare-fun b!322321 () Bool)

(assert (=> b!322321 (= e!232273 (not (= (bvand lt!445004 lt!445003) lt!445004)))))

(assert (= (and start!71832 res!264582) b!322314))

(assert (= (and b!322314 res!264585) b!322318))

(assert (= (and b!322318 res!264580) b!322320))

(assert (= (and b!322320 res!264583) b!322319))

(assert (= (and b!322319 res!264581) b!322315))

(assert (= (and b!322315 res!264586) b!322317))

(assert (= (and b!322317 res!264584) b!322321))

(assert (= start!71832 b!322316))

(declare-fun m!460561 () Bool)

(assert (=> b!322316 m!460561))

(declare-fun m!460563 () Bool)

(assert (=> start!71832 m!460563))

(declare-fun m!460565 () Bool)

(assert (=> b!322319 m!460565))

(declare-fun m!460567 () Bool)

(assert (=> b!322314 m!460567))

(declare-fun m!460569 () Bool)

(assert (=> b!322317 m!460569))

(declare-fun m!460571 () Bool)

(assert (=> b!322315 m!460571))

(declare-fun m!460573 () Bool)

(assert (=> b!322318 m!460573))

(push 1)

(assert (not b!322315))

(assert (not b!322318))

(assert (not b!322316))

(assert (not b!322314))

(assert (not start!71832))

(assert (not b!322319))

(assert (not b!322317))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

