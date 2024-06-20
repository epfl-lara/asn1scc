; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16722 () Bool)

(assert start!16722)

(declare-fun b!82611 () Bool)

(declare-fun e!54654 () Bool)

(declare-fun e!54657 () Bool)

(assert (=> b!82611 (= e!54654 (not e!54657))))

(declare-fun res!68044 () Bool)

(assert (=> b!82611 (=> res!68044 e!54657)))

(declare-fun lt!131477 () (_ BitVec 64))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun lt!131484 () (_ BitVec 64))

(assert (=> b!82611 (= res!68044 (bvsgt lt!131484 (bvsub lt!131477 b1ValidateOffsetBits!11)))))

(declare-datatypes ((array!3738 0))(
  ( (array!3739 (arr!2345 (Array (_ BitVec 32) (_ BitVec 8))) (size!1708 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2978 0))(
  ( (BitStream!2979 (buf!2098 array!3738) (currentByte!4124 (_ BitVec 32)) (currentBit!4119 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!2978)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!82611 (= (remainingBits!0 ((_ sign_extend 32) (size!1708 (buf!2098 b1!98))) ((_ sign_extend 32) (currentByte!4124 b1!98)) ((_ sign_extend 32) (currentBit!4119 b1!98))) (bvsub lt!131477 lt!131484))))

(assert (=> b!82611 (= lt!131477 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1708 (buf!2098 b1!98)))))))

(declare-datatypes ((Unit!5525 0))(
  ( (Unit!5526) )
))
(declare-fun lt!131482 () Unit!5525)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2978) Unit!5525)

(assert (=> b!82611 (= lt!131482 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!82612 () Bool)

(declare-fun res!68046 () Bool)

(declare-fun e!54652 () Bool)

(assert (=> b!82612 (=> (not res!68046) (not e!54652))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!82612 (= res!68046 (validate_offset_bits!1 ((_ sign_extend 32) (size!1708 (buf!2098 b1!98))) ((_ sign_extend 32) (currentByte!4124 b1!98)) ((_ sign_extend 32) (currentBit!4119 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!82613 () Bool)

(declare-fun e!54653 () Bool)

(declare-fun b2!98 () BitStream!2978)

(declare-fun array_inv!1554 (array!3738) Bool)

(assert (=> b!82613 (= e!54653 (array_inv!1554 (buf!2098 b2!98)))))

(declare-fun b!82614 () Bool)

(assert (=> b!82614 (= e!54652 e!54654)))

(declare-fun res!68045 () Bool)

(assert (=> b!82614 (=> (not res!68045) (not e!54654))))

(declare-fun lt!131478 () (_ BitVec 64))

(declare-fun lt!131479 () (_ BitVec 64))

(assert (=> b!82614 (= res!68045 (= lt!131478 lt!131479))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!82614 (= lt!131479 (bitIndex!0 (size!1708 (buf!2098 b2!98)) (currentByte!4124 b2!98) (currentBit!4119 b2!98)))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(assert (=> b!82614 (= lt!131478 (bvadd lt!131484 b1b2Diff!1))))

(assert (=> b!82614 (= lt!131484 (bitIndex!0 (size!1708 (buf!2098 b1!98)) (currentByte!4124 b1!98) (currentBit!4119 b1!98)))))

(declare-fun res!68047 () Bool)

(assert (=> start!16722 (=> (not res!68047) (not e!54652))))

(assert (=> start!16722 (= res!68047 (and (= (size!1708 (buf!2098 b1!98)) (size!1708 (buf!2098 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16722 e!54652))

(declare-fun e!54655 () Bool)

(declare-fun inv!12 (BitStream!2978) Bool)

(assert (=> start!16722 (and (inv!12 b1!98) e!54655)))

(assert (=> start!16722 (and (inv!12 b2!98) e!54653)))

(assert (=> start!16722 true))

(declare-fun lt!131480 () (_ BitVec 64))

(declare-fun b!82615 () Bool)

(declare-fun lt!131481 () (_ BitVec 64))

(assert (=> b!82615 (= e!54657 (or (not (= lt!131480 (bvsub lt!131481 lt!131478))) (bvsgt ((_ sign_extend 32) (size!1708 (buf!2098 b2!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4124 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4119 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (and (bvsge ((_ sign_extend 32) (size!1708 (buf!2098 b2!98))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4124 b2!98)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4119 b2!98)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!82615 (= lt!131480 (bvsub lt!131481 lt!131479))))

(assert (=> b!82615 (= lt!131480 (remainingBits!0 ((_ sign_extend 32) (size!1708 (buf!2098 b2!98))) ((_ sign_extend 32) (currentByte!4124 b2!98)) ((_ sign_extend 32) (currentBit!4119 b2!98))))))

(assert (=> b!82615 (= lt!131481 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1708 (buf!2098 b2!98)))))))

(declare-fun lt!131483 () Unit!5525)

(assert (=> b!82615 (= lt!131483 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun b!82616 () Bool)

(assert (=> b!82616 (= e!54655 (array_inv!1554 (buf!2098 b1!98)))))

(assert (= (and start!16722 res!68047) b!82612))

(assert (= (and b!82612 res!68046) b!82614))

(assert (= (and b!82614 res!68045) b!82611))

(assert (= (and b!82611 (not res!68044)) b!82615))

(assert (= start!16722 b!82616))

(assert (= start!16722 b!82613))

(declare-fun m!129095 () Bool)

(assert (=> b!82616 m!129095))

(declare-fun m!129097 () Bool)

(assert (=> start!16722 m!129097))

(declare-fun m!129099 () Bool)

(assert (=> start!16722 m!129099))

(declare-fun m!129101 () Bool)

(assert (=> b!82614 m!129101))

(declare-fun m!129103 () Bool)

(assert (=> b!82614 m!129103))

(declare-fun m!129105 () Bool)

(assert (=> b!82611 m!129105))

(declare-fun m!129107 () Bool)

(assert (=> b!82611 m!129107))

(declare-fun m!129109 () Bool)

(assert (=> b!82612 m!129109))

(declare-fun m!129111 () Bool)

(assert (=> b!82615 m!129111))

(declare-fun m!129113 () Bool)

(assert (=> b!82615 m!129113))

(declare-fun m!129115 () Bool)

(assert (=> b!82613 m!129115))

(push 1)

(assert (not b!82615))

(assert (not b!82616))

(assert (not b!82612))

(assert (not start!16722))

(assert (not b!82611))

(assert (not b!82614))

(assert (not b!82613))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!26194 () Bool)

(declare-fun e!54668 () Bool)

(assert (=> d!26194 e!54668))

(declare-fun res!68069 () Bool)

(assert (=> d!26194 (=> (not res!68069) (not e!54668))))

(declare-fun lt!131585 () (_ BitVec 64))

(declare-fun lt!131588 () (_ BitVec 64))

(declare-fun lt!131590 () (_ BitVec 64))

(assert (=> d!26194 (= res!68069 (= lt!131585 (bvsub lt!131588 lt!131590)))))

(assert (=> d!26194 (or (= (bvand lt!131588 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131590 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131588 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131588 lt!131590) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26194 (= lt!131590 (remainingBits!0 ((_ sign_extend 32) (size!1708 (buf!2098 b2!98))) ((_ sign_extend 32) (currentByte!4124 b2!98)) ((_ sign_extend 32) (currentBit!4119 b2!98))))))

(declare-fun lt!131586 () (_ BitVec 64))

(declare-fun lt!131589 () (_ BitVec 64))

(assert (=> d!26194 (= lt!131588 (bvmul lt!131586 lt!131589))))

(assert (=> d!26194 (or (= lt!131586 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131589 (bvsdiv (bvmul lt!131586 lt!131589) lt!131586)))))

(assert (=> d!26194 (= lt!131589 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26194 (= lt!131586 ((_ sign_extend 32) (size!1708 (buf!2098 b2!98))))))

(assert (=> d!26194 (= lt!131585 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4124 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4119 b2!98))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!26194 (invariant!0 (currentBit!4119 b2!98) (currentByte!4124 b2!98) (size!1708 (buf!2098 b2!98)))))

(assert (=> d!26194 (= (bitIndex!0 (size!1708 (buf!2098 b2!98)) (currentByte!4124 b2!98) (currentBit!4119 b2!98)) lt!131585)))

(declare-fun b!82639 () Bool)

(declare-fun res!68068 () Bool)

(assert (=> b!82639 (=> (not res!68068) (not e!54668))))

(assert (=> b!82639 (= res!68068 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!131585))))

(declare-fun b!82640 () Bool)

(declare-fun lt!131587 () (_ BitVec 64))

(assert (=> b!82640 (= e!54668 (bvsle lt!131585 (bvmul lt!131587 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82640 (or (= lt!131587 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!131587 #b0000000000000000000000000000000000000000000000000000000000001000) lt!131587)))))

(assert (=> b!82640 (= lt!131587 ((_ sign_extend 32) (size!1708 (buf!2098 b2!98))))))

(assert (= (and d!26194 res!68069) b!82639))

(assert (= (and b!82639 res!68068) b!82640))

(assert (=> d!26194 m!129111))

(declare-fun m!129133 () Bool)

(assert (=> d!26194 m!129133))

(assert (=> b!82614 d!26194))

(declare-fun d!26210 () Bool)

(declare-fun e!54669 () Bool)

(assert (=> d!26210 e!54669))

(declare-fun res!68071 () Bool)

(assert (=> d!26210 (=> (not res!68071) (not e!54669))))

(declare-fun lt!131591 () (_ BitVec 64))

(declare-fun lt!131596 () (_ BitVec 64))

(declare-fun lt!131594 () (_ BitVec 64))

(assert (=> d!26210 (= res!68071 (= lt!131591 (bvsub lt!131594 lt!131596)))))

(assert (=> d!26210 (or (= (bvand lt!131594 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131596 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131594 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131594 lt!131596) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26210 (= lt!131596 (remainingBits!0 ((_ sign_extend 32) (size!1708 (buf!2098 b1!98))) ((_ sign_extend 32) (currentByte!4124 b1!98)) ((_ sign_extend 32) (currentBit!4119 b1!98))))))

(declare-fun lt!131592 () (_ BitVec 64))

(declare-fun lt!131595 () (_ BitVec 64))

(assert (=> d!26210 (= lt!131594 (bvmul lt!131592 lt!131595))))

(assert (=> d!26210 (or (= lt!131592 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131595 (bvsdiv (bvmul lt!131592 lt!131595) lt!131592)))))

(assert (=> d!26210 (= lt!131595 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26210 (= lt!131592 ((_ sign_extend 32) (size!1708 (buf!2098 b1!98))))))

(assert (=> d!26210 (= lt!131591 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4124 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4119 b1!98))))))

(assert (=> d!26210 (invariant!0 (currentBit!4119 b1!98) (currentByte!4124 b1!98) (size!1708 (buf!2098 b1!98)))))

(assert (=> d!26210 (= (bitIndex!0 (size!1708 (buf!2098 b1!98)) (currentByte!4124 b1!98) (currentBit!4119 b1!98)) lt!131591)))

(declare-fun b!82641 () Bool)

(declare-fun res!68070 () Bool)

(assert (=> b!82641 (=> (not res!68070) (not e!54669))))

(assert (=> b!82641 (= res!68070 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!131591))))

(declare-fun b!82642 () Bool)

(declare-fun lt!131593 () (_ BitVec 64))

(assert (=> b!82642 (= e!54669 (bvsle lt!131591 (bvmul lt!131593 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82642 (or (= lt!131593 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!131593 #b0000000000000000000000000000000000000000000000000000000000001000) lt!131593)))))

(assert (=> b!82642 (= lt!131593 ((_ sign_extend 32) (size!1708 (buf!2098 b1!98))))))

(assert (= (and d!26210 res!68071) b!82641))

(assert (= (and b!82641 res!68070) b!82642))

(assert (=> d!26210 m!129105))

(declare-fun m!129135 () Bool)

(assert (=> d!26210 m!129135))

(assert (=> b!82614 d!26210))

(declare-fun d!26212 () Bool)

(assert (=> d!26212 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1708 (buf!2098 b1!98))) ((_ sign_extend 32) (currentByte!4124 b1!98)) ((_ sign_extend 32) (currentBit!4119 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1708 (buf!2098 b1!98))) ((_ sign_extend 32) (currentByte!4124 b1!98)) ((_ sign_extend 32) (currentBit!4119 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6427 () Bool)

(assert (= bs!6427 d!26212))

(assert (=> bs!6427 m!129105))

(assert (=> b!82612 d!26212))

(declare-fun d!26214 () Bool)

(assert (=> d!26214 (= (array_inv!1554 (buf!2098 b2!98)) (bvsge (size!1708 (buf!2098 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!82613 d!26214))

(declare-fun d!26216 () Bool)

(assert (=> d!26216 (= (remainingBits!0 ((_ sign_extend 32) (size!1708 (buf!2098 b1!98))) ((_ sign_extend 32) (currentByte!4124 b1!98)) ((_ sign_extend 32) (currentBit!4119 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1708 (buf!2098 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4124 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4119 b1!98)))))))

(assert (=> b!82611 d!26216))

(declare-fun d!26218 () Bool)

(declare-fun lt!131607 () (_ BitVec 64))

(declare-fun lt!131610 () (_ BitVec 64))

(assert (=> d!26218 (= (remainingBits!0 ((_ sign_extend 32) (size!1708 (buf!2098 b1!98))) ((_ sign_extend 32) (currentByte!4124 b1!98)) ((_ sign_extend 32) (currentBit!4119 b1!98))) (bvsub lt!131607 lt!131610))))

(assert (=> d!26218 (or (= (bvand lt!131607 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131610 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131607 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131607 lt!131610) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26218 (= lt!131610 (bitIndex!0 (size!1708 (buf!2098 b1!98)) (currentByte!4124 b1!98) (currentBit!4119 b1!98)))))

(declare-fun lt!131608 () (_ BitVec 64))

(declare-fun lt!131611 () (_ BitVec 64))

(assert (=> d!26218 (= lt!131607 (bvmul lt!131608 lt!131611))))

(assert (=> d!26218 (or (= lt!131608 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131611 (bvsdiv (bvmul lt!131608 lt!131611) lt!131608)))))

(assert (=> d!26218 (= lt!131611 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26218 (= lt!131608 ((_ sign_extend 32) (size!1708 (buf!2098 b1!98))))))

(declare-fun lt!131609 () Unit!5525)

(declare-fun choose!23 (BitStream!2978) Unit!5525)

(assert (=> d!26218 (= lt!131609 (choose!23 b1!98))))

(assert (=> d!26218 (= (remainingBitsBitIndexLemma!0 b1!98) lt!131609)))

(declare-fun bs!6428 () Bool)

(assert (= bs!6428 d!26218))

(assert (=> bs!6428 m!129105))

(assert (=> bs!6428 m!129103))

(declare-fun m!129137 () Bool)

(assert (=> bs!6428 m!129137))

(assert (=> b!82611 d!26218))

(declare-fun d!26220 () Bool)

(assert (=> d!26220 (= (array_inv!1554 (buf!2098 b1!98)) (bvsge (size!1708 (buf!2098 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!82616 d!26220))

(declare-fun d!26222 () Bool)

(assert (=> d!26222 (= (remainingBits!0 ((_ sign_extend 32) (size!1708 (buf!2098 b2!98))) ((_ sign_extend 32) (currentByte!4124 b2!98)) ((_ sign_extend 32) (currentBit!4119 b2!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1708 (buf!2098 b2!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4124 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4119 b2!98)))))))

(assert (=> b!82615 d!26222))

(declare-fun d!26224 () Bool)

(declare-fun lt!131612 () (_ BitVec 64))

(declare-fun lt!131615 () (_ BitVec 64))

(assert (=> d!26224 (= (remainingBits!0 ((_ sign_extend 32) (size!1708 (buf!2098 b2!98))) ((_ sign_extend 32) (currentByte!4124 b2!98)) ((_ sign_extend 32) (currentBit!4119 b2!98))) (bvsub lt!131612 lt!131615))))

(assert (=> d!26224 (or (= (bvand lt!131612 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131615 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131612 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131612 lt!131615) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26224 (= lt!131615 (bitIndex!0 (size!1708 (buf!2098 b2!98)) (currentByte!4124 b2!98) (currentBit!4119 b2!98)))))

(declare-fun lt!131613 () (_ BitVec 64))

(declare-fun lt!131616 () (_ BitVec 64))

(assert (=> d!26224 (= lt!131612 (bvmul lt!131613 lt!131616))))

(assert (=> d!26224 (or (= lt!131613 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131616 (bvsdiv (bvmul lt!131613 lt!131616) lt!131613)))))

(assert (=> d!26224 (= lt!131616 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26224 (= lt!131613 ((_ sign_extend 32) (size!1708 (buf!2098 b2!98))))))

(declare-fun lt!131614 () Unit!5525)

(assert (=> d!26224 (= lt!131614 (choose!23 b2!98))))

(assert (=> d!26224 (= (remainingBitsBitIndexLemma!0 b2!98) lt!131614)))

(declare-fun bs!6429 () Bool)

(assert (= bs!6429 d!26224))

(assert (=> bs!6429 m!129111))

(assert (=> bs!6429 m!129101))

(declare-fun m!129139 () Bool)

(assert (=> bs!6429 m!129139))

(assert (=> b!82615 d!26224))

(declare-fun d!26226 () Bool)

(assert (=> d!26226 (= (inv!12 b1!98) (invariant!0 (currentBit!4119 b1!98) (currentByte!4124 b1!98) (size!1708 (buf!2098 b1!98))))))

(declare-fun bs!6430 () Bool)

(assert (= bs!6430 d!26226))

(assert (=> bs!6430 m!129135))

(assert (=> start!16722 d!26226))

(declare-fun d!26228 () Bool)

(assert (=> d!26228 (= (inv!12 b2!98) (invariant!0 (currentBit!4119 b2!98) (currentByte!4124 b2!98) (size!1708 (buf!2098 b2!98))))))

(declare-fun bs!6431 () Bool)

(assert (= bs!6431 d!26228))

(assert (=> bs!6431 m!129133))

(assert (=> start!16722 d!26228))

(push 1)

(assert (not d!26228))

(assert (not d!26218))

(assert (not d!26226))

(assert (not d!26212))

(assert (not d!26194))

(assert (not d!26224))

(assert (not d!26210))

(check-sat)

(pop 1)

(push 1)

(check-sat)

