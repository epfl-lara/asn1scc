; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51742 () Bool)

(assert start!51742)

(declare-fun res!199992 () Bool)

(declare-fun e!165804 () Bool)

(assert (=> start!51742 (=> (not res!199992) (not e!165804))))

(declare-datatypes ((array!12972 0))(
  ( (array!12973 (arr!6673 (Array (_ BitVec 32) (_ BitVec 8))) (size!5686 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10294 0))(
  ( (BitStream!10295 (buf!6140 array!12972) (currentByte!11440 (_ BitVec 32)) (currentBit!11435 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10294)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51742 (= res!199992 (validate_offset_bits!1 ((_ sign_extend 32) (size!5686 (buf!6140 thiss!1854))) ((_ sign_extend 32) (currentByte!11440 thiss!1854)) ((_ sign_extend 32) (currentBit!11435 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51742 e!165804))

(declare-fun e!165805 () Bool)

(declare-fun inv!12 (BitStream!10294) Bool)

(assert (=> start!51742 (and (inv!12 thiss!1854) e!165805)))

(declare-fun b!239458 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!239458 (= e!165804 (not (= (bitIndex!0 (size!5686 (buf!6140 thiss!1854)) (bvadd #b00000000000000000000000000000001 (currentByte!11440 thiss!1854)) (currentBit!11435 thiss!1854)) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!5686 (buf!6140 thiss!1854)) (currentByte!11440 thiss!1854) (currentBit!11435 thiss!1854))))))))

(declare-fun b!239459 () Bool)

(declare-fun array_inv!5427 (array!12972) Bool)

(assert (=> b!239459 (= e!165805 (array_inv!5427 (buf!6140 thiss!1854)))))

(assert (= (and start!51742 res!199992) b!239458))

(assert (= start!51742 b!239459))

(declare-fun m!361663 () Bool)

(assert (=> start!51742 m!361663))

(declare-fun m!361665 () Bool)

(assert (=> start!51742 m!361665))

(declare-fun m!361667 () Bool)

(assert (=> b!239458 m!361667))

(declare-fun m!361669 () Bool)

(assert (=> b!239458 m!361669))

(declare-fun m!361671 () Bool)

(assert (=> b!239459 m!361671))

(push 1)

(assert (not b!239459))

(assert (not start!51742))

(assert (not b!239458))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80874 () Bool)

(assert (=> d!80874 (= (array_inv!5427 (buf!6140 thiss!1854)) (bvsge (size!5686 (buf!6140 thiss!1854)) #b00000000000000000000000000000000))))

(assert (=> b!239459 d!80874))

(declare-fun d!80876 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80876 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5686 (buf!6140 thiss!1854))) ((_ sign_extend 32) (currentByte!11440 thiss!1854)) ((_ sign_extend 32) (currentBit!11435 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5686 (buf!6140 thiss!1854))) ((_ sign_extend 32) (currentByte!11440 thiss!1854)) ((_ sign_extend 32) (currentBit!11435 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!20352 () Bool)

(assert (= bs!20352 d!80876))

(declare-fun m!361697 () Bool)

(assert (=> bs!20352 m!361697))

(assert (=> start!51742 d!80876))

(declare-fun d!80878 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80878 (= (inv!12 thiss!1854) (invariant!0 (currentBit!11435 thiss!1854) (currentByte!11440 thiss!1854) (size!5686 (buf!6140 thiss!1854))))))

(declare-fun bs!20353 () Bool)

(assert (= bs!20353 d!80878))

(declare-fun m!361699 () Bool)

(assert (=> bs!20353 m!361699))

(assert (=> start!51742 d!80878))

(declare-fun d!80880 () Bool)

(declare-fun e!165831 () Bool)

(assert (=> d!80880 e!165831))

(declare-fun res!200012 () Bool)

(assert (=> d!80880 (=> (not res!200012) (not e!165831))))

(declare-fun lt!374149 () (_ BitVec 64))

(declare-fun lt!374151 () (_ BitVec 64))

(declare-fun lt!374148 () (_ BitVec 64))

(assert (=> d!80880 (= res!200012 (= lt!374149 (bvsub lt!374148 lt!374151)))))

(assert (=> d!80880 (or (= (bvand lt!374148 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374151 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!374148 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!374148 lt!374151) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!80880 (= lt!374151 (remainingBits!0 ((_ sign_extend 32) (size!5686 (buf!6140 thiss!1854))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!11440 thiss!1854))) ((_ sign_extend 32) (currentBit!11435 thiss!1854))))))

(declare-fun lt!374150 () (_ BitVec 64))

(declare-fun lt!374147 () (_ BitVec 64))

(assert (=> d!80880 (= lt!374148 (bvmul lt!374150 lt!374147))))

(assert (=> d!80880 (or (= lt!374150 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!374147 (bvsdiv (bvmul lt!374150 lt!374147) lt!374150)))))

(assert (=> d!80880 (= lt!374147 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!80880 (= lt!374150 ((_ sign_extend 32) (size!5686 (buf!6140 thiss!1854))))))

(assert (=> d!80880 (= lt!374149 (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!11440 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11435 thiss!1854))))))

(assert (=> d!80880 (invariant!0 (currentBit!11435 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11440 thiss!1854)) (size!5686 (buf!6140 thiss!1854)))))

(assert (=> d!80880 (= (bitIndex!0 (size!5686 (buf!6140 thiss!1854)) (bvadd #b00000000000000000000000000000001 (currentByte!11440 thiss!1854)) (currentBit!11435 thiss!1854)) lt!374149)))

(declare-fun b!239484 () Bool)

(declare-fun res!200011 () Bool)

(assert (=> b!239484 (=> (not res!200011) (not e!165831))))

(assert (=> b!239484 (= res!200011 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!374149))))

(declare-fun b!239485 () Bool)

(declare-fun lt!374146 () (_ BitVec 64))

(assert (=> b!239485 (= e!165831 (bvsle lt!374149 (bvmul lt!374146 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!239485 (or (= lt!374146 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!374146 #b0000000000000000000000000000000000000000000000000000000000001000) lt!374146)))))

(assert (=> b!239485 (= lt!374146 ((_ sign_extend 32) (size!5686 (buf!6140 thiss!1854))))))

(assert (= (and d!80880 res!200012) b!239484))

(assert (= (and b!239484 res!200011) b!239485))

(declare-fun m!361709 () Bool)

(assert (=> d!80880 m!361709))

(declare-fun m!361711 () Bool)

(assert (=> d!80880 m!361711))

(assert (=> b!239458 d!80880))

(declare-fun d!80894 () Bool)

(declare-fun e!165832 () Bool)

(assert (=> d!80894 e!165832))

(declare-fun res!200014 () Bool)

(assert (=> d!80894 (=> (not res!200014) (not e!165832))))

(declare-fun lt!374154 () (_ BitVec 64))

(declare-fun lt!374157 () (_ BitVec 64))

(declare-fun lt!374155 () (_ BitVec 64))

(assert (=> d!80894 (= res!200014 (= lt!374155 (bvsub lt!374154 lt!374157)))))

(assert (=> d!80894 (or (= (bvand lt!374154 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374157 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!374154 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!374154 lt!374157) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!80894 (= lt!374157 (remainingBits!0 ((_ sign_extend 32) (size!5686 (buf!6140 thiss!1854))) ((_ sign_extend 32) (currentByte!11440 thiss!1854)) ((_ sign_extend 32) (currentBit!11435 thiss!1854))))))

(declare-fun lt!374156 () (_ BitVec 64))

(declare-fun lt!374153 () (_ BitVec 64))

(assert (=> d!80894 (= lt!374154 (bvmul lt!374156 lt!374153))))

(assert (=> d!80894 (or (= lt!374156 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!374153 (bvsdiv (bvmul lt!374156 lt!374153) lt!374156)))))

(assert (=> d!80894 (= lt!374153 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!80894 (= lt!374156 ((_ sign_extend 32) (size!5686 (buf!6140 thiss!1854))))))

(assert (=> d!80894 (= lt!374155 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11440 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11435 thiss!1854))))))

(assert (=> d!80894 (invariant!0 (currentBit!11435 thiss!1854) (currentByte!11440 thiss!1854) (size!5686 (buf!6140 thiss!1854)))))

(assert (=> d!80894 (= (bitIndex!0 (size!5686 (buf!6140 thiss!1854)) (currentByte!11440 thiss!1854) (currentBit!11435 thiss!1854)) lt!374155)))

(declare-fun b!239486 () Bool)

(declare-fun res!200013 () Bool)

(assert (=> b!239486 (=> (not res!200013) (not e!165832))))

(assert (=> b!239486 (= res!200013 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!374155))))

(declare-fun b!239487 () Bool)

(declare-fun lt!374152 () (_ BitVec 64))

(assert (=> b!239487 (= e!165832 (bvsle lt!374155 (bvmul lt!374152 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!239487 (or (= lt!374152 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!374152 #b0000000000000000000000000000000000000000000000000000000000001000) lt!374152)))))

(assert (=> b!239487 (= lt!374152 ((_ sign_extend 32) (size!5686 (buf!6140 thiss!1854))))))

(assert (= (and d!80894 res!200014) b!239486))

(assert (= (and b!239486 res!200013) b!239487))

(assert (=> d!80894 m!361697))

(assert (=> d!80894 m!361699))

(assert (=> b!239458 d!80894))

(push 1)

(assert (not d!80894))

(assert (not d!80876))

(assert (not d!80878))

(assert (not d!80880))

(check-sat)

(pop 1)

(push 1)

(check-sat)

