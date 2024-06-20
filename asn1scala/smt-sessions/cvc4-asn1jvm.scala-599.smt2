; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17150 () Bool)

(assert start!17150)

(declare-fun b!83657 () Bool)

(declare-fun e!55714 () Bool)

(declare-datatypes ((array!3861 0))(
  ( (array!3862 (arr!2393 (Array (_ BitVec 32) (_ BitVec 8))) (size!1756 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3074 0))(
  ( (BitStream!3075 (buf!2146 array!3861) (currentByte!4258 (_ BitVec 32)) (currentBit!4253 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!3074)

(declare-fun array_inv!1602 (array!3861) Bool)

(assert (=> b!83657 (= e!55714 (array_inv!1602 (buf!2146 b2!98)))))

(declare-fun b!83658 () Bool)

(declare-fun e!55711 () Bool)

(declare-fun b1!98 () BitStream!3074)

(assert (=> b!83658 (= e!55711 (array_inv!1602 (buf!2146 b1!98)))))

(declare-fun b!83659 () Bool)

(declare-fun e!55715 () Bool)

(declare-fun e!55712 () Bool)

(assert (=> b!83659 (= e!55715 (not e!55712))))

(declare-fun res!68777 () Bool)

(assert (=> b!83659 (=> res!68777 e!55712)))

(declare-fun lt!133338 () (_ BitVec 64))

(declare-fun lt!133341 () (_ BitVec 64))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(assert (=> b!83659 (= res!68777 (bvsgt lt!133338 (bvsub lt!133341 b1ValidateOffsetBits!11)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83659 (= (remainingBits!0 ((_ sign_extend 32) (size!1756 (buf!2146 b1!98))) ((_ sign_extend 32) (currentByte!4258 b1!98)) ((_ sign_extend 32) (currentBit!4253 b1!98))) (bvsub lt!133341 lt!133338))))

(assert (=> b!83659 (= lt!133341 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1756 (buf!2146 b1!98)))))))

(declare-datatypes ((Unit!5615 0))(
  ( (Unit!5616) )
))
(declare-fun lt!133337 () Unit!5615)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3074) Unit!5615)

(assert (=> b!83659 (= lt!133337 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun res!68778 () Bool)

(declare-fun e!55713 () Bool)

(assert (=> start!17150 (=> (not res!68778) (not e!55713))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(assert (=> start!17150 (= res!68778 (and (= (size!1756 (buf!2146 b1!98)) (size!1756 (buf!2146 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!17150 e!55713))

(declare-fun inv!12 (BitStream!3074) Bool)

(assert (=> start!17150 (and (inv!12 b1!98) e!55711)))

(assert (=> start!17150 (and (inv!12 b2!98) e!55714)))

(assert (=> start!17150 true))

(declare-fun b!83660 () Bool)

(declare-fun lt!133339 () (_ BitVec 64))

(declare-fun lt!133336 () (_ BitVec 64))

(assert (=> b!83660 (= e!55712 (or (not (= lt!133336 (bvand b1b2Diff!1 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!133336 (bvand lt!133339 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!83660 (= lt!133336 (bvand lt!133338 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!133335 () (_ BitVec 64))

(assert (=> b!83660 (= (remainingBits!0 ((_ sign_extend 32) (size!1756 (buf!2146 b2!98))) ((_ sign_extend 32) (currentByte!4258 b2!98)) ((_ sign_extend 32) (currentBit!4253 b2!98))) (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1756 (buf!2146 b2!98)))) lt!133335))))

(declare-fun lt!133340 () Unit!5615)

(assert (=> b!83660 (= lt!133340 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun b!83661 () Bool)

(declare-fun res!68779 () Bool)

(assert (=> b!83661 (=> (not res!68779) (not e!55713))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83661 (= res!68779 (validate_offset_bits!1 ((_ sign_extend 32) (size!1756 (buf!2146 b1!98))) ((_ sign_extend 32) (currentByte!4258 b1!98)) ((_ sign_extend 32) (currentBit!4253 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!83662 () Bool)

(assert (=> b!83662 (= e!55713 e!55715)))

(declare-fun res!68776 () Bool)

(assert (=> b!83662 (=> (not res!68776) (not e!55715))))

(assert (=> b!83662 (= res!68776 (= lt!133339 lt!133335))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83662 (= lt!133335 (bitIndex!0 (size!1756 (buf!2146 b2!98)) (currentByte!4258 b2!98) (currentBit!4253 b2!98)))))

(assert (=> b!83662 (= lt!133339 (bvadd lt!133338 b1b2Diff!1))))

(assert (=> b!83662 (= lt!133338 (bitIndex!0 (size!1756 (buf!2146 b1!98)) (currentByte!4258 b1!98) (currentBit!4253 b1!98)))))

(assert (= (and start!17150 res!68778) b!83661))

(assert (= (and b!83661 res!68779) b!83662))

(assert (= (and b!83662 res!68776) b!83659))

(assert (= (and b!83659 (not res!68777)) b!83660))

(assert (= start!17150 b!83658))

(assert (= start!17150 b!83657))

(declare-fun m!130271 () Bool)

(assert (=> b!83662 m!130271))

(declare-fun m!130273 () Bool)

(assert (=> b!83662 m!130273))

(declare-fun m!130275 () Bool)

(assert (=> b!83660 m!130275))

(declare-fun m!130277 () Bool)

(assert (=> b!83660 m!130277))

(declare-fun m!130279 () Bool)

(assert (=> b!83659 m!130279))

(declare-fun m!130281 () Bool)

(assert (=> b!83659 m!130281))

(declare-fun m!130283 () Bool)

(assert (=> b!83661 m!130283))

(declare-fun m!130285 () Bool)

(assert (=> b!83658 m!130285))

(declare-fun m!130287 () Bool)

(assert (=> start!17150 m!130287))

(declare-fun m!130289 () Bool)

(assert (=> start!17150 m!130289))

(declare-fun m!130291 () Bool)

(assert (=> b!83657 m!130291))

(push 1)

(assert (not b!83658))

(assert (not b!83661))

(assert (not b!83657))

(assert (not b!83662))

(assert (not start!17150))

(assert (not b!83660))

(assert (not b!83659))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!26774 () Bool)

(assert (=> d!26774 (= (array_inv!1602 (buf!2146 b2!98)) (bvsge (size!1756 (buf!2146 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!83657 d!26774))

(declare-fun d!26776 () Bool)

(declare-fun e!55723 () Bool)

(assert (=> d!26776 e!55723))

(declare-fun res!68793 () Bool)

(assert (=> d!26776 (=> (not res!68793) (not e!55723))))

(declare-fun lt!133403 () (_ BitVec 64))

(declare-fun lt!133400 () (_ BitVec 64))

(declare-fun lt!133402 () (_ BitVec 64))

(assert (=> d!26776 (= res!68793 (= lt!133402 (bvsub lt!133400 lt!133403)))))

(assert (=> d!26776 (or (= (bvand lt!133400 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133403 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133400 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133400 lt!133403) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26776 (= lt!133403 (remainingBits!0 ((_ sign_extend 32) (size!1756 (buf!2146 b2!98))) ((_ sign_extend 32) (currentByte!4258 b2!98)) ((_ sign_extend 32) (currentBit!4253 b2!98))))))

(declare-fun lt!133399 () (_ BitVec 64))

(declare-fun lt!133401 () (_ BitVec 64))

(assert (=> d!26776 (= lt!133400 (bvmul lt!133399 lt!133401))))

(assert (=> d!26776 (or (= lt!133399 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133401 (bvsdiv (bvmul lt!133399 lt!133401) lt!133399)))))

(assert (=> d!26776 (= lt!133401 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26776 (= lt!133399 ((_ sign_extend 32) (size!1756 (buf!2146 b2!98))))))

(assert (=> d!26776 (= lt!133402 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4258 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4253 b2!98))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!26776 (invariant!0 (currentBit!4253 b2!98) (currentByte!4258 b2!98) (size!1756 (buf!2146 b2!98)))))

(assert (=> d!26776 (= (bitIndex!0 (size!1756 (buf!2146 b2!98)) (currentByte!4258 b2!98) (currentBit!4253 b2!98)) lt!133402)))

(declare-fun b!83676 () Bool)

(declare-fun res!68792 () Bool)

(assert (=> b!83676 (=> (not res!68792) (not e!55723))))

(assert (=> b!83676 (= res!68792 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!133402))))

(declare-fun b!83677 () Bool)

(declare-fun lt!133398 () (_ BitVec 64))

(assert (=> b!83677 (= e!55723 (bvsle lt!133402 (bvmul lt!133398 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83677 (or (= lt!133398 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!133398 #b0000000000000000000000000000000000000000000000000000000000001000) lt!133398)))))

(assert (=> b!83677 (= lt!133398 ((_ sign_extend 32) (size!1756 (buf!2146 b2!98))))))

(assert (= (and d!26776 res!68793) b!83676))

(assert (= (and b!83676 res!68792) b!83677))

(assert (=> d!26776 m!130275))

(declare-fun m!130305 () Bool)

(assert (=> d!26776 m!130305))

(assert (=> b!83662 d!26776))

(declare-fun d!26792 () Bool)

(declare-fun e!55724 () Bool)

(assert (=> d!26792 e!55724))

(declare-fun res!68795 () Bool)

(assert (=> d!26792 (=> (not res!68795) (not e!55724))))

(declare-fun lt!133409 () (_ BitVec 64))

(declare-fun lt!133406 () (_ BitVec 64))

(declare-fun lt!133408 () (_ BitVec 64))

(assert (=> d!26792 (= res!68795 (= lt!133408 (bvsub lt!133406 lt!133409)))))

(assert (=> d!26792 (or (= (bvand lt!133406 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133409 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133406 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133406 lt!133409) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26792 (= lt!133409 (remainingBits!0 ((_ sign_extend 32) (size!1756 (buf!2146 b1!98))) ((_ sign_extend 32) (currentByte!4258 b1!98)) ((_ sign_extend 32) (currentBit!4253 b1!98))))))

(declare-fun lt!133405 () (_ BitVec 64))

(declare-fun lt!133407 () (_ BitVec 64))

(assert (=> d!26792 (= lt!133406 (bvmul lt!133405 lt!133407))))

(assert (=> d!26792 (or (= lt!133405 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133407 (bvsdiv (bvmul lt!133405 lt!133407) lt!133405)))))

(assert (=> d!26792 (= lt!133407 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26792 (= lt!133405 ((_ sign_extend 32) (size!1756 (buf!2146 b1!98))))))

(assert (=> d!26792 (= lt!133408 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4258 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4253 b1!98))))))

(assert (=> d!26792 (invariant!0 (currentBit!4253 b1!98) (currentByte!4258 b1!98) (size!1756 (buf!2146 b1!98)))))

(assert (=> d!26792 (= (bitIndex!0 (size!1756 (buf!2146 b1!98)) (currentByte!4258 b1!98) (currentBit!4253 b1!98)) lt!133408)))

(declare-fun b!83678 () Bool)

(declare-fun res!68794 () Bool)

(assert (=> b!83678 (=> (not res!68794) (not e!55724))))

(assert (=> b!83678 (= res!68794 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!133408))))

(declare-fun b!83679 () Bool)

(declare-fun lt!133404 () (_ BitVec 64))

(assert (=> b!83679 (= e!55724 (bvsle lt!133408 (bvmul lt!133404 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83679 (or (= lt!133404 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!133404 #b0000000000000000000000000000000000000000000000000000000000001000) lt!133404)))))

(assert (=> b!83679 (= lt!133404 ((_ sign_extend 32) (size!1756 (buf!2146 b1!98))))))

(assert (= (and d!26792 res!68795) b!83678))

(assert (= (and b!83678 res!68794) b!83679))

(assert (=> d!26792 m!130279))

(declare-fun m!130307 () Bool)

(assert (=> d!26792 m!130307))

(assert (=> b!83662 d!26792))

(declare-fun d!26794 () Bool)

(assert (=> d!26794 (= (array_inv!1602 (buf!2146 b1!98)) (bvsge (size!1756 (buf!2146 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!83658 d!26794))

(declare-fun d!26796 () Bool)

(assert (=> d!26796 (= (remainingBits!0 ((_ sign_extend 32) (size!1756 (buf!2146 b2!98))) ((_ sign_extend 32) (currentByte!4258 b2!98)) ((_ sign_extend 32) (currentBit!4253 b2!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1756 (buf!2146 b2!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4258 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4253 b2!98)))))))

(assert (=> b!83660 d!26796))

(declare-fun d!26798 () Bool)

(declare-fun lt!133439 () (_ BitVec 64))

(declare-fun lt!133436 () (_ BitVec 64))

(assert (=> d!26798 (= (remainingBits!0 ((_ sign_extend 32) (size!1756 (buf!2146 b2!98))) ((_ sign_extend 32) (currentByte!4258 b2!98)) ((_ sign_extend 32) (currentBit!4253 b2!98))) (bvsub lt!133439 lt!133436))))

(assert (=> d!26798 (or (= (bvand lt!133439 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133436 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133439 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133439 lt!133436) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26798 (= lt!133436 (bitIndex!0 (size!1756 (buf!2146 b2!98)) (currentByte!4258 b2!98) (currentBit!4253 b2!98)))))

(declare-fun lt!133435 () (_ BitVec 64))

(declare-fun lt!133438 () (_ BitVec 64))

(assert (=> d!26798 (= lt!133439 (bvmul lt!133435 lt!133438))))

(assert (=> d!26798 (or (= lt!133435 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133438 (bvsdiv (bvmul lt!133435 lt!133438) lt!133435)))))

(assert (=> d!26798 (= lt!133438 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26798 (= lt!133435 ((_ sign_extend 32) (size!1756 (buf!2146 b2!98))))))

(declare-fun lt!133437 () Unit!5615)

(declare-fun choose!23 (BitStream!3074) Unit!5615)

(assert (=> d!26798 (= lt!133437 (choose!23 b2!98))))

(assert (=> d!26798 (= (remainingBitsBitIndexLemma!0 b2!98) lt!133437)))

(declare-fun bs!6598 () Bool)

(assert (= bs!6598 d!26798))

(assert (=> bs!6598 m!130275))

(assert (=> bs!6598 m!130271))

(declare-fun m!130311 () Bool)

(assert (=> bs!6598 m!130311))

(assert (=> b!83660 d!26798))

(declare-fun d!26802 () Bool)

(assert (=> d!26802 (= (remainingBits!0 ((_ sign_extend 32) (size!1756 (buf!2146 b1!98))) ((_ sign_extend 32) (currentByte!4258 b1!98)) ((_ sign_extend 32) (currentBit!4253 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1756 (buf!2146 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4258 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4253 b1!98)))))))

(assert (=> b!83659 d!26802))

(declare-fun d!26804 () Bool)

(declare-fun lt!133444 () (_ BitVec 64))

(declare-fun lt!133441 () (_ BitVec 64))

(assert (=> d!26804 (= (remainingBits!0 ((_ sign_extend 32) (size!1756 (buf!2146 b1!98))) ((_ sign_extend 32) (currentByte!4258 b1!98)) ((_ sign_extend 32) (currentBit!4253 b1!98))) (bvsub lt!133444 lt!133441))))

(assert (=> d!26804 (or (= (bvand lt!133444 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133441 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133444 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133444 lt!133441) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26804 (= lt!133441 (bitIndex!0 (size!1756 (buf!2146 b1!98)) (currentByte!4258 b1!98) (currentBit!4253 b1!98)))))

(declare-fun lt!133440 () (_ BitVec 64))

(declare-fun lt!133443 () (_ BitVec 64))

(assert (=> d!26804 (= lt!133444 (bvmul lt!133440 lt!133443))))

(assert (=> d!26804 (or (= lt!133440 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133443 (bvsdiv (bvmul lt!133440 lt!133443) lt!133440)))))

(assert (=> d!26804 (= lt!133443 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26804 (= lt!133440 ((_ sign_extend 32) (size!1756 (buf!2146 b1!98))))))

(declare-fun lt!133442 () Unit!5615)

(assert (=> d!26804 (= lt!133442 (choose!23 b1!98))))

(assert (=> d!26804 (= (remainingBitsBitIndexLemma!0 b1!98) lt!133442)))

(declare-fun bs!6599 () Bool)

(assert (= bs!6599 d!26804))

(assert (=> bs!6599 m!130279))

(assert (=> bs!6599 m!130273))

(declare-fun m!130313 () Bool)

(assert (=> bs!6599 m!130313))

(assert (=> b!83659 d!26804))

(declare-fun d!26806 () Bool)

(assert (=> d!26806 (= (inv!12 b1!98) (invariant!0 (currentBit!4253 b1!98) (currentByte!4258 b1!98) (size!1756 (buf!2146 b1!98))))))

(declare-fun bs!6600 () Bool)

(assert (= bs!6600 d!26806))

(assert (=> bs!6600 m!130307))

(assert (=> start!17150 d!26806))

(declare-fun d!26808 () Bool)

(assert (=> d!26808 (= (inv!12 b2!98) (invariant!0 (currentBit!4253 b2!98) (currentByte!4258 b2!98) (size!1756 (buf!2146 b2!98))))))

(declare-fun bs!6601 () Bool)

(assert (= bs!6601 d!26808))

(assert (=> bs!6601 m!130305))

(assert (=> start!17150 d!26808))

(declare-fun d!26810 () Bool)

(assert (=> d!26810 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1756 (buf!2146 b1!98))) ((_ sign_extend 32) (currentByte!4258 b1!98)) ((_ sign_extend 32) (currentBit!4253 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1756 (buf!2146 b1!98))) ((_ sign_extend 32) (currentByte!4258 b1!98)) ((_ sign_extend 32) (currentBit!4253 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6602 () Bool)

(assert (= bs!6602 d!26810))

(assert (=> bs!6602 m!130279))

(assert (=> b!83661 d!26810))

(push 1)

(assert (not d!26804))

(assert (not d!26792))

(assert (not d!26810))

(assert (not d!26806))

(assert (not d!26776))

(assert (not d!26798))

(assert (not d!26808))

(check-sat)

(pop 1)

(push 1)

(check-sat)

