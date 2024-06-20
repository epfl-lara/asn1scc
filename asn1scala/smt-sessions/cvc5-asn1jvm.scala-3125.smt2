; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71828 () Bool)

(assert start!71828)

(declare-fun b!322266 () Bool)

(declare-fun res!264540 () Bool)

(declare-fun e!232245 () Bool)

(assert (=> b!322266 (=> (not res!264540) (not e!232245))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322266 (= res!264540 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!322267 () Bool)

(declare-fun res!264542 () Bool)

(assert (=> b!322267 (=> (not res!264542) (not e!232245))))

(declare-datatypes ((array!20563 0))(
  ( (array!20564 (arr!10042 (Array (_ BitVec 32) (_ BitVec 8))) (size!8950 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14062 0))(
  ( (BitStream!14063 (buf!8092 array!20563) (currentByte!14927 (_ BitVec 32)) (currentBit!14922 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14062)

(declare-fun nBits!548 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!322267 (= res!264542 (validate_offset_bits!1 ((_ sign_extend 32) (size!8950 (buf!8092 thiss!1793))) ((_ sign_extend 32) (currentByte!14927 thiss!1793)) ((_ sign_extend 32) (currentBit!14922 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!322268 () Bool)

(declare-fun e!232241 () Bool)

(declare-fun lt!444985 () (_ BitVec 64))

(declare-fun lt!444986 () (_ BitVec 64))

(assert (=> b!322268 (= e!232241 (not (= (bvand lt!444985 lt!444986) lt!444985)))))

(declare-fun b!322269 () Bool)

(declare-fun e!232242 () Bool)

(declare-fun array_inv!8502 (array!20563) Bool)

(assert (=> b!322269 (= e!232242 (array_inv!8502 (buf!8092 thiss!1793)))))

(declare-fun b!322270 () Bool)

(declare-fun res!264543 () Bool)

(assert (=> b!322270 (=> (not res!264543) (not e!232241))))

(assert (=> b!322270 (= res!264543 (= (bvand lt!444985 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!743)))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!264539 () Bool)

(assert (=> start!71828 (=> (not res!264539) (not e!232245))))

(assert (=> start!71828 (= res!264539 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71828 e!232245))

(assert (=> start!71828 true))

(declare-fun inv!12 (BitStream!14062) Bool)

(assert (=> start!71828 (and (inv!12 thiss!1793) e!232242)))

(declare-fun b!322271 () Bool)

(declare-fun e!232243 () Bool)

(assert (=> b!322271 (= e!232245 e!232243)))

(declare-fun res!264544 () Bool)

(assert (=> b!322271 (=> (not res!264544) (not e!232243))))

(assert (=> b!322271 (= res!264544 (and (= (bvand acc!161 lt!444986) acc!161) (not (= nBits!548 i!743))))))

(assert (=> b!322271 (= lt!444986 #b1111111111111111111111111111111111111111111111111111111111111111)))

(declare-fun b!322272 () Bool)

(declare-fun res!264541 () Bool)

(assert (=> b!322272 (=> (not res!264541) (not e!232241))))

(declare-datatypes ((tuple2!23544 0))(
  ( (tuple2!23545 (_1!13401 Bool) (_2!13401 BitStream!14062)) )
))
(declare-fun lt!444984 () tuple2!23544)

(assert (=> b!322272 (= res!264541 (validate_offset_bits!1 ((_ sign_extend 32) (size!8950 (buf!8092 (_2!13401 lt!444984)))) ((_ sign_extend 32) (currentByte!14927 (_2!13401 lt!444984))) ((_ sign_extend 32) (currentBit!14922 (_2!13401 lt!444984))) ((_ sign_extend 32) (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743)))))))

(declare-fun b!322273 () Bool)

(assert (=> b!322273 (= e!232243 e!232241)))

(declare-fun res!264538 () Bool)

(assert (=> b!322273 (=> (not res!264538) (not e!232241))))

(assert (=> b!322273 (= res!264538 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!743)) (bvsle (bvadd #b00000000000000000000000000000001 i!743) nBits!548)))))

(assert (=> b!322273 (= lt!444985 (bvor acc!161 (ite (_1!13401 lt!444984) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBit!0 (BitStream!14062) tuple2!23544)

(assert (=> b!322273 (= lt!444984 (readBit!0 thiss!1793))))

(assert (= (and start!71828 res!264539) b!322267))

(assert (= (and b!322267 res!264542) b!322266))

(assert (= (and b!322266 res!264540) b!322271))

(assert (= (and b!322271 res!264544) b!322273))

(assert (= (and b!322273 res!264538) b!322272))

(assert (= (and b!322272 res!264541) b!322270))

(assert (= (and b!322270 res!264543) b!322268))

(assert (= start!71828 b!322269))

(declare-fun m!460533 () Bool)

(assert (=> b!322266 m!460533))

(declare-fun m!460535 () Bool)

(assert (=> start!71828 m!460535))

(declare-fun m!460537 () Bool)

(assert (=> b!322272 m!460537))

(declare-fun m!460539 () Bool)

(assert (=> b!322267 m!460539))

(declare-fun m!460541 () Bool)

(assert (=> b!322273 m!460541))

(declare-fun m!460543 () Bool)

(assert (=> b!322270 m!460543))

(declare-fun m!460545 () Bool)

(assert (=> b!322269 m!460545))

(push 1)

(assert (not b!322267))

(assert (not b!322269))

(assert (not b!322266))

(assert (not b!322270))

(assert (not b!322272))

(assert (not start!71828))

(assert (not b!322273))

(check-sat)

