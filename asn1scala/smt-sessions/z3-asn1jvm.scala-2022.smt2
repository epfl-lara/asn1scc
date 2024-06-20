; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51744 () Bool)

(assert start!51744)

(declare-fun res!199995 () Bool)

(declare-fun e!165813 () Bool)

(assert (=> start!51744 (=> (not res!199995) (not e!165813))))

(declare-datatypes ((array!12974 0))(
  ( (array!12975 (arr!6674 (Array (_ BitVec 32) (_ BitVec 8))) (size!5687 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10296 0))(
  ( (BitStream!10297 (buf!6141 array!12974) (currentByte!11441 (_ BitVec 32)) (currentBit!11436 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10296)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51744 (= res!199995 (validate_offset_bits!1 ((_ sign_extend 32) (size!5687 (buf!6141 thiss!1854))) ((_ sign_extend 32) (currentByte!11441 thiss!1854)) ((_ sign_extend 32) (currentBit!11436 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51744 e!165813))

(declare-fun e!165814 () Bool)

(declare-fun inv!12 (BitStream!10296) Bool)

(assert (=> start!51744 (and (inv!12 thiss!1854) e!165814)))

(declare-fun b!239464 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!239464 (= e!165813 (not (= (bitIndex!0 (size!5687 (buf!6141 thiss!1854)) (bvadd #b00000000000000000000000000000001 (currentByte!11441 thiss!1854)) (currentBit!11436 thiss!1854)) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!5687 (buf!6141 thiss!1854)) (currentByte!11441 thiss!1854) (currentBit!11436 thiss!1854))))))))

(declare-fun b!239465 () Bool)

(declare-fun array_inv!5428 (array!12974) Bool)

(assert (=> b!239465 (= e!165814 (array_inv!5428 (buf!6141 thiss!1854)))))

(assert (= (and start!51744 res!199995) b!239464))

(assert (= start!51744 b!239465))

(declare-fun m!361673 () Bool)

(assert (=> start!51744 m!361673))

(declare-fun m!361675 () Bool)

(assert (=> start!51744 m!361675))

(declare-fun m!361677 () Bool)

(assert (=> b!239464 m!361677))

(declare-fun m!361679 () Bool)

(assert (=> b!239464 m!361679))

(declare-fun m!361681 () Bool)

(assert (=> b!239465 m!361681))

(check-sat (not start!51744) (not b!239464) (not b!239465))
(check-sat)
(get-model)

(declare-fun d!80868 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80868 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5687 (buf!6141 thiss!1854))) ((_ sign_extend 32) (currentByte!11441 thiss!1854)) ((_ sign_extend 32) (currentBit!11436 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5687 (buf!6141 thiss!1854))) ((_ sign_extend 32) (currentByte!11441 thiss!1854)) ((_ sign_extend 32) (currentBit!11436 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!20350 () Bool)

(assert (= bs!20350 d!80868))

(declare-fun m!361693 () Bool)

(assert (=> bs!20350 m!361693))

(assert (=> start!51744 d!80868))

(declare-fun d!80870 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80870 (= (inv!12 thiss!1854) (invariant!0 (currentBit!11436 thiss!1854) (currentByte!11441 thiss!1854) (size!5687 (buf!6141 thiss!1854))))))

(declare-fun bs!20351 () Bool)

(assert (= bs!20351 d!80870))

(declare-fun m!361695 () Bool)

(assert (=> bs!20351 m!361695))

(assert (=> start!51744 d!80870))

(declare-fun d!80872 () Bool)

(declare-fun e!165827 () Bool)

(assert (=> d!80872 e!165827))

(declare-fun res!200003 () Bool)

(assert (=> d!80872 (=> (not res!200003) (not e!165827))))

(declare-fun lt!374123 () (_ BitVec 64))

(declare-fun lt!374125 () (_ BitVec 64))

(declare-fun lt!374126 () (_ BitVec 64))

(assert (=> d!80872 (= res!200003 (= lt!374123 (bvsub lt!374125 lt!374126)))))

(assert (=> d!80872 (or (= (bvand lt!374125 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374126 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!374125 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!374125 lt!374126) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!80872 (= lt!374126 (remainingBits!0 ((_ sign_extend 32) (size!5687 (buf!6141 thiss!1854))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!11441 thiss!1854))) ((_ sign_extend 32) (currentBit!11436 thiss!1854))))))

(declare-fun lt!374124 () (_ BitVec 64))

(declare-fun lt!374127 () (_ BitVec 64))

(assert (=> d!80872 (= lt!374125 (bvmul lt!374124 lt!374127))))

(assert (=> d!80872 (or (= lt!374124 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!374127 (bvsdiv (bvmul lt!374124 lt!374127) lt!374124)))))

(assert (=> d!80872 (= lt!374127 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!80872 (= lt!374124 ((_ sign_extend 32) (size!5687 (buf!6141 thiss!1854))))))

(assert (=> d!80872 (= lt!374123 (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!11441 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11436 thiss!1854))))))

(assert (=> d!80872 (invariant!0 (currentBit!11436 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11441 thiss!1854)) (size!5687 (buf!6141 thiss!1854)))))

(assert (=> d!80872 (= (bitIndex!0 (size!5687 (buf!6141 thiss!1854)) (bvadd #b00000000000000000000000000000001 (currentByte!11441 thiss!1854)) (currentBit!11436 thiss!1854)) lt!374123)))

(declare-fun b!239476 () Bool)

(declare-fun res!200004 () Bool)

(assert (=> b!239476 (=> (not res!200004) (not e!165827))))

(assert (=> b!239476 (= res!200004 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!374123))))

(declare-fun b!239477 () Bool)

(declare-fun lt!374122 () (_ BitVec 64))

(assert (=> b!239477 (= e!165827 (bvsle lt!374123 (bvmul lt!374122 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!239477 (or (= lt!374122 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!374122 #b0000000000000000000000000000000000000000000000000000000000001000) lt!374122)))))

(assert (=> b!239477 (= lt!374122 ((_ sign_extend 32) (size!5687 (buf!6141 thiss!1854))))))

(assert (= (and d!80872 res!200003) b!239476))

(assert (= (and b!239476 res!200004) b!239477))

(declare-fun m!361705 () Bool)

(assert (=> d!80872 m!361705))

(declare-fun m!361707 () Bool)

(assert (=> d!80872 m!361707))

(assert (=> b!239464 d!80872))

(declare-fun d!80890 () Bool)

(declare-fun e!165828 () Bool)

(assert (=> d!80890 e!165828))

(declare-fun res!200005 () Bool)

(assert (=> d!80890 (=> (not res!200005) (not e!165828))))

(declare-fun lt!374129 () (_ BitVec 64))

(declare-fun lt!374132 () (_ BitVec 64))

(declare-fun lt!374131 () (_ BitVec 64))

(assert (=> d!80890 (= res!200005 (= lt!374129 (bvsub lt!374131 lt!374132)))))

(assert (=> d!80890 (or (= (bvand lt!374131 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374132 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!374131 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!374131 lt!374132) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!80890 (= lt!374132 (remainingBits!0 ((_ sign_extend 32) (size!5687 (buf!6141 thiss!1854))) ((_ sign_extend 32) (currentByte!11441 thiss!1854)) ((_ sign_extend 32) (currentBit!11436 thiss!1854))))))

(declare-fun lt!374130 () (_ BitVec 64))

(declare-fun lt!374133 () (_ BitVec 64))

(assert (=> d!80890 (= lt!374131 (bvmul lt!374130 lt!374133))))

(assert (=> d!80890 (or (= lt!374130 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!374133 (bvsdiv (bvmul lt!374130 lt!374133) lt!374130)))))

(assert (=> d!80890 (= lt!374133 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!80890 (= lt!374130 ((_ sign_extend 32) (size!5687 (buf!6141 thiss!1854))))))

(assert (=> d!80890 (= lt!374129 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11441 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11436 thiss!1854))))))

(assert (=> d!80890 (invariant!0 (currentBit!11436 thiss!1854) (currentByte!11441 thiss!1854) (size!5687 (buf!6141 thiss!1854)))))

(assert (=> d!80890 (= (bitIndex!0 (size!5687 (buf!6141 thiss!1854)) (currentByte!11441 thiss!1854) (currentBit!11436 thiss!1854)) lt!374129)))

(declare-fun b!239478 () Bool)

(declare-fun res!200006 () Bool)

(assert (=> b!239478 (=> (not res!200006) (not e!165828))))

(assert (=> b!239478 (= res!200006 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!374129))))

(declare-fun b!239479 () Bool)

(declare-fun lt!374128 () (_ BitVec 64))

(assert (=> b!239479 (= e!165828 (bvsle lt!374129 (bvmul lt!374128 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!239479 (or (= lt!374128 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!374128 #b0000000000000000000000000000000000000000000000000000000000001000) lt!374128)))))

(assert (=> b!239479 (= lt!374128 ((_ sign_extend 32) (size!5687 (buf!6141 thiss!1854))))))

(assert (= (and d!80890 res!200005) b!239478))

(assert (= (and b!239478 res!200006) b!239479))

(assert (=> d!80890 m!361693))

(assert (=> d!80890 m!361695))

(assert (=> b!239464 d!80890))

(declare-fun d!80892 () Bool)

(assert (=> d!80892 (= (array_inv!5428 (buf!6141 thiss!1854)) (bvsge (size!5687 (buf!6141 thiss!1854)) #b00000000000000000000000000000000))))

(assert (=> b!239465 d!80892))

(check-sat (not d!80868) (not d!80870) (not d!80890) (not d!80872))
(check-sat)
