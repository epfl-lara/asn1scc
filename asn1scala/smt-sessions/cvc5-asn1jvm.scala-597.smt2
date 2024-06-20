; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17098 () Bool)

(assert start!17098)

(declare-fun lt!133083 () (_ BitVec 64))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun lt!133081 () (_ BitVec 64))

(declare-fun b!83493 () Bool)

(declare-fun e!55539 () Bool)

(assert (=> b!83493 (= e!55539 (not (or (= lt!133081 (bvand b1ValidateOffsetBits!11 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!133081 (bvand (bvsub lt!133083 b1ValidateOffsetBits!11) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!83493 (= lt!133081 (bvand lt!133083 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!3842 0))(
  ( (array!3843 (arr!2385 (Array (_ BitVec 32) (_ BitVec 8))) (size!1748 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3058 0))(
  ( (BitStream!3059 (buf!2138 array!3842) (currentByte!4241 (_ BitVec 32)) (currentBit!4236 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!3058)

(declare-fun lt!133082 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83493 (= (remainingBits!0 ((_ sign_extend 32) (size!1748 (buf!2138 b1!98))) ((_ sign_extend 32) (currentByte!4241 b1!98)) ((_ sign_extend 32) (currentBit!4236 b1!98))) (bvsub lt!133083 lt!133082))))

(assert (=> b!83493 (= lt!133083 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1748 (buf!2138 b1!98)))))))

(declare-datatypes ((Unit!5599 0))(
  ( (Unit!5600) )
))
(declare-fun lt!133080 () Unit!5599)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3058) Unit!5599)

(assert (=> b!83493 (= lt!133080 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!83494 () Bool)

(declare-fun e!55538 () Bool)

(declare-fun array_inv!1594 (array!3842) Bool)

(assert (=> b!83494 (= e!55538 (array_inv!1594 (buf!2138 b1!98)))))

(declare-fun b!83495 () Bool)

(declare-fun e!55537 () Bool)

(declare-fun b2!98 () BitStream!3058)

(assert (=> b!83495 (= e!55537 (array_inv!1594 (buf!2138 b2!98)))))

(declare-fun b!83496 () Bool)

(declare-fun e!55540 () Bool)

(assert (=> b!83496 (= e!55540 e!55539)))

(declare-fun res!68664 () Bool)

(assert (=> b!83496 (=> (not res!68664) (not e!55539))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83496 (= res!68664 (= (bvadd lt!133082 b1b2Diff!1) (bitIndex!0 (size!1748 (buf!2138 b2!98)) (currentByte!4241 b2!98) (currentBit!4236 b2!98))))))

(assert (=> b!83496 (= lt!133082 (bitIndex!0 (size!1748 (buf!2138 b1!98)) (currentByte!4241 b1!98) (currentBit!4236 b1!98)))))

(declare-fun res!68665 () Bool)

(assert (=> start!17098 (=> (not res!68665) (not e!55540))))

(assert (=> start!17098 (= res!68665 (and (= (size!1748 (buf!2138 b1!98)) (size!1748 (buf!2138 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!17098 e!55540))

(declare-fun inv!12 (BitStream!3058) Bool)

(assert (=> start!17098 (and (inv!12 b1!98) e!55538)))

(assert (=> start!17098 (and (inv!12 b2!98) e!55537)))

(assert (=> start!17098 true))

(declare-fun b!83497 () Bool)

(declare-fun res!68663 () Bool)

(assert (=> b!83497 (=> (not res!68663) (not e!55540))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83497 (= res!68663 (validate_offset_bits!1 ((_ sign_extend 32) (size!1748 (buf!2138 b1!98))) ((_ sign_extend 32) (currentByte!4241 b1!98)) ((_ sign_extend 32) (currentBit!4236 b1!98)) b1ValidateOffsetBits!11))))

(assert (= (and start!17098 res!68665) b!83497))

(assert (= (and b!83497 res!68663) b!83496))

(assert (= (and b!83496 res!68664) b!83493))

(assert (= start!17098 b!83494))

(assert (= start!17098 b!83495))

(declare-fun m!130083 () Bool)

(assert (=> b!83494 m!130083))

(declare-fun m!130085 () Bool)

(assert (=> b!83497 m!130085))

(declare-fun m!130087 () Bool)

(assert (=> start!17098 m!130087))

(declare-fun m!130089 () Bool)

(assert (=> start!17098 m!130089))

(declare-fun m!130091 () Bool)

(assert (=> b!83493 m!130091))

(declare-fun m!130093 () Bool)

(assert (=> b!83493 m!130093))

(declare-fun m!130095 () Bool)

(assert (=> b!83495 m!130095))

(declare-fun m!130097 () Bool)

(assert (=> b!83496 m!130097))

(declare-fun m!130099 () Bool)

(assert (=> b!83496 m!130099))

(push 1)

(assert (not b!83493))

(assert (not start!17098))

(assert (not b!83497))

(assert (not b!83496))

(assert (not b!83495))

(assert (not b!83494))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!26704 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!26704 (= (inv!12 b1!98) (invariant!0 (currentBit!4236 b1!98) (currentByte!4241 b1!98) (size!1748 (buf!2138 b1!98))))))

(declare-fun bs!6574 () Bool)

(assert (= bs!6574 d!26704))

(declare-fun m!130143 () Bool)

(assert (=> bs!6574 m!130143))

(assert (=> start!17098 d!26704))

(declare-fun d!26710 () Bool)

(assert (=> d!26710 (= (inv!12 b2!98) (invariant!0 (currentBit!4236 b2!98) (currentByte!4241 b2!98) (size!1748 (buf!2138 b2!98))))))

(declare-fun bs!6575 () Bool)

(assert (= bs!6575 d!26710))

(declare-fun m!130145 () Bool)

(assert (=> bs!6575 m!130145))

(assert (=> start!17098 d!26710))

(declare-fun d!26712 () Bool)

(declare-fun e!55585 () Bool)

(assert (=> d!26712 e!55585))

(declare-fun res!68697 () Bool)

(assert (=> d!26712 (=> (not res!68697) (not e!55585))))

(declare-fun lt!133163 () (_ BitVec 64))

(declare-fun lt!133164 () (_ BitVec 64))

(declare-fun lt!133159 () (_ BitVec 64))

(assert (=> d!26712 (= res!68697 (= lt!133163 (bvsub lt!133164 lt!133159)))))

(assert (=> d!26712 (or (= (bvand lt!133164 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133159 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133164 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133164 lt!133159) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26712 (= lt!133159 (remainingBits!0 ((_ sign_extend 32) (size!1748 (buf!2138 b2!98))) ((_ sign_extend 32) (currentByte!4241 b2!98)) ((_ sign_extend 32) (currentBit!4236 b2!98))))))

(declare-fun lt!133162 () (_ BitVec 64))

(declare-fun lt!133161 () (_ BitVec 64))

(assert (=> d!26712 (= lt!133164 (bvmul lt!133162 lt!133161))))

(assert (=> d!26712 (or (= lt!133162 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133161 (bvsdiv (bvmul lt!133162 lt!133161) lt!133162)))))

(assert (=> d!26712 (= lt!133161 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26712 (= lt!133162 ((_ sign_extend 32) (size!1748 (buf!2138 b2!98))))))

(assert (=> d!26712 (= lt!133163 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4241 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4236 b2!98))))))

(assert (=> d!26712 (invariant!0 (currentBit!4236 b2!98) (currentByte!4241 b2!98) (size!1748 (buf!2138 b2!98)))))

(assert (=> d!26712 (= (bitIndex!0 (size!1748 (buf!2138 b2!98)) (currentByte!4241 b2!98) (currentBit!4236 b2!98)) lt!133163)))

(declare-fun b!83541 () Bool)

(declare-fun res!68696 () Bool)

(assert (=> b!83541 (=> (not res!68696) (not e!55585))))

(assert (=> b!83541 (= res!68696 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!133163))))

(declare-fun b!83542 () Bool)

(declare-fun lt!133160 () (_ BitVec 64))

(assert (=> b!83542 (= e!55585 (bvsle lt!133163 (bvmul lt!133160 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83542 (or (= lt!133160 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!133160 #b0000000000000000000000000000000000000000000000000000000000001000) lt!133160)))))

(assert (=> b!83542 (= lt!133160 ((_ sign_extend 32) (size!1748 (buf!2138 b2!98))))))

(assert (= (and d!26712 res!68697) b!83541))

(assert (= (and b!83541 res!68696) b!83542))

(declare-fun m!130149 () Bool)

(assert (=> d!26712 m!130149))

(assert (=> d!26712 m!130145))

(assert (=> b!83496 d!26712))

(declare-fun d!26724 () Bool)

(declare-fun e!55586 () Bool)

(assert (=> d!26724 e!55586))

(declare-fun res!68699 () Bool)

(assert (=> d!26724 (=> (not res!68699) (not e!55586))))

(declare-fun lt!133165 () (_ BitVec 64))

(declare-fun lt!133170 () (_ BitVec 64))

(declare-fun lt!133169 () (_ BitVec 64))

(assert (=> d!26724 (= res!68699 (= lt!133169 (bvsub lt!133170 lt!133165)))))

(assert (=> d!26724 (or (= (bvand lt!133170 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133165 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133170 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133170 lt!133165) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26724 (= lt!133165 (remainingBits!0 ((_ sign_extend 32) (size!1748 (buf!2138 b1!98))) ((_ sign_extend 32) (currentByte!4241 b1!98)) ((_ sign_extend 32) (currentBit!4236 b1!98))))))

(declare-fun lt!133168 () (_ BitVec 64))

(declare-fun lt!133167 () (_ BitVec 64))

(assert (=> d!26724 (= lt!133170 (bvmul lt!133168 lt!133167))))

(assert (=> d!26724 (or (= lt!133168 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133167 (bvsdiv (bvmul lt!133168 lt!133167) lt!133168)))))

(assert (=> d!26724 (= lt!133167 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26724 (= lt!133168 ((_ sign_extend 32) (size!1748 (buf!2138 b1!98))))))

(assert (=> d!26724 (= lt!133169 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4241 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4236 b1!98))))))

(assert (=> d!26724 (invariant!0 (currentBit!4236 b1!98) (currentByte!4241 b1!98) (size!1748 (buf!2138 b1!98)))))

(assert (=> d!26724 (= (bitIndex!0 (size!1748 (buf!2138 b1!98)) (currentByte!4241 b1!98) (currentBit!4236 b1!98)) lt!133169)))

(declare-fun b!83543 () Bool)

(declare-fun res!68698 () Bool)

(assert (=> b!83543 (=> (not res!68698) (not e!55586))))

(assert (=> b!83543 (= res!68698 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!133169))))

(declare-fun b!83544 () Bool)

(declare-fun lt!133166 () (_ BitVec 64))

(assert (=> b!83544 (= e!55586 (bvsle lt!133169 (bvmul lt!133166 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83544 (or (= lt!133166 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!133166 #b0000000000000000000000000000000000000000000000000000000000001000) lt!133166)))))

(assert (=> b!83544 (= lt!133166 ((_ sign_extend 32) (size!1748 (buf!2138 b1!98))))))

(assert (= (and d!26724 res!68699) b!83543))

(assert (= (and b!83543 res!68698) b!83544))

(assert (=> d!26724 m!130091))

(assert (=> d!26724 m!130143))

(assert (=> b!83496 d!26724))

(declare-fun d!26726 () Bool)

(assert (=> d!26726 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1748 (buf!2138 b1!98))) ((_ sign_extend 32) (currentByte!4241 b1!98)) ((_ sign_extend 32) (currentBit!4236 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1748 (buf!2138 b1!98))) ((_ sign_extend 32) (currentByte!4241 b1!98)) ((_ sign_extend 32) (currentBit!4236 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6578 () Bool)

(assert (= bs!6578 d!26726))

(assert (=> bs!6578 m!130091))

(assert (=> b!83497 d!26726))

(declare-fun d!26728 () Bool)

(assert (=> d!26728 (= (array_inv!1594 (buf!2138 b2!98)) (bvsge (size!1748 (buf!2138 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!83495 d!26728))

(declare-fun d!26730 () Bool)

(assert (=> d!26730 (= (array_inv!1594 (buf!2138 b1!98)) (bvsge (size!1748 (buf!2138 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!83494 d!26730))

(declare-fun d!26732 () Bool)

(assert (=> d!26732 (= (remainingBits!0 ((_ sign_extend 32) (size!1748 (buf!2138 b1!98))) ((_ sign_extend 32) (currentByte!4241 b1!98)) ((_ sign_extend 32) (currentBit!4236 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1748 (buf!2138 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4241 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4236 b1!98)))))))

(assert (=> b!83493 d!26732))

(declare-fun d!26734 () Bool)

(declare-fun lt!133199 () (_ BitVec 64))

(declare-fun lt!133201 () (_ BitVec 64))

(assert (=> d!26734 (= (remainingBits!0 ((_ sign_extend 32) (size!1748 (buf!2138 b1!98))) ((_ sign_extend 32) (currentByte!4241 b1!98)) ((_ sign_extend 32) (currentBit!4236 b1!98))) (bvsub lt!133199 lt!133201))))

(assert (=> d!26734 (or (= (bvand lt!133199 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133201 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133199 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133199 lt!133201) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26734 (= lt!133201 (bitIndex!0 (size!1748 (buf!2138 b1!98)) (currentByte!4241 b1!98) (currentBit!4236 b1!98)))))

(declare-fun lt!133202 () (_ BitVec 64))

(declare-fun lt!133203 () (_ BitVec 64))

(assert (=> d!26734 (= lt!133199 (bvmul lt!133202 lt!133203))))

(assert (=> d!26734 (or (= lt!133202 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133203 (bvsdiv (bvmul lt!133202 lt!133203) lt!133202)))))

(assert (=> d!26734 (= lt!133203 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26734 (= lt!133202 ((_ sign_extend 32) (size!1748 (buf!2138 b1!98))))))

(declare-fun lt!133200 () Unit!5599)

(declare-fun choose!23 (BitStream!3058) Unit!5599)

(assert (=> d!26734 (= lt!133200 (choose!23 b1!98))))

(assert (=> d!26734 (= (remainingBitsBitIndexLemma!0 b1!98) lt!133200)))

(declare-fun bs!6579 () Bool)

(assert (= bs!6579 d!26734))

(assert (=> bs!6579 m!130091))

(assert (=> bs!6579 m!130099))

(declare-fun m!130155 () Bool)

(assert (=> bs!6579 m!130155))

(assert (=> b!83493 d!26734))

(push 1)

(assert (not d!26724))

(assert (not d!26712))

(assert (not d!26704))

(assert (not d!26726))

(assert (not d!26710))

(assert (not d!26734))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

