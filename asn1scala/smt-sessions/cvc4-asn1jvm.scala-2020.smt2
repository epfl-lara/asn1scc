; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51680 () Bool)

(assert start!51680)

(declare-fun res!199962 () Bool)

(declare-fun e!165760 () Bool)

(assert (=> start!51680 (=> (not res!199962) (not e!165760))))

(declare-datatypes ((array!12958 0))(
  ( (array!12959 (arr!6669 (Array (_ BitVec 32) (_ BitVec 8))) (size!5682 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10286 0))(
  ( (BitStream!10287 (buf!6136 array!12958) (currentByte!11421 (_ BitVec 32)) (currentBit!11416 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10286)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51680 (= res!199962 (validate_offset_bits!1 ((_ sign_extend 32) (size!5682 (buf!6136 thiss!1854))) ((_ sign_extend 32) (currentByte!11421 thiss!1854)) ((_ sign_extend 32) (currentBit!11416 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51680 e!165760))

(declare-fun e!165761 () Bool)

(declare-fun inv!12 (BitStream!10286) Bool)

(assert (=> start!51680 (and (inv!12 thiss!1854) e!165761)))

(declare-fun b!239416 () Bool)

(declare-fun lt!374037 () (_ BitVec 32))

(assert (=> b!239416 (= e!165760 (and (bvsgt lt!374037 #b00000000000000000000000000000000) (bvsle ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!374037))) #b00000000000000000000000000100000) (or (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!11421 thiss!1854)) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!11421 thiss!1854)) (size!5682 (buf!6136 thiss!1854))))))))

(assert (=> b!239416 (= lt!374037 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!11416 thiss!1854))))))

(declare-fun b!239417 () Bool)

(declare-fun array_inv!5423 (array!12958) Bool)

(assert (=> b!239417 (= e!165761 (array_inv!5423 (buf!6136 thiss!1854)))))

(assert (= (and start!51680 res!199962) b!239416))

(assert (= start!51680 b!239417))

(declare-fun m!361609 () Bool)

(assert (=> start!51680 m!361609))

(declare-fun m!361611 () Bool)

(assert (=> start!51680 m!361611))

(declare-fun m!361613 () Bool)

(assert (=> b!239417 m!361613))

(push 1)

(assert (not start!51680))

(assert (not b!239417))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80822 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80822 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5682 (buf!6136 thiss!1854))) ((_ sign_extend 32) (currentByte!11421 thiss!1854)) ((_ sign_extend 32) (currentBit!11416 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5682 (buf!6136 thiss!1854))) ((_ sign_extend 32) (currentByte!11421 thiss!1854)) ((_ sign_extend 32) (currentBit!11416 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!20336 () Bool)

(assert (= bs!20336 d!80822))

(declare-fun m!361623 () Bool)

(assert (=> bs!20336 m!361623))

(assert (=> start!51680 d!80822))

(declare-fun d!80824 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80824 (= (inv!12 thiss!1854) (invariant!0 (currentBit!11416 thiss!1854) (currentByte!11421 thiss!1854) (size!5682 (buf!6136 thiss!1854))))))

(declare-fun bs!20337 () Bool)

(assert (= bs!20337 d!80824))

(declare-fun m!361625 () Bool)

(assert (=> bs!20337 m!361625))

(assert (=> start!51680 d!80824))

(declare-fun d!80826 () Bool)

(assert (=> d!80826 (= (array_inv!5423 (buf!6136 thiss!1854)) (bvsge (size!5682 (buf!6136 thiss!1854)) #b00000000000000000000000000000000))))

(assert (=> b!239417 d!80826))

(push 1)

(assert (not d!80824))

(assert (not d!80822))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80836 () Bool)

(assert (=> d!80836 (= (invariant!0 (currentBit!11416 thiss!1854) (currentByte!11421 thiss!1854) (size!5682 (buf!6136 thiss!1854))) (and (bvsge (currentBit!11416 thiss!1854) #b00000000000000000000000000000000) (bvslt (currentBit!11416 thiss!1854) #b00000000000000000000000000001000) (bvsge (currentByte!11421 thiss!1854) #b00000000000000000000000000000000) (or (bvslt (currentByte!11421 thiss!1854) (size!5682 (buf!6136 thiss!1854))) (and (= (currentBit!11416 thiss!1854) #b00000000000000000000000000000000) (= (currentByte!11421 thiss!1854) (size!5682 (buf!6136 thiss!1854)))))))))

(assert (=> d!80824 d!80836))

(declare-fun d!80838 () Bool)

(assert (=> d!80838 (= (remainingBits!0 ((_ sign_extend 32) (size!5682 (buf!6136 thiss!1854))) ((_ sign_extend 32) (currentByte!11421 thiss!1854)) ((_ sign_extend 32) (currentBit!11416 thiss!1854))) (bvsub (bvmul ((_ sign_extend 32) (size!5682 (buf!6136 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11421 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11416 thiss!1854)))))))

(assert (=> d!80822 d!80838))

(push 1)

(check-sat)

(pop 1)

