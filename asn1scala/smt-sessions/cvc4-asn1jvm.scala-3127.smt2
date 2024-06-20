; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71922 () Bool)

(assert start!71922)

(declare-fun b!322574 () Bool)

(declare-fun e!232433 () Bool)

(declare-datatypes ((array!20582 0))(
  ( (array!20583 (arr!10050 (Array (_ BitVec 32) (_ BitVec 8))) (size!8958 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14078 0))(
  ( (BitStream!14079 (buf!8100 array!20582) (currentByte!14950 (_ BitVec 32)) (currentBit!14945 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14078)

(declare-fun array_inv!8510 (array!20582) Bool)

(assert (=> b!322574 (= e!232433 (array_inv!8510 (buf!8100 thiss!1793)))))

(declare-fun b!322575 () Bool)

(declare-fun res!264800 () Bool)

(declare-fun e!232431 () Bool)

(assert (=> b!322575 (=> (not res!264800) (not e!232431))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322575 (= res!264800 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!264801 () Bool)

(assert (=> start!71922 (=> (not res!264801) (not e!232431))))

(declare-fun nBits!548 () (_ BitVec 32))

(assert (=> start!71922 (= res!264801 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71922 e!232431))

(assert (=> start!71922 true))

(declare-fun inv!12 (BitStream!14078) Bool)

(assert (=> start!71922 (and (inv!12 thiss!1793) e!232433)))

(declare-fun b!322576 () Bool)

(declare-fun e!232434 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!322576 (= e!232434 (not (invariant!0 (currentBit!14945 thiss!1793) (currentByte!14950 thiss!1793) (size!8958 (buf!8100 thiss!1793)))))))

(declare-fun b!322577 () Bool)

(declare-fun res!264799 () Bool)

(assert (=> b!322577 (=> (not res!264799) (not e!232431))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!322577 (= res!264799 (validate_offset_bits!1 ((_ sign_extend 32) (size!8958 (buf!8100 thiss!1793))) ((_ sign_extend 32) (currentByte!14950 thiss!1793)) ((_ sign_extend 32) (currentBit!14945 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!322578 () Bool)

(declare-fun res!264798 () Bool)

(assert (=> b!322578 (=> (not res!264798) (not e!232431))))

(assert (=> b!322578 (= res!264798 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(declare-fun b!322579 () Bool)

(assert (=> b!322579 (= e!232431 e!232434)))

(declare-fun res!264802 () Bool)

(assert (=> b!322579 (=> (not res!264802) (not e!232434))))

(declare-datatypes ((tuple2!23582 0))(
  ( (tuple2!23583 (_1!13420 Bool) (_2!13420 BitStream!14078)) )
))
(declare-fun lt!445349 () tuple2!23582)

(declare-datatypes ((tuple2!23584 0))(
  ( (tuple2!23585 (_1!13421 (_ BitVec 64)) (_2!13421 BitStream!14078)) )
))
(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!14078 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23584)

(assert (=> b!322579 (= res!264802 (= (buf!8100 (_2!13421 (readNBitsLSBFirstsLoop!0 (_2!13420 lt!445349) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13420 lt!445349) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))))) (buf!8100 thiss!1793)))))

(declare-fun readBit!0 (BitStream!14078) tuple2!23582)

(assert (=> b!322579 (= lt!445349 (readBit!0 thiss!1793))))

(assert (= (and start!71922 res!264801) b!322577))

(assert (= (and b!322577 res!264799) b!322575))

(assert (= (and b!322575 res!264800) b!322578))

(assert (= (and b!322578 res!264798) b!322579))

(assert (= (and b!322579 res!264802) b!322576))

(assert (= start!71922 b!322574))

(declare-fun m!460849 () Bool)

(assert (=> b!322579 m!460849))

(declare-fun m!460851 () Bool)

(assert (=> b!322579 m!460851))

(declare-fun m!460853 () Bool)

(assert (=> b!322574 m!460853))

(declare-fun m!460855 () Bool)

(assert (=> start!71922 m!460855))

(declare-fun m!460857 () Bool)

(assert (=> b!322576 m!460857))

(declare-fun m!460859 () Bool)

(assert (=> b!322577 m!460859))

(declare-fun m!460861 () Bool)

(assert (=> b!322575 m!460861))

(push 1)

(assert (not b!322575))

(assert (not b!322576))

(assert (not b!322577))

(assert (not b!322579))

(assert (not start!71922))

(assert (not b!322574))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105904 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105904 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8958 (buf!8100 thiss!1793))) ((_ sign_extend 32) (currentByte!14950 thiss!1793)) ((_ sign_extend 32) (currentBit!14945 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8958 (buf!8100 thiss!1793))) ((_ sign_extend 32) (currentByte!14950 thiss!1793)) ((_ sign_extend 32) (currentBit!14945 thiss!1793))) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun bs!27883 () Bool)

(assert (= bs!27883 d!105904))

(declare-fun m!460867 () Bool)

(assert (=> bs!27883 m!460867))

(assert (=> b!322577 d!105904))

(declare-fun d!105910 () Bool)

(assert (=> d!105910 (= (invariant!0 (currentBit!14945 thiss!1793) (currentByte!14950 thiss!1793) (size!8958 (buf!8100 thiss!1793))) (and (bvsge (currentBit!14945 thiss!1793) #b00000000000000000000000000000000) (bvslt (currentBit!14945 thiss!1793) #b00000000000000000000000000001000) (bvsge (currentByte!14950 thiss!1793) #b00000000000000000000000000000000) (or (bvslt (currentByte!14950 thiss!1793) (size!8958 (buf!8100 thiss!1793))) (and (= (currentBit!14945 thiss!1793) #b00000000000000000000000000000000) (= (currentByte!14950 thiss!1793) (size!8958 (buf!8100 thiss!1793)))))))))

