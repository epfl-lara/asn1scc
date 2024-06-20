; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17100 () Bool)

(assert start!17100)

(declare-fun res!68674 () Bool)

(declare-fun e!55556 () Bool)

(assert (=> start!17100 (=> (not res!68674) (not e!55556))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-datatypes ((array!3844 0))(
  ( (array!3845 (arr!2386 (Array (_ BitVec 32) (_ BitVec 8))) (size!1749 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3060 0))(
  ( (BitStream!3061 (buf!2139 array!3844) (currentByte!4242 (_ BitVec 32)) (currentBit!4237 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!3060)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun b1!98 () BitStream!3060)

(assert (=> start!17100 (= res!68674 (and (= (size!1749 (buf!2139 b1!98)) (size!1749 (buf!2139 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!17100 e!55556))

(declare-fun e!55558 () Bool)

(declare-fun inv!12 (BitStream!3060) Bool)

(assert (=> start!17100 (and (inv!12 b1!98) e!55558)))

(declare-fun e!55560 () Bool)

(assert (=> start!17100 (and (inv!12 b2!98) e!55560)))

(assert (=> start!17100 true))

(declare-fun e!55557 () Bool)

(declare-fun b!83508 () Bool)

(declare-fun lt!133095 () (_ BitVec 64))

(declare-fun lt!133093 () (_ BitVec 64))

(assert (=> b!83508 (= e!55557 (not (or (= lt!133093 (bvand b1ValidateOffsetBits!11 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!133093 (bvand (bvsub lt!133095 b1ValidateOffsetBits!11) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!83508 (= lt!133093 (bvand lt!133095 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!133092 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83508 (= (remainingBits!0 ((_ sign_extend 32) (size!1749 (buf!2139 b1!98))) ((_ sign_extend 32) (currentByte!4242 b1!98)) ((_ sign_extend 32) (currentBit!4237 b1!98))) (bvsub lt!133095 lt!133092))))

(assert (=> b!83508 (= lt!133095 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1749 (buf!2139 b1!98)))))))

(declare-datatypes ((Unit!5601 0))(
  ( (Unit!5602) )
))
(declare-fun lt!133094 () Unit!5601)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3060) Unit!5601)

(assert (=> b!83508 (= lt!133094 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!83509 () Bool)

(assert (=> b!83509 (= e!55556 e!55557)))

(declare-fun res!68672 () Bool)

(assert (=> b!83509 (=> (not res!68672) (not e!55557))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83509 (= res!68672 (= (bvadd lt!133092 b1b2Diff!1) (bitIndex!0 (size!1749 (buf!2139 b2!98)) (currentByte!4242 b2!98) (currentBit!4237 b2!98))))))

(assert (=> b!83509 (= lt!133092 (bitIndex!0 (size!1749 (buf!2139 b1!98)) (currentByte!4242 b1!98) (currentBit!4237 b1!98)))))

(declare-fun b!83510 () Bool)

(declare-fun array_inv!1595 (array!3844) Bool)

(assert (=> b!83510 (= e!55560 (array_inv!1595 (buf!2139 b2!98)))))

(declare-fun b!83511 () Bool)

(declare-fun res!68673 () Bool)

(assert (=> b!83511 (=> (not res!68673) (not e!55556))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83511 (= res!68673 (validate_offset_bits!1 ((_ sign_extend 32) (size!1749 (buf!2139 b1!98))) ((_ sign_extend 32) (currentByte!4242 b1!98)) ((_ sign_extend 32) (currentBit!4237 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!83512 () Bool)

(assert (=> b!83512 (= e!55558 (array_inv!1595 (buf!2139 b1!98)))))

(assert (= (and start!17100 res!68674) b!83511))

(assert (= (and b!83511 res!68673) b!83509))

(assert (= (and b!83509 res!68672) b!83508))

(assert (= start!17100 b!83512))

(assert (= start!17100 b!83510))

(declare-fun m!130101 () Bool)

(assert (=> b!83512 m!130101))

(declare-fun m!130103 () Bool)

(assert (=> b!83511 m!130103))

(declare-fun m!130105 () Bool)

(assert (=> start!17100 m!130105))

(declare-fun m!130107 () Bool)

(assert (=> start!17100 m!130107))

(declare-fun m!130109 () Bool)

(assert (=> b!83509 m!130109))

(declare-fun m!130111 () Bool)

(assert (=> b!83509 m!130111))

(declare-fun m!130113 () Bool)

(assert (=> b!83510 m!130113))

(declare-fun m!130115 () Bool)

(assert (=> b!83508 m!130115))

(declare-fun m!130117 () Bool)

(assert (=> b!83508 m!130117))

(check-sat (not b!83509) (not b!83512) (not b!83511) (not b!83510) (not start!17100) (not b!83508))
(check-sat)
(get-model)

(declare-fun d!26694 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!26694 (= (inv!12 b1!98) (invariant!0 (currentBit!4237 b1!98) (currentByte!4242 b1!98) (size!1749 (buf!2139 b1!98))))))

(declare-fun bs!6571 () Bool)

(assert (= bs!6571 d!26694))

(declare-fun m!130137 () Bool)

(assert (=> bs!6571 m!130137))

(assert (=> start!17100 d!26694))

(declare-fun d!26696 () Bool)

(assert (=> d!26696 (= (inv!12 b2!98) (invariant!0 (currentBit!4237 b2!98) (currentByte!4242 b2!98) (size!1749 (buf!2139 b2!98))))))

(declare-fun bs!6572 () Bool)

(assert (= bs!6572 d!26696))

(declare-fun m!130139 () Bool)

(assert (=> bs!6572 m!130139))

(assert (=> start!17100 d!26696))

(declare-fun d!26698 () Bool)

(assert (=> d!26698 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1749 (buf!2139 b1!98))) ((_ sign_extend 32) (currentByte!4242 b1!98)) ((_ sign_extend 32) (currentBit!4237 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1749 (buf!2139 b1!98))) ((_ sign_extend 32) (currentByte!4242 b1!98)) ((_ sign_extend 32) (currentBit!4237 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6573 () Bool)

(assert (= bs!6573 d!26698))

(assert (=> bs!6573 m!130115))

(assert (=> b!83511 d!26698))

(declare-fun d!26700 () Bool)

(declare-fun e!55581 () Bool)

(assert (=> d!26700 e!55581))

(declare-fun res!68688 () Bool)

(assert (=> d!26700 (=> (not res!68688) (not e!55581))))

(declare-fun lt!133120 () (_ BitVec 64))

(declare-fun lt!133121 () (_ BitVec 64))

(declare-fun lt!133124 () (_ BitVec 64))

(assert (=> d!26700 (= res!68688 (= lt!133124 (bvsub lt!133120 lt!133121)))))

(assert (=> d!26700 (or (= (bvand lt!133120 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133121 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133120 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133120 lt!133121) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26700 (= lt!133121 (remainingBits!0 ((_ sign_extend 32) (size!1749 (buf!2139 b2!98))) ((_ sign_extend 32) (currentByte!4242 b2!98)) ((_ sign_extend 32) (currentBit!4237 b2!98))))))

(declare-fun lt!133123 () (_ BitVec 64))

(declare-fun lt!133125 () (_ BitVec 64))

(assert (=> d!26700 (= lt!133120 (bvmul lt!133123 lt!133125))))

(assert (=> d!26700 (or (= lt!133123 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133125 (bvsdiv (bvmul lt!133123 lt!133125) lt!133123)))))

(assert (=> d!26700 (= lt!133125 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26700 (= lt!133123 ((_ sign_extend 32) (size!1749 (buf!2139 b2!98))))))

(assert (=> d!26700 (= lt!133124 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4242 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4237 b2!98))))))

(assert (=> d!26700 (invariant!0 (currentBit!4237 b2!98) (currentByte!4242 b2!98) (size!1749 (buf!2139 b2!98)))))

(assert (=> d!26700 (= (bitIndex!0 (size!1749 (buf!2139 b2!98)) (currentByte!4242 b2!98) (currentBit!4237 b2!98)) lt!133124)))

(declare-fun b!83532 () Bool)

(declare-fun res!68689 () Bool)

(assert (=> b!83532 (=> (not res!68689) (not e!55581))))

(assert (=> b!83532 (= res!68689 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!133124))))

(declare-fun b!83533 () Bool)

(declare-fun lt!133122 () (_ BitVec 64))

(assert (=> b!83533 (= e!55581 (bvsle lt!133124 (bvmul lt!133122 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83533 (or (= lt!133122 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!133122 #b0000000000000000000000000000000000000000000000000000000000001000) lt!133122)))))

(assert (=> b!83533 (= lt!133122 ((_ sign_extend 32) (size!1749 (buf!2139 b2!98))))))

(assert (= (and d!26700 res!68688) b!83532))

(assert (= (and b!83532 res!68689) b!83533))

(declare-fun m!130141 () Bool)

(assert (=> d!26700 m!130141))

(assert (=> d!26700 m!130139))

(assert (=> b!83509 d!26700))

(declare-fun d!26702 () Bool)

(declare-fun e!55582 () Bool)

(assert (=> d!26702 e!55582))

(declare-fun res!68690 () Bool)

(assert (=> d!26702 (=> (not res!68690) (not e!55582))))

(declare-fun lt!133130 () (_ BitVec 64))

(declare-fun lt!133127 () (_ BitVec 64))

(declare-fun lt!133126 () (_ BitVec 64))

(assert (=> d!26702 (= res!68690 (= lt!133130 (bvsub lt!133126 lt!133127)))))

(assert (=> d!26702 (or (= (bvand lt!133126 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133127 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133126 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133126 lt!133127) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26702 (= lt!133127 (remainingBits!0 ((_ sign_extend 32) (size!1749 (buf!2139 b1!98))) ((_ sign_extend 32) (currentByte!4242 b1!98)) ((_ sign_extend 32) (currentBit!4237 b1!98))))))

(declare-fun lt!133129 () (_ BitVec 64))

(declare-fun lt!133131 () (_ BitVec 64))

(assert (=> d!26702 (= lt!133126 (bvmul lt!133129 lt!133131))))

(assert (=> d!26702 (or (= lt!133129 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133131 (bvsdiv (bvmul lt!133129 lt!133131) lt!133129)))))

(assert (=> d!26702 (= lt!133131 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26702 (= lt!133129 ((_ sign_extend 32) (size!1749 (buf!2139 b1!98))))))

(assert (=> d!26702 (= lt!133130 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4242 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4237 b1!98))))))

(assert (=> d!26702 (invariant!0 (currentBit!4237 b1!98) (currentByte!4242 b1!98) (size!1749 (buf!2139 b1!98)))))

(assert (=> d!26702 (= (bitIndex!0 (size!1749 (buf!2139 b1!98)) (currentByte!4242 b1!98) (currentBit!4237 b1!98)) lt!133130)))

(declare-fun b!83534 () Bool)

(declare-fun res!68691 () Bool)

(assert (=> b!83534 (=> (not res!68691) (not e!55582))))

(assert (=> b!83534 (= res!68691 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!133130))))

(declare-fun b!83535 () Bool)

(declare-fun lt!133128 () (_ BitVec 64))

(assert (=> b!83535 (= e!55582 (bvsle lt!133130 (bvmul lt!133128 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83535 (or (= lt!133128 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!133128 #b0000000000000000000000000000000000000000000000000000000000001000) lt!133128)))))

(assert (=> b!83535 (= lt!133128 ((_ sign_extend 32) (size!1749 (buf!2139 b1!98))))))

(assert (= (and d!26702 res!68690) b!83534))

(assert (= (and b!83534 res!68691) b!83535))

(assert (=> d!26702 m!130115))

(assert (=> d!26702 m!130137))

(assert (=> b!83509 d!26702))

(declare-fun d!26706 () Bool)

(assert (=> d!26706 (= (array_inv!1595 (buf!2139 b2!98)) (bvsge (size!1749 (buf!2139 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!83510 d!26706))

(declare-fun d!26708 () Bool)

(assert (=> d!26708 (= (remainingBits!0 ((_ sign_extend 32) (size!1749 (buf!2139 b1!98))) ((_ sign_extend 32) (currentByte!4242 b1!98)) ((_ sign_extend 32) (currentBit!4237 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1749 (buf!2139 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4242 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4237 b1!98)))))))

(assert (=> b!83508 d!26708))

(declare-fun d!26714 () Bool)

(declare-fun lt!133143 () (_ BitVec 64))

(declare-fun lt!133144 () (_ BitVec 64))

(assert (=> d!26714 (= (remainingBits!0 ((_ sign_extend 32) (size!1749 (buf!2139 b1!98))) ((_ sign_extend 32) (currentByte!4242 b1!98)) ((_ sign_extend 32) (currentBit!4237 b1!98))) (bvsub lt!133143 lt!133144))))

(assert (=> d!26714 (or (= (bvand lt!133143 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133144 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133143 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133143 lt!133144) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26714 (= lt!133144 (bitIndex!0 (size!1749 (buf!2139 b1!98)) (currentByte!4242 b1!98) (currentBit!4237 b1!98)))))

(declare-fun lt!133146 () (_ BitVec 64))

(declare-fun lt!133142 () (_ BitVec 64))

(assert (=> d!26714 (= lt!133143 (bvmul lt!133146 lt!133142))))

(assert (=> d!26714 (or (= lt!133146 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133142 (bvsdiv (bvmul lt!133146 lt!133142) lt!133146)))))

(assert (=> d!26714 (= lt!133142 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26714 (= lt!133146 ((_ sign_extend 32) (size!1749 (buf!2139 b1!98))))))

(declare-fun lt!133145 () Unit!5601)

(declare-fun choose!23 (BitStream!3060) Unit!5601)

(assert (=> d!26714 (= lt!133145 (choose!23 b1!98))))

(assert (=> d!26714 (= (remainingBitsBitIndexLemma!0 b1!98) lt!133145)))

(declare-fun bs!6576 () Bool)

(assert (= bs!6576 d!26714))

(assert (=> bs!6576 m!130115))

(assert (=> bs!6576 m!130111))

(declare-fun m!130147 () Bool)

(assert (=> bs!6576 m!130147))

(assert (=> b!83508 d!26714))

(declare-fun d!26716 () Bool)

(assert (=> d!26716 (= (array_inv!1595 (buf!2139 b1!98)) (bvsge (size!1749 (buf!2139 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!83512 d!26716))

(check-sat (not d!26714) (not d!26702) (not d!26694) (not d!26698) (not d!26700) (not d!26696))
