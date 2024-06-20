; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16764 () Bool)

(assert start!16764)

(declare-fun b!82659 () Bool)

(declare-fun e!54687 () Bool)

(declare-datatypes ((array!3743 0))(
  ( (array!3744 (arr!2346 (Array (_ BitVec 32) (_ BitVec 8))) (size!1709 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2980 0))(
  ( (BitStream!2981 (buf!2099 array!3743) (currentByte!4135 (_ BitVec 32)) (currentBit!4130 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!2980)

(declare-fun array_inv!1555 (array!3743) Bool)

(assert (=> b!82659 (= e!54687 (array_inv!1555 (buf!2099 b2!98)))))

(declare-fun b!82660 () Bool)

(declare-fun e!54691 () Bool)

(declare-fun e!54692 () Bool)

(assert (=> b!82660 (= e!54691 e!54692)))

(declare-fun res!68083 () Bool)

(assert (=> b!82660 (=> res!68083 e!54692)))

(declare-fun lt!131639 () (_ BitVec 64))

(declare-fun lt!131633 () (_ BitVec 64))

(declare-fun lt!131635 () (_ BitVec 64))

(assert (=> b!82660 (= res!68083 (or (not (= lt!131633 (bvsub lt!131635 lt!131639))) (bvsgt ((_ sign_extend 32) (size!1709 (buf!2099 b2!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4135 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4130 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvslt ((_ sign_extend 32) (size!1709 (buf!2099 b2!98))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4135 b2!98)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4130 b2!98)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!131640 () (_ BitVec 64))

(assert (=> b!82660 (= lt!131633 (bvsub lt!131635 lt!131640))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!82660 (= lt!131633 (remainingBits!0 ((_ sign_extend 32) (size!1709 (buf!2099 b2!98))) ((_ sign_extend 32) (currentByte!4135 b2!98)) ((_ sign_extend 32) (currentBit!4130 b2!98))))))

(assert (=> b!82660 (= lt!131635 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1709 (buf!2099 b2!98)))))))

(declare-datatypes ((Unit!5527 0))(
  ( (Unit!5528) )
))
(declare-fun lt!131637 () Unit!5527)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2980) Unit!5527)

(assert (=> b!82660 (= lt!131637 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun res!68082 () Bool)

(declare-fun e!54686 () Bool)

(assert (=> start!16764 (=> (not res!68082) (not e!54686))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun b1!98 () BitStream!2980)

(assert (=> start!16764 (= res!68082 (and (= (size!1709 (buf!2099 b1!98)) (size!1709 (buf!2099 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16764 e!54686))

(declare-fun e!54688 () Bool)

(declare-fun inv!12 (BitStream!2980) Bool)

(assert (=> start!16764 (and (inv!12 b1!98) e!54688)))

(assert (=> start!16764 (and (inv!12 b2!98) e!54687)))

(assert (=> start!16764 true))

(declare-fun b!82661 () Bool)

(declare-fun e!54690 () Bool)

(assert (=> b!82661 (= e!54686 e!54690)))

(declare-fun res!68084 () Bool)

(assert (=> b!82661 (=> (not res!68084) (not e!54690))))

(assert (=> b!82661 (= res!68084 (= lt!131639 lt!131640))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!82661 (= lt!131640 (bitIndex!0 (size!1709 (buf!2099 b2!98)) (currentByte!4135 b2!98) (currentBit!4130 b2!98)))))

(declare-fun lt!131636 () (_ BitVec 64))

(assert (=> b!82661 (= lt!131639 (bvadd lt!131636 b1b2Diff!1))))

(assert (=> b!82661 (= lt!131636 (bitIndex!0 (size!1709 (buf!2099 b1!98)) (currentByte!4135 b1!98) (currentBit!4130 b1!98)))))

(declare-fun b!82662 () Bool)

(declare-fun res!68086 () Bool)

(assert (=> b!82662 (=> (not res!68086) (not e!54686))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!82662 (= res!68086 (validate_offset_bits!1 ((_ sign_extend 32) (size!1709 (buf!2099 b1!98))) ((_ sign_extend 32) (currentByte!4135 b1!98)) ((_ sign_extend 32) (currentBit!4130 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!82663 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!82663 (= e!54692 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4130 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4135 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1709 (buf!2099 b2!98))))))))

(declare-fun b!82664 () Bool)

(assert (=> b!82664 (= e!54690 (not e!54691))))

(declare-fun res!68085 () Bool)

(assert (=> b!82664 (=> res!68085 e!54691)))

(declare-fun lt!131634 () (_ BitVec 64))

(assert (=> b!82664 (= res!68085 (bvsgt lt!131636 (bvsub lt!131634 b1ValidateOffsetBits!11)))))

(assert (=> b!82664 (= (remainingBits!0 ((_ sign_extend 32) (size!1709 (buf!2099 b1!98))) ((_ sign_extend 32) (currentByte!4135 b1!98)) ((_ sign_extend 32) (currentBit!4130 b1!98))) (bvsub lt!131634 lt!131636))))

(assert (=> b!82664 (= lt!131634 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1709 (buf!2099 b1!98)))))))

(declare-fun lt!131638 () Unit!5527)

(assert (=> b!82664 (= lt!131638 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!82665 () Bool)

(assert (=> b!82665 (= e!54688 (array_inv!1555 (buf!2099 b1!98)))))

(assert (= (and start!16764 res!68082) b!82662))

(assert (= (and b!82662 res!68086) b!82661))

(assert (= (and b!82661 res!68084) b!82664))

(assert (= (and b!82664 (not res!68085)) b!82660))

(assert (= (and b!82660 (not res!68083)) b!82663))

(assert (= start!16764 b!82665))

(assert (= start!16764 b!82659))

(declare-fun m!129141 () Bool)

(assert (=> b!82659 m!129141))

(declare-fun m!129143 () Bool)

(assert (=> b!82662 m!129143))

(declare-fun m!129145 () Bool)

(assert (=> start!16764 m!129145))

(declare-fun m!129147 () Bool)

(assert (=> start!16764 m!129147))

(declare-fun m!129149 () Bool)

(assert (=> b!82661 m!129149))

(declare-fun m!129151 () Bool)

(assert (=> b!82661 m!129151))

(declare-fun m!129153 () Bool)

(assert (=> b!82664 m!129153))

(declare-fun m!129155 () Bool)

(assert (=> b!82664 m!129155))

(declare-fun m!129157 () Bool)

(assert (=> b!82660 m!129157))

(declare-fun m!129159 () Bool)

(assert (=> b!82660 m!129159))

(declare-fun m!129161 () Bool)

(assert (=> b!82665 m!129161))

(declare-fun m!129163 () Bool)

(assert (=> b!82663 m!129163))

(push 1)

(assert (not b!82659))

(assert (not b!82664))

(assert (not b!82663))

(assert (not b!82662))

(assert (not b!82665))

(assert (not b!82661))

(assert (not b!82660))

(assert (not start!16764))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!26254 () Bool)

(assert (=> d!26254 (= (remainingBits!0 ((_ sign_extend 32) (size!1709 (buf!2099 b1!98))) ((_ sign_extend 32) (currentByte!4135 b1!98)) ((_ sign_extend 32) (currentBit!4130 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1709 (buf!2099 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4135 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4130 b1!98)))))))

(assert (=> b!82664 d!26254))

(declare-fun d!26256 () Bool)

(declare-fun lt!131746 () (_ BitVec 64))

(declare-fun lt!131747 () (_ BitVec 64))

(assert (=> d!26256 (= (remainingBits!0 ((_ sign_extend 32) (size!1709 (buf!2099 b1!98))) ((_ sign_extend 32) (currentByte!4135 b1!98)) ((_ sign_extend 32) (currentBit!4130 b1!98))) (bvsub lt!131746 lt!131747))))

(assert (=> d!26256 (or (= (bvand lt!131746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131747 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131746 lt!131747) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26256 (= lt!131747 (bitIndex!0 (size!1709 (buf!2099 b1!98)) (currentByte!4135 b1!98) (currentBit!4130 b1!98)))))

(declare-fun lt!131744 () (_ BitVec 64))

(declare-fun lt!131743 () (_ BitVec 64))

(assert (=> d!26256 (= lt!131746 (bvmul lt!131744 lt!131743))))

(assert (=> d!26256 (or (= lt!131744 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131743 (bvsdiv (bvmul lt!131744 lt!131743) lt!131744)))))

(assert (=> d!26256 (= lt!131743 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26256 (= lt!131744 ((_ sign_extend 32) (size!1709 (buf!2099 b1!98))))))

(declare-fun lt!131745 () Unit!5527)

(declare-fun choose!23 (BitStream!2980) Unit!5527)

(assert (=> d!26256 (= lt!131745 (choose!23 b1!98))))

(assert (=> d!26256 (= (remainingBitsBitIndexLemma!0 b1!98) lt!131745)))

(declare-fun bs!6442 () Bool)

(assert (= bs!6442 d!26256))

(assert (=> bs!6442 m!129153))

(assert (=> bs!6442 m!129151))

(declare-fun m!129221 () Bool)

(assert (=> bs!6442 m!129221))

(assert (=> b!82664 d!26256))

(declare-fun d!26274 () Bool)

(assert (=> d!26274 (= (array_inv!1555 (buf!2099 b2!98)) (bvsge (size!1709 (buf!2099 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!82659 d!26274))

(declare-fun d!26276 () Bool)

(assert (=> d!26276 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4130 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4135 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1709 (buf!2099 b2!98))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4130 b2!98))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4130 b2!98))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4135 b2!98))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4135 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1709 (buf!2099 b2!98))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4130 b2!98))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4135 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1709 (buf!2099 b2!98)))))))))))

(assert (=> b!82663 d!26276))

(declare-fun d!26278 () Bool)

(declare-fun e!54748 () Bool)

(assert (=> d!26278 e!54748))

(declare-fun res!68130 () Bool)

(assert (=> d!26278 (=> (not res!68130) (not e!54748))))

(declare-fun lt!131778 () (_ BitVec 64))

(declare-fun lt!131779 () (_ BitVec 64))

(declare-fun lt!131775 () (_ BitVec 64))

(assert (=> d!26278 (= res!68130 (= lt!131775 (bvsub lt!131778 lt!131779)))))

(assert (=> d!26278 (or (= (bvand lt!131778 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131779 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131778 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131778 lt!131779) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26278 (= lt!131779 (remainingBits!0 ((_ sign_extend 32) (size!1709 (buf!2099 b2!98))) ((_ sign_extend 32) (currentByte!4135 b2!98)) ((_ sign_extend 32) (currentBit!4130 b2!98))))))

(declare-fun lt!131777 () (_ BitVec 64))

(declare-fun lt!131776 () (_ BitVec 64))

(assert (=> d!26278 (= lt!131778 (bvmul lt!131777 lt!131776))))

(assert (=> d!26278 (or (= lt!131777 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131776 (bvsdiv (bvmul lt!131777 lt!131776) lt!131777)))))

(assert (=> d!26278 (= lt!131776 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26278 (= lt!131777 ((_ sign_extend 32) (size!1709 (buf!2099 b2!98))))))

(assert (=> d!26278 (= lt!131775 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4135 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4130 b2!98))))))

(assert (=> d!26278 (invariant!0 (currentBit!4130 b2!98) (currentByte!4135 b2!98) (size!1709 (buf!2099 b2!98)))))

(assert (=> d!26278 (= (bitIndex!0 (size!1709 (buf!2099 b2!98)) (currentByte!4135 b2!98) (currentBit!4130 b2!98)) lt!131775)))

(declare-fun b!82723 () Bool)

(declare-fun res!68129 () Bool)

(assert (=> b!82723 (=> (not res!68129) (not e!54748))))

(assert (=> b!82723 (= res!68129 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!131775))))

(declare-fun b!82724 () Bool)

(declare-fun lt!131780 () (_ BitVec 64))

(assert (=> b!82724 (= e!54748 (bvsle lt!131775 (bvmul lt!131780 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82724 (or (= lt!131780 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!131780 #b0000000000000000000000000000000000000000000000000000000000001000) lt!131780)))))

(assert (=> b!82724 (= lt!131780 ((_ sign_extend 32) (size!1709 (buf!2099 b2!98))))))

(assert (= (and d!26278 res!68130) b!82723))

(assert (= (and b!82723 res!68129) b!82724))

(assert (=> d!26278 m!129157))

(declare-fun m!129225 () Bool)

(assert (=> d!26278 m!129225))

(assert (=> b!82661 d!26278))

(declare-fun d!26284 () Bool)

(declare-fun e!54751 () Bool)

(assert (=> d!26284 e!54751))

(declare-fun res!68134 () Bool)

(assert (=> d!26284 (=> (not res!68134) (not e!54751))))

(declare-fun lt!131789 () (_ BitVec 64))

(declare-fun lt!131792 () (_ BitVec 64))

(declare-fun lt!131793 () (_ BitVec 64))

(assert (=> d!26284 (= res!68134 (= lt!131789 (bvsub lt!131792 lt!131793)))))

(assert (=> d!26284 (or (= (bvand lt!131792 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131793 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131792 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131792 lt!131793) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26284 (= lt!131793 (remainingBits!0 ((_ sign_extend 32) (size!1709 (buf!2099 b1!98))) ((_ sign_extend 32) (currentByte!4135 b1!98)) ((_ sign_extend 32) (currentBit!4130 b1!98))))))

(declare-fun lt!131791 () (_ BitVec 64))

(declare-fun lt!131790 () (_ BitVec 64))

(assert (=> d!26284 (= lt!131792 (bvmul lt!131791 lt!131790))))

(assert (=> d!26284 (or (= lt!131791 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131790 (bvsdiv (bvmul lt!131791 lt!131790) lt!131791)))))

(assert (=> d!26284 (= lt!131790 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26284 (= lt!131791 ((_ sign_extend 32) (size!1709 (buf!2099 b1!98))))))

(assert (=> d!26284 (= lt!131789 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4135 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4130 b1!98))))))

(assert (=> d!26284 (invariant!0 (currentBit!4130 b1!98) (currentByte!4135 b1!98) (size!1709 (buf!2099 b1!98)))))

(assert (=> d!26284 (= (bitIndex!0 (size!1709 (buf!2099 b1!98)) (currentByte!4135 b1!98) (currentBit!4130 b1!98)) lt!131789)))

(declare-fun b!82725 () Bool)

(declare-fun res!68133 () Bool)

(assert (=> b!82725 (=> (not res!68133) (not e!54751))))

(assert (=> b!82725 (= res!68133 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!131789))))

(declare-fun b!82726 () Bool)

(declare-fun lt!131794 () (_ BitVec 64))

(assert (=> b!82726 (= e!54751 (bvsle lt!131789 (bvmul lt!131794 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82726 (or (= lt!131794 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!131794 #b0000000000000000000000000000000000000000000000000000000000001000) lt!131794)))))

(assert (=> b!82726 (= lt!131794 ((_ sign_extend 32) (size!1709 (buf!2099 b1!98))))))

(assert (= (and d!26284 res!68134) b!82725))

(assert (= (and b!82725 res!68133) b!82726))

(assert (=> d!26284 m!129153))

(declare-fun m!129227 () Bool)

(assert (=> d!26284 m!129227))

(assert (=> b!82661 d!26284))

(declare-fun d!26286 () Bool)

(assert (=> d!26286 (= (inv!12 b1!98) (invariant!0 (currentBit!4130 b1!98) (currentByte!4135 b1!98) (size!1709 (buf!2099 b1!98))))))

(declare-fun bs!6444 () Bool)

(assert (= bs!6444 d!26286))

(assert (=> bs!6444 m!129227))

(assert (=> start!16764 d!26286))

(declare-fun d!26288 () Bool)

(assert (=> d!26288 (= (inv!12 b2!98) (invariant!0 (currentBit!4130 b2!98) (currentByte!4135 b2!98) (size!1709 (buf!2099 b2!98))))))

(declare-fun bs!6445 () Bool)

(assert (= bs!6445 d!26288))

(assert (=> bs!6445 m!129225))

(assert (=> start!16764 d!26288))

(declare-fun d!26290 () Bool)

(assert (=> d!26290 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1709 (buf!2099 b1!98))) ((_ sign_extend 32) (currentByte!4135 b1!98)) ((_ sign_extend 32) (currentBit!4130 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1709 (buf!2099 b1!98))) ((_ sign_extend 32) (currentByte!4135 b1!98)) ((_ sign_extend 32) (currentBit!4130 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6446 () Bool)

(assert (= bs!6446 d!26290))

(assert (=> bs!6446 m!129153))

(assert (=> b!82662 d!26290))

(declare-fun d!26294 () Bool)

(assert (=> d!26294 (= (array_inv!1555 (buf!2099 b1!98)) (bvsge (size!1709 (buf!2099 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!82665 d!26294))

(declare-fun d!26296 () Bool)

(assert (=> d!26296 (= (remainingBits!0 ((_ sign_extend 32) (size!1709 (buf!2099 b2!98))) ((_ sign_extend 32) (currentByte!4135 b2!98)) ((_ sign_extend 32) (currentBit!4130 b2!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1709 (buf!2099 b2!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4135 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4130 b2!98)))))))

(assert (=> b!82660 d!26296))

(declare-fun d!26298 () Bool)

(declare-fun lt!131814 () (_ BitVec 64))

(declare-fun lt!131815 () (_ BitVec 64))

(assert (=> d!26298 (= (remainingBits!0 ((_ sign_extend 32) (size!1709 (buf!2099 b2!98))) ((_ sign_extend 32) (currentByte!4135 b2!98)) ((_ sign_extend 32) (currentBit!4130 b2!98))) (bvsub lt!131814 lt!131815))))

(assert (=> d!26298 (or (= (bvand lt!131814 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131815 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131814 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131814 lt!131815) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26298 (= lt!131815 (bitIndex!0 (size!1709 (buf!2099 b2!98)) (currentByte!4135 b2!98) (currentBit!4130 b2!98)))))

(declare-fun lt!131812 () (_ BitVec 64))

(declare-fun lt!131811 () (_ BitVec 64))

(assert (=> d!26298 (= lt!131814 (bvmul lt!131812 lt!131811))))

(assert (=> d!26298 (or (= lt!131812 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131811 (bvsdiv (bvmul lt!131812 lt!131811) lt!131812)))))

(assert (=> d!26298 (= lt!131811 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26298 (= lt!131812 ((_ sign_extend 32) (size!1709 (buf!2099 b2!98))))))

(declare-fun lt!131813 () Unit!5527)

(assert (=> d!26298 (= lt!131813 (choose!23 b2!98))))

(assert (=> d!26298 (= (remainingBitsBitIndexLemma!0 b2!98) lt!131813)))

(declare-fun bs!6447 () Bool)

(assert (= bs!6447 d!26298))

(assert (=> bs!6447 m!129157))

(assert (=> bs!6447 m!129149))

(declare-fun m!129233 () Bool)

(assert (=> bs!6447 m!129233))

(assert (=> b!82660 d!26298))

(push 1)

(assert (not d!26290))

(assert (not d!26284))

(assert (not d!26286))

(assert (not d!26288))

(assert (not d!26278))

(assert (not d!26256))

(assert (not d!26298))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

