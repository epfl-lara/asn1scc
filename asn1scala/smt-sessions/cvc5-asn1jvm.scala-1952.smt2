; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50792 () Bool)

(assert start!50792)

(declare-fun b!237588 () Bool)

(declare-fun res!198585 () Bool)

(declare-fun e!164220 () Bool)

(assert (=> b!237588 (=> (not res!198585) (not e!164220))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237588 (= res!198585 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237589 () Bool)

(declare-fun e!164222 () Bool)

(declare-datatypes ((array!12637 0))(
  ( (array!12638 (arr!6535 (Array (_ BitVec 32) (_ BitVec 8))) (size!5548 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10060 0))(
  ( (BitStream!10061 (buf!6023 array!12637) (currentByte!11203 (_ BitVec 32)) (currentBit!11198 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10060)

(declare-fun array_inv!5289 (array!12637) Bool)

(assert (=> b!237589 (= e!164222 (array_inv!5289 (buf!6023 thiss!1830)))))

(declare-fun b!237590 () Bool)

(declare-fun res!198583 () Bool)

(assert (=> b!237590 (=> (not res!198583) (not e!164220))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237590 (= res!198583 (validate_offset_bits!1 ((_ sign_extend 32) (size!5548 (buf!6023 thiss!1830))) ((_ sign_extend 32) (currentByte!11203 thiss!1830)) ((_ sign_extend 32) (currentBit!11198 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!237591 () Bool)

(assert (=> b!237591 (= e!164220 false)))

(declare-fun lt!372870 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237591 (= lt!372870 (bitIndex!0 (size!5548 (buf!6023 thiss!1830)) (currentByte!11203 thiss!1830) (currentBit!11198 thiss!1830)))))

(declare-fun res!198581 () Bool)

(assert (=> start!50792 (=> (not res!198581) (not e!164220))))

(assert (=> start!50792 (= res!198581 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50792 e!164220))

(assert (=> start!50792 true))

(declare-fun inv!12 (BitStream!10060) Bool)

(assert (=> start!50792 (and (inv!12 thiss!1830) e!164222)))

(declare-fun b!237592 () Bool)

(declare-fun res!198582 () Bool)

(assert (=> b!237592 (=> (not res!198582) (not e!164220))))

(assert (=> b!237592 (= res!198582 (= nBits!581 i!752))))

(declare-fun b!237593 () Bool)

(declare-fun res!198584 () Bool)

(assert (=> b!237593 (=> (not res!198584) (not e!164220))))

(assert (=> b!237593 (= res!198584 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(assert (= (and start!50792 res!198581) b!237590))

(assert (= (and b!237590 res!198583) b!237588))

(assert (= (and b!237588 res!198585) b!237593))

(assert (= (and b!237593 res!198584) b!237592))

(assert (= (and b!237592 res!198582) b!237591))

(assert (= start!50792 b!237589))

(declare-fun m!359991 () Bool)

(assert (=> b!237590 m!359991))

(declare-fun m!359993 () Bool)

(assert (=> start!50792 m!359993))

(declare-fun m!359995 () Bool)

(assert (=> b!237591 m!359995))

(declare-fun m!359997 () Bool)

(assert (=> b!237593 m!359997))

(declare-fun m!359999 () Bool)

(assert (=> b!237588 m!359999))

(declare-fun m!360001 () Bool)

(assert (=> b!237589 m!360001))

(push 1)

(assert (not start!50792))

(assert (not b!237589))

(assert (not b!237590))

(assert (not b!237591))

(assert (not b!237588))

(assert (not b!237593))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

