; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50318 () Bool)

(assert start!50318)

(declare-fun b!236004 () Bool)

(declare-fun res!197247 () Bool)

(declare-fun e!163203 () Bool)

(assert (=> b!236004 (=> (not res!197247) (not e!163203))))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-datatypes ((array!12487 0))(
  ( (array!12488 (arr!6472 (Array (_ BitVec 32) (_ BitVec 8))) (size!5485 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9934 0))(
  ( (BitStream!9935 (buf!5960 array!12487) (currentByte!11077 (_ BitVec 32)) (currentBit!11072 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9934)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!236004 (= res!197247 (validate_offset_bits!1 ((_ sign_extend 32) (size!5485 (buf!5960 thiss!1830))) ((_ sign_extend 32) (currentByte!11077 thiss!1830)) ((_ sign_extend 32) (currentBit!11072 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!236005 () Bool)

(declare-fun res!197249 () Bool)

(assert (=> b!236005 (=> (not res!197249) (not e!163203))))

(assert (=> b!236005 (= res!197249 (= nBits!581 i!752))))

(declare-fun res!197246 () Bool)

(assert (=> start!50318 (=> (not res!197246) (not e!163203))))

(assert (=> start!50318 (= res!197246 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50318 e!163203))

(assert (=> start!50318 true))

(declare-fun e!163205 () Bool)

(declare-fun inv!12 (BitStream!9934) Bool)

(assert (=> start!50318 (and (inv!12 thiss!1830) e!163205)))

(declare-fun b!236006 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!236006 (= e!163203 (not (invariant!0 (currentBit!11072 thiss!1830) (currentByte!11077 thiss!1830) (size!5485 (buf!5960 thiss!1830)))))))

(declare-fun b!236007 () Bool)

(declare-fun res!197250 () Bool)

(assert (=> b!236007 (=> (not res!197250) (not e!163203))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236007 (= res!197250 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!236008 () Bool)

(declare-fun res!197248 () Bool)

(assert (=> b!236008 (=> (not res!197248) (not e!163203))))

(assert (=> b!236008 (= res!197248 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236009 () Bool)

(declare-fun array_inv!5226 (array!12487) Bool)

(assert (=> b!236009 (= e!163205 (array_inv!5226 (buf!5960 thiss!1830)))))

(assert (= (and start!50318 res!197246) b!236004))

(assert (= (and b!236004 res!197247) b!236008))

(assert (= (and b!236008 res!197248) b!236007))

(assert (= (and b!236007 res!197250) b!236005))

(assert (= (and b!236005 res!197249) b!236006))

(assert (= start!50318 b!236009))

(declare-fun m!358623 () Bool)

(assert (=> b!236009 m!358623))

(declare-fun m!358625 () Bool)

(assert (=> b!236006 m!358625))

(declare-fun m!358627 () Bool)

(assert (=> start!50318 m!358627))

(declare-fun m!358629 () Bool)

(assert (=> b!236008 m!358629))

(declare-fun m!358631 () Bool)

(assert (=> b!236007 m!358631))

(declare-fun m!358633 () Bool)

(assert (=> b!236004 m!358633))

(push 1)

(assert (not start!50318))

(assert (not b!236006))

(assert (not b!236007))

(assert (not b!236009))

(assert (not b!236008))

(assert (not b!236004))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79648 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!79648 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5485 (buf!5960 thiss!1830))) ((_ sign_extend 32) (currentByte!11077 thiss!1830)) ((_ sign_extend 32) (currentBit!11072 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5485 (buf!5960 thiss!1830))) ((_ sign_extend 32) (currentByte!11077 thiss!1830)) ((_ sign_extend 32) (currentBit!11072 thiss!1830))) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun bs!19884 () Bool)

(assert (= bs!19884 d!79648))

(declare-fun m!358661 () Bool)

(assert (=> bs!19884 m!358661))

(assert (=> b!236004 d!79648))

(declare-fun d!79652 () Bool)

(assert (=> d!79652 (= (array_inv!5226 (buf!5960 thiss!1830)) (bvsge (size!5485 (buf!5960 thiss!1830)) #b00000000000000000000000000000000))))

(assert (=> b!236009 d!79652))

(declare-fun d!79656 () Bool)

(assert (=> d!79656 (= (onesLSBLong!0 (bvsub nBits!581 i!752)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!581 i!752)))))))

(assert (=> b!236008 d!79656))

(declare-fun d!79660 () Bool)

(assert (=> d!79660 (= (onesLSBLong!0 nBits!581) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!581))))))

(assert (=> b!236007 d!79660))

(declare-fun d!79664 () Bool)

(assert (=> d!79664 (= (inv!12 thiss!1830) (invariant!0 (currentBit!11072 thiss!1830) (currentByte!11077 thiss!1830) (size!5485 (buf!5960 thiss!1830))))))

(declare-fun bs!19886 () Bool)

(assert (= bs!19886 d!79664))

(assert (=> bs!19886 m!358625))

(assert (=> start!50318 d!79664))

(declare-fun d!79670 () Bool)

(assert (=> d!79670 (= (invariant!0 (currentBit!11072 thiss!1830) (currentByte!11077 thiss!1830) (size!5485 (buf!5960 thiss!1830))) (and (bvsge (currentBit!11072 thiss!1830) #b00000000000000000000000000000000) (bvslt (currentBit!11072 thiss!1830) #b00000000000000000000000000001000) (bvsge (currentByte!11077 thiss!1830) #b00000000000000000000000000000000) (or (bvslt (currentByte!11077 thiss!1830) (size!5485 (buf!5960 thiss!1830))) (and (= (currentBit!11072 thiss!1830) #b00000000000000000000000000000000) (= (currentByte!11077 thiss!1830) (size!5485 (buf!5960 thiss!1830)))))))))

(assert (=> b!236006 d!79670))

(push 1)

(assert (not d!79664))

(assert (not d!79648))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

