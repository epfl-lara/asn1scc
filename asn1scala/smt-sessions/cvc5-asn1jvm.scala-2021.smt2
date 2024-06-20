; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51712 () Bool)

(assert start!51712)

(declare-fun res!199965 () Bool)

(declare-fun e!165769 () Bool)

(assert (=> start!51712 (=> (not res!199965) (not e!165769))))

(declare-datatypes ((array!12963 0))(
  ( (array!12964 (arr!6670 (Array (_ BitVec 32) (_ BitVec 8))) (size!5683 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10288 0))(
  ( (BitStream!10289 (buf!6137 array!12963) (currentByte!11431 (_ BitVec 32)) (currentBit!11426 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10288)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51712 (= res!199965 (validate_offset_bits!1 ((_ sign_extend 32) (size!5683 (buf!6137 thiss!1854))) ((_ sign_extend 32) (currentByte!11431 thiss!1854)) ((_ sign_extend 32) (currentBit!11426 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51712 e!165769))

(declare-fun e!165768 () Bool)

(declare-fun inv!12 (BitStream!10288) Bool)

(assert (=> start!51712 (and (inv!12 thiss!1854) e!165768)))

(declare-fun b!239422 () Bool)

(declare-fun lt!374043 () (_ BitVec 64))

(declare-fun lt!374042 () (_ BitVec 64))

(assert (=> b!239422 (= e!165769 (and (= lt!374043 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= lt!374043 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!374042) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!239422 (= lt!374043 (bvand lt!374042 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!239422 (= lt!374042 (bitIndex!0 (size!5683 (buf!6137 thiss!1854)) (currentByte!11431 thiss!1854) (currentBit!11426 thiss!1854)))))

(declare-fun b!239423 () Bool)

(declare-fun array_inv!5424 (array!12963) Bool)

(assert (=> b!239423 (= e!165768 (array_inv!5424 (buf!6137 thiss!1854)))))

(assert (= (and start!51712 res!199965) b!239422))

(assert (= start!51712 b!239423))

(declare-fun m!361627 () Bool)

(assert (=> start!51712 m!361627))

(declare-fun m!361629 () Bool)

(assert (=> start!51712 m!361629))

(declare-fun m!361631 () Bool)

(assert (=> b!239422 m!361631))

(declare-fun m!361633 () Bool)

(assert (=> b!239423 m!361633))

(push 1)

(assert (not start!51712))

(assert (not b!239422))

(assert (not b!239423))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80842 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80842 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5683 (buf!6137 thiss!1854))) ((_ sign_extend 32) (currentByte!11431 thiss!1854)) ((_ sign_extend 32) (currentBit!11426 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5683 (buf!6137 thiss!1854))) ((_ sign_extend 32) (currentByte!11431 thiss!1854)) ((_ sign_extend 32) (currentBit!11426 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!20341 () Bool)

(assert (= bs!20341 d!80842))

(declare-fun m!361651 () Bool)

(assert (=> bs!20341 m!361651))

(assert (=> start!51712 d!80842))

(declare-fun d!80844 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80844 (= (inv!12 thiss!1854) (invariant!0 (currentBit!11426 thiss!1854) (currentByte!11431 thiss!1854) (size!5683 (buf!6137 thiss!1854))))))

(declare-fun bs!20342 () Bool)

(assert (= bs!20342 d!80844))

(declare-fun m!361653 () Bool)

(assert (=> bs!20342 m!361653))

(assert (=> start!51712 d!80844))

(declare-fun d!80846 () Bool)

(declare-fun e!165791 () Bool)

(assert (=> d!80846 e!165791))

(declare-fun res!199977 () Bool)

(assert (=> d!80846 (=> (not res!199977) (not e!165791))))

(declare-fun lt!374072 () (_ BitVec 64))

(declare-fun lt!374068 () (_ BitVec 64))

(declare-fun lt!374073 () (_ BitVec 64))

(assert (=> d!80846 (= res!199977 (= lt!374072 (bvsub lt!374073 lt!374068)))))

(assert (=> d!80846 (or (= (bvand lt!374073 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374068 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!374073 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!374073 lt!374068) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!80846 (= lt!374068 (remainingBits!0 ((_ sign_extend 32) (size!5683 (buf!6137 thiss!1854))) ((_ sign_extend 32) (currentByte!11431 thiss!1854)) ((_ sign_extend 32) (currentBit!11426 thiss!1854))))))

(declare-fun lt!374070 () (_ BitVec 64))

(declare-fun lt!374069 () (_ BitVec 64))

(assert (=> d!80846 (= lt!374073 (bvmul lt!374070 lt!374069))))

(assert (=> d!80846 (or (= lt!374070 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!374069 (bvsdiv (bvmul lt!374070 lt!374069) lt!374070)))))

(assert (=> d!80846 (= lt!374069 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!80846 (= lt!374070 ((_ sign_extend 32) (size!5683 (buf!6137 thiss!1854))))))

(assert (=> d!80846 (= lt!374072 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11431 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11426 thiss!1854))))))

(assert (=> d!80846 (invariant!0 (currentBit!11426 thiss!1854) (currentByte!11431 thiss!1854) (size!5683 (buf!6137 thiss!1854)))))

(assert (=> d!80846 (= (bitIndex!0 (size!5683 (buf!6137 thiss!1854)) (currentByte!11431 thiss!1854) (currentBit!11426 thiss!1854)) lt!374072)))

(declare-fun b!239440 () Bool)

(declare-fun res!199976 () Bool)

(assert (=> b!239440 (=> (not res!199976) (not e!165791))))

(assert (=> b!239440 (= res!199976 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!374072))))

(declare-fun b!239441 () Bool)

(declare-fun lt!374071 () (_ BitVec 64))

(assert (=> b!239441 (= e!165791 (bvsle lt!374072 (bvmul lt!374071 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!239441 (or (= lt!374071 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!374071 #b0000000000000000000000000000000000000000000000000000000000001000) lt!374071)))))

(assert (=> b!239441 (= lt!374071 ((_ sign_extend 32) (size!5683 (buf!6137 thiss!1854))))))

(assert (= (and d!80846 res!199977) b!239440))

(assert (= (and b!239440 res!199976) b!239441))

(assert (=> d!80846 m!361651))

(assert (=> d!80846 m!361653))

(assert (=> b!239422 d!80846))

(declare-fun d!80862 () Bool)

(assert (=> d!80862 (= (array_inv!5424 (buf!6137 thiss!1854)) (bvsge (size!5683 (buf!6137 thiss!1854)) #b00000000000000000000000000000000))))

(assert (=> b!239423 d!80862))

(push 1)

(assert (not d!80846))

(assert (not d!80842))

(assert (not d!80844))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

