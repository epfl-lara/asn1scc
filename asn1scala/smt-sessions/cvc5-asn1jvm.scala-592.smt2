; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16972 () Bool)

(assert start!16972)

(declare-fun b!83198 () Bool)

(declare-fun e!55239 () Bool)

(declare-datatypes ((array!3803 0))(
  ( (array!3804 (arr!2370 (Array (_ BitVec 32) (_ BitVec 8))) (size!1733 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3028 0))(
  ( (BitStream!3029 (buf!2123 array!3803) (currentByte!4202 (_ BitVec 32)) (currentBit!4197 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!3028)

(declare-fun array_inv!1579 (array!3803) Bool)

(assert (=> b!83198 (= e!55239 (array_inv!1579 (buf!2123 b1!98)))))

(declare-fun b!83199 () Bool)

(declare-fun e!55241 () Bool)

(declare-fun e!55242 () Bool)

(assert (=> b!83199 (= e!55241 e!55242)))

(declare-fun res!68467 () Bool)

(assert (=> b!83199 (=> (not res!68467) (not e!55242))))

(declare-fun lt!132603 () (_ BitVec 64))

(declare-fun lt!132601 () (_ BitVec 64))

(assert (=> b!83199 (= res!68467 (= lt!132603 lt!132601))))

(declare-fun b2!98 () BitStream!3028)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83199 (= lt!132601 (bitIndex!0 (size!1733 (buf!2123 b2!98)) (currentByte!4202 b2!98) (currentBit!4197 b2!98)))))

(declare-fun lt!132596 () (_ BitVec 64))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(assert (=> b!83199 (= lt!132603 (bvadd lt!132596 b1b2Diff!1))))

(assert (=> b!83199 (= lt!132596 (bitIndex!0 (size!1733 (buf!2123 b1!98)) (currentByte!4202 b1!98) (currentBit!4197 b1!98)))))

(declare-fun res!68465 () Bool)

(assert (=> start!16972 (=> (not res!68465) (not e!55241))))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(assert (=> start!16972 (= res!68465 (and (= (size!1733 (buf!2123 b1!98)) (size!1733 (buf!2123 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16972 e!55241))

(declare-fun inv!12 (BitStream!3028) Bool)

(assert (=> start!16972 (and (inv!12 b1!98) e!55239)))

(declare-fun e!55238 () Bool)

(assert (=> start!16972 (and (inv!12 b2!98) e!55238)))

(assert (=> start!16972 true))

(declare-fun b!83200 () Bool)

(assert (=> b!83200 (= e!55238 (array_inv!1579 (buf!2123 b2!98)))))

(declare-fun b!83201 () Bool)

(declare-fun res!68464 () Bool)

(assert (=> b!83201 (=> (not res!68464) (not e!55241))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83201 (= res!68464 (validate_offset_bits!1 ((_ sign_extend 32) (size!1733 (buf!2123 b1!98))) ((_ sign_extend 32) (currentByte!4202 b1!98)) ((_ sign_extend 32) (currentBit!4197 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun lt!132600 () (_ BitVec 64))

(declare-fun lt!132598 () (_ BitVec 64))

(declare-fun b!83202 () Bool)

(declare-fun e!55237 () Bool)

(assert (=> b!83202 (= e!55237 (or (not (= lt!132598 (bvsub lt!132600 lt!132603))) (bvsge lt!132598 (bvsub b1ValidateOffsetBits!11 b1b2Diff!1))))))

(assert (=> b!83202 (= lt!132598 (bvsub lt!132600 lt!132601))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83202 (= lt!132598 (remainingBits!0 ((_ sign_extend 32) (size!1733 (buf!2123 b2!98))) ((_ sign_extend 32) (currentByte!4202 b2!98)) ((_ sign_extend 32) (currentBit!4197 b2!98))))))

(assert (=> b!83202 (= lt!132600 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1733 (buf!2123 b2!98)))))))

(declare-datatypes ((Unit!5575 0))(
  ( (Unit!5576) )
))
(declare-fun lt!132602 () Unit!5575)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3028) Unit!5575)

(assert (=> b!83202 (= lt!132602 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun b!83203 () Bool)

(assert (=> b!83203 (= e!55242 (not e!55237))))

(declare-fun res!68466 () Bool)

(assert (=> b!83203 (=> res!68466 e!55237)))

(declare-fun lt!132599 () (_ BitVec 64))

(assert (=> b!83203 (= res!68466 (bvsgt lt!132596 (bvsub lt!132599 b1ValidateOffsetBits!11)))))

(assert (=> b!83203 (= (remainingBits!0 ((_ sign_extend 32) (size!1733 (buf!2123 b1!98))) ((_ sign_extend 32) (currentByte!4202 b1!98)) ((_ sign_extend 32) (currentBit!4197 b1!98))) (bvsub lt!132599 lt!132596))))

(assert (=> b!83203 (= lt!132599 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1733 (buf!2123 b1!98)))))))

(declare-fun lt!132597 () Unit!5575)

(assert (=> b!83203 (= lt!132597 (remainingBitsBitIndexLemma!0 b1!98))))

(assert (= (and start!16972 res!68465) b!83201))

(assert (= (and b!83201 res!68464) b!83199))

(assert (= (and b!83199 res!68467) b!83203))

(assert (= (and b!83203 (not res!68466)) b!83202))

(assert (= start!16972 b!83198))

(assert (= start!16972 b!83200))

(declare-fun m!129753 () Bool)

(assert (=> b!83198 m!129753))

(declare-fun m!129755 () Bool)

(assert (=> b!83203 m!129755))

(declare-fun m!129757 () Bool)

(assert (=> b!83203 m!129757))

(declare-fun m!129759 () Bool)

(assert (=> b!83200 m!129759))

(declare-fun m!129761 () Bool)

(assert (=> b!83201 m!129761))

(declare-fun m!129763 () Bool)

(assert (=> b!83202 m!129763))

(declare-fun m!129765 () Bool)

(assert (=> b!83202 m!129765))

(declare-fun m!129767 () Bool)

(assert (=> start!16972 m!129767))

(declare-fun m!129769 () Bool)

(assert (=> start!16972 m!129769))

(declare-fun m!129771 () Bool)

(assert (=> b!83199 m!129771))

(declare-fun m!129773 () Bool)

(assert (=> b!83199 m!129773))

(push 1)

(assert (not b!83203))

(assert (not b!83200))

(assert (not b!83201))

(assert (not start!16972))

(assert (not b!83202))

(assert (not b!83198))

(assert (not b!83199))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!26562 () Bool)

(assert (=> d!26562 (= (remainingBits!0 ((_ sign_extend 32) (size!1733 (buf!2123 b2!98))) ((_ sign_extend 32) (currentByte!4202 b2!98)) ((_ sign_extend 32) (currentBit!4197 b2!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1733 (buf!2123 b2!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4202 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4197 b2!98)))))))

(assert (=> b!83202 d!26562))

(declare-fun d!26564 () Bool)

(declare-fun lt!132721 () (_ BitVec 64))

(declare-fun lt!132722 () (_ BitVec 64))

(assert (=> d!26564 (= (remainingBits!0 ((_ sign_extend 32) (size!1733 (buf!2123 b2!98))) ((_ sign_extend 32) (currentByte!4202 b2!98)) ((_ sign_extend 32) (currentBit!4197 b2!98))) (bvsub lt!132721 lt!132722))))

(assert (=> d!26564 (or (= (bvand lt!132721 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132722 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132721 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132721 lt!132722) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26564 (= lt!132722 (bitIndex!0 (size!1733 (buf!2123 b2!98)) (currentByte!4202 b2!98) (currentBit!4197 b2!98)))))

(declare-fun lt!132723 () (_ BitVec 64))

(declare-fun lt!132724 () (_ BitVec 64))

(assert (=> d!26564 (= lt!132721 (bvmul lt!132723 lt!132724))))

(assert (=> d!26564 (or (= lt!132723 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132724 (bvsdiv (bvmul lt!132723 lt!132724) lt!132723)))))

(assert (=> d!26564 (= lt!132724 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26564 (= lt!132723 ((_ sign_extend 32) (size!1733 (buf!2123 b2!98))))))

(declare-fun lt!132725 () Unit!5575)

(declare-fun choose!23 (BitStream!3028) Unit!5575)

(assert (=> d!26564 (= lt!132725 (choose!23 b2!98))))

(assert (=> d!26564 (= (remainingBitsBitIndexLemma!0 b2!98) lt!132725)))

(declare-fun bs!6529 () Bool)

(assert (= bs!6529 d!26564))

(assert (=> bs!6529 m!129763))

(assert (=> bs!6529 m!129771))

(declare-fun m!129833 () Bool)

(assert (=> bs!6529 m!129833))

(assert (=> b!83202 d!26564))

(declare-fun d!26568 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!26568 (= (inv!12 b1!98) (invariant!0 (currentBit!4197 b1!98) (currentByte!4202 b1!98) (size!1733 (buf!2123 b1!98))))))

(declare-fun bs!6530 () Bool)

(assert (= bs!6530 d!26568))

(declare-fun m!129835 () Bool)

(assert (=> bs!6530 m!129835))

(assert (=> start!16972 d!26568))

(declare-fun d!26570 () Bool)

(assert (=> d!26570 (= (inv!12 b2!98) (invariant!0 (currentBit!4197 b2!98) (currentByte!4202 b2!98) (size!1733 (buf!2123 b2!98))))))

(declare-fun bs!6531 () Bool)

(assert (= bs!6531 d!26570))

(declare-fun m!129837 () Bool)

(assert (=> bs!6531 m!129837))

(assert (=> start!16972 d!26570))

(declare-fun d!26572 () Bool)

(assert (=> d!26572 (= (remainingBits!0 ((_ sign_extend 32) (size!1733 (buf!2123 b1!98))) ((_ sign_extend 32) (currentByte!4202 b1!98)) ((_ sign_extend 32) (currentBit!4197 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1733 (buf!2123 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4202 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4197 b1!98)))))))

(assert (=> b!83203 d!26572))

(declare-fun d!26574 () Bool)

(declare-fun lt!132726 () (_ BitVec 64))

(declare-fun lt!132727 () (_ BitVec 64))

(assert (=> d!26574 (= (remainingBits!0 ((_ sign_extend 32) (size!1733 (buf!2123 b1!98))) ((_ sign_extend 32) (currentByte!4202 b1!98)) ((_ sign_extend 32) (currentBit!4197 b1!98))) (bvsub lt!132726 lt!132727))))

(assert (=> d!26574 (or (= (bvand lt!132726 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132727 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132726 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132726 lt!132727) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26574 (= lt!132727 (bitIndex!0 (size!1733 (buf!2123 b1!98)) (currentByte!4202 b1!98) (currentBit!4197 b1!98)))))

(declare-fun lt!132728 () (_ BitVec 64))

(declare-fun lt!132729 () (_ BitVec 64))

(assert (=> d!26574 (= lt!132726 (bvmul lt!132728 lt!132729))))

(assert (=> d!26574 (or (= lt!132728 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132729 (bvsdiv (bvmul lt!132728 lt!132729) lt!132728)))))

(assert (=> d!26574 (= lt!132729 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26574 (= lt!132728 ((_ sign_extend 32) (size!1733 (buf!2123 b1!98))))))

(declare-fun lt!132730 () Unit!5575)

(assert (=> d!26574 (= lt!132730 (choose!23 b1!98))))

(assert (=> d!26574 (= (remainingBitsBitIndexLemma!0 b1!98) lt!132730)))

(declare-fun bs!6532 () Bool)

(assert (= bs!6532 d!26574))

(assert (=> bs!6532 m!129755))

(assert (=> bs!6532 m!129773))

(declare-fun m!129839 () Bool)

(assert (=> bs!6532 m!129839))

(assert (=> b!83203 d!26574))

(declare-fun d!26576 () Bool)

(assert (=> d!26576 (= (array_inv!1579 (buf!2123 b1!98)) (bvsge (size!1733 (buf!2123 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!83198 d!26576))

(declare-fun d!26578 () Bool)

(declare-fun e!55295 () Bool)

(assert (=> d!26578 e!55295))

(declare-fun res!68512 () Bool)

(assert (=> d!26578 (=> (not res!68512) (not e!55295))))

(declare-fun lt!132773 () (_ BitVec 64))

(declare-fun lt!132772 () (_ BitVec 64))

(declare-fun lt!132777 () (_ BitVec 64))

(assert (=> d!26578 (= res!68512 (= lt!132773 (bvsub lt!132777 lt!132772)))))

(assert (=> d!26578 (or (= (bvand lt!132777 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132772 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132777 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132777 lt!132772) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26578 (= lt!132772 (remainingBits!0 ((_ sign_extend 32) (size!1733 (buf!2123 b2!98))) ((_ sign_extend 32) (currentByte!4202 b2!98)) ((_ sign_extend 32) (currentBit!4197 b2!98))))))

(declare-fun lt!132775 () (_ BitVec 64))

(declare-fun lt!132776 () (_ BitVec 64))

(assert (=> d!26578 (= lt!132777 (bvmul lt!132775 lt!132776))))

(assert (=> d!26578 (or (= lt!132775 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132776 (bvsdiv (bvmul lt!132775 lt!132776) lt!132775)))))

(assert (=> d!26578 (= lt!132776 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26578 (= lt!132775 ((_ sign_extend 32) (size!1733 (buf!2123 b2!98))))))

(assert (=> d!26578 (= lt!132773 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4202 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4197 b2!98))))))

(assert (=> d!26578 (invariant!0 (currentBit!4197 b2!98) (currentByte!4202 b2!98) (size!1733 (buf!2123 b2!98)))))

(assert (=> d!26578 (= (bitIndex!0 (size!1733 (buf!2123 b2!98)) (currentByte!4202 b2!98) (currentBit!4197 b2!98)) lt!132773)))

(declare-fun b!83263 () Bool)

(declare-fun res!68513 () Bool)

(assert (=> b!83263 (=> (not res!68513) (not e!55295))))

(assert (=> b!83263 (= res!68513 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!132773))))

(declare-fun b!83264 () Bool)

(declare-fun lt!132774 () (_ BitVec 64))

(assert (=> b!83264 (= e!55295 (bvsle lt!132773 (bvmul lt!132774 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83264 (or (= lt!132774 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!132774 #b0000000000000000000000000000000000000000000000000000000000001000) lt!132774)))))

(assert (=> b!83264 (= lt!132774 ((_ sign_extend 32) (size!1733 (buf!2123 b2!98))))))

(assert (= (and d!26578 res!68512) b!83263))

(assert (= (and b!83263 res!68513) b!83264))

(assert (=> d!26578 m!129763))

(assert (=> d!26578 m!129837))

(assert (=> b!83199 d!26578))

(declare-fun d!26588 () Bool)

(declare-fun e!55296 () Bool)

(assert (=> d!26588 e!55296))

(declare-fun res!68514 () Bool)

(assert (=> d!26588 (=> (not res!68514) (not e!55296))))

(declare-fun lt!132779 () (_ BitVec 64))

(declare-fun lt!132783 () (_ BitVec 64))

(declare-fun lt!132778 () (_ BitVec 64))

(assert (=> d!26588 (= res!68514 (= lt!132779 (bvsub lt!132783 lt!132778)))))

(assert (=> d!26588 (or (= (bvand lt!132783 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132778 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132783 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132783 lt!132778) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26588 (= lt!132778 (remainingBits!0 ((_ sign_extend 32) (size!1733 (buf!2123 b1!98))) ((_ sign_extend 32) (currentByte!4202 b1!98)) ((_ sign_extend 32) (currentBit!4197 b1!98))))))

(declare-fun lt!132781 () (_ BitVec 64))

(declare-fun lt!132782 () (_ BitVec 64))

(assert (=> d!26588 (= lt!132783 (bvmul lt!132781 lt!132782))))

(assert (=> d!26588 (or (= lt!132781 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132782 (bvsdiv (bvmul lt!132781 lt!132782) lt!132781)))))

(assert (=> d!26588 (= lt!132782 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26588 (= lt!132781 ((_ sign_extend 32) (size!1733 (buf!2123 b1!98))))))

(assert (=> d!26588 (= lt!132779 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4202 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4197 b1!98))))))

(assert (=> d!26588 (invariant!0 (currentBit!4197 b1!98) (currentByte!4202 b1!98) (size!1733 (buf!2123 b1!98)))))

(assert (=> d!26588 (= (bitIndex!0 (size!1733 (buf!2123 b1!98)) (currentByte!4202 b1!98) (currentBit!4197 b1!98)) lt!132779)))

(declare-fun b!83265 () Bool)

(declare-fun res!68515 () Bool)

(assert (=> b!83265 (=> (not res!68515) (not e!55296))))

(assert (=> b!83265 (= res!68515 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!132779))))

(declare-fun b!83266 () Bool)

(declare-fun lt!132780 () (_ BitVec 64))

(assert (=> b!83266 (= e!55296 (bvsle lt!132779 (bvmul lt!132780 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83266 (or (= lt!132780 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!132780 #b0000000000000000000000000000000000000000000000000000000000001000) lt!132780)))))

(assert (=> b!83266 (= lt!132780 ((_ sign_extend 32) (size!1733 (buf!2123 b1!98))))))

(assert (= (and d!26588 res!68514) b!83265))

(assert (= (and b!83265 res!68515) b!83266))

(assert (=> d!26588 m!129755))

(assert (=> d!26588 m!129835))

(assert (=> b!83199 d!26588))

(declare-fun d!26590 () Bool)

(assert (=> d!26590 (= (array_inv!1579 (buf!2123 b2!98)) (bvsge (size!1733 (buf!2123 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!83200 d!26590))

(declare-fun d!26592 () Bool)

(assert (=> d!26592 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1733 (buf!2123 b1!98))) ((_ sign_extend 32) (currentByte!4202 b1!98)) ((_ sign_extend 32) (currentBit!4197 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1733 (buf!2123 b1!98))) ((_ sign_extend 32) (currentByte!4202 b1!98)) ((_ sign_extend 32) (currentBit!4197 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6534 () Bool)

(assert (= bs!6534 d!26592))

(assert (=> bs!6534 m!129755))

(assert (=> b!83201 d!26592))

(push 1)

(assert (not d!26574))

(assert (not d!26592))

(assert (not d!26578))

(assert (not d!26570))

(assert (not d!26588))

(assert (not d!26564))

(assert (not d!26568))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

