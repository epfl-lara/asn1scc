; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18254 () Bool)

(assert start!18254)

(declare-fun b!90489 () Bool)

(declare-fun res!74620 () Bool)

(declare-fun e!59603 () Bool)

(assert (=> b!90489 (=> (not res!74620) (not e!59603))))

(declare-datatypes ((array!4246 0))(
  ( (array!4247 (arr!2552 (Array (_ BitVec 32) (_ BitVec 8))) (size!1915 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3392 0))(
  ( (BitStream!3393 (buf!2305 array!4246) (currentByte!4577 (_ BitVec 32)) (currentBit!4572 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3392)

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!90489 (= res!74620 (validate_offset_bits!1 ((_ sign_extend 32) (size!1915 (buf!2305 thiss!1152))) ((_ sign_extend 32) (currentByte!4577 thiss!1152)) ((_ sign_extend 32) (currentBit!4572 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!90490 () Bool)

(declare-fun e!59606 () Bool)

(declare-fun e!59605 () Bool)

(assert (=> b!90490 (= e!59606 e!59605)))

(declare-fun res!74624 () Bool)

(assert (=> b!90490 (=> (not res!74624) (not e!59605))))

(declare-datatypes ((Unit!5819 0))(
  ( (Unit!5820) )
))
(declare-datatypes ((tuple2!7548 0))(
  ( (tuple2!7549 (_1!4018 Unit!5819) (_2!4018 BitStream!3392)) )
))
(declare-fun lt!137170 () tuple2!7548)

(declare-fun lt!137174 () Bool)

(declare-datatypes ((tuple2!7550 0))(
  ( (tuple2!7551 (_1!4019 BitStream!3392) (_2!4019 Bool)) )
))
(declare-fun lt!137171 () tuple2!7550)

(assert (=> b!90490 (= res!74624 (and (= (_2!4019 lt!137171) lt!137174) (= (_1!4019 lt!137171) (_2!4018 lt!137170))))))

(declare-fun readBitPure!0 (BitStream!3392) tuple2!7550)

(declare-fun readerFrom!0 (BitStream!3392 (_ BitVec 32) (_ BitVec 32)) BitStream!3392)

(assert (=> b!90490 (= lt!137171 (readBitPure!0 (readerFrom!0 (_2!4018 lt!137170) (currentBit!4572 thiss!1152) (currentByte!4577 thiss!1152))))))

(declare-fun b!90491 () Bool)

(declare-fun res!74631 () Bool)

(declare-fun e!59607 () Bool)

(assert (=> b!90491 (=> (not res!74631) (not e!59607))))

(assert (=> b!90491 (= res!74631 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!90492 () Bool)

(declare-fun res!74628 () Bool)

(assert (=> b!90492 (=> (not res!74628) (not e!59607))))

(declare-fun thiss!1151 () BitStream!3392)

(assert (=> b!90492 (= res!74628 (validate_offset_bits!1 ((_ sign_extend 32) (size!1915 (buf!2305 thiss!1151))) ((_ sign_extend 32) (currentByte!4577 thiss!1151)) ((_ sign_extend 32) (currentBit!4572 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!90494 () Bool)

(declare-fun res!74623 () Bool)

(assert (=> b!90494 (=> (not res!74623) (not e!59607))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!90494 (= res!74623 (invariant!0 (currentBit!4572 thiss!1151) (currentByte!4577 thiss!1151) (size!1915 (buf!2305 thiss!1151))))))

(declare-fun b!90495 () Bool)

(declare-fun lt!137173 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!90495 (= e!59605 (= (bitIndex!0 (size!1915 (buf!2305 (_1!4019 lt!137171))) (currentByte!4577 (_1!4019 lt!137171)) (currentBit!4572 (_1!4019 lt!137171))) lt!137173))))

(declare-fun b!90496 () Bool)

(declare-fun res!74626 () Bool)

(assert (=> b!90496 (=> (not res!74626) (not e!59606))))

(declare-fun isPrefixOf!0 (BitStream!3392 BitStream!3392) Bool)

(assert (=> b!90496 (= res!74626 (isPrefixOf!0 thiss!1152 (_2!4018 lt!137170)))))

(declare-fun v!179 () (_ BitVec 64))

(declare-fun b!90497 () Bool)

(declare-fun e!59604 () Bool)

(declare-datatypes ((tuple3!440 0))(
  ( (tuple3!441 (_1!4020 Unit!5819) (_2!4020 BitStream!3392) (_3!244 (_ BitVec 32))) )
))
(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3392 (_ BitVec 64) BitStream!3392 (_ BitVec 32)) tuple3!440)

(assert (=> b!90497 (= e!59604 (bvsge (_3!244 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!4018 lt!137170) (bvadd #b00000000000000000000000000000001 i!576))) nBits!336))))

(declare-fun b!90498 () Bool)

(declare-fun e!59608 () Bool)

(declare-fun array_inv!1761 (array!4246) Bool)

(assert (=> b!90498 (= e!59608 (array_inv!1761 (buf!2305 thiss!1152)))))

(declare-fun b!90499 () Bool)

(declare-fun e!59602 () Bool)

(assert (=> b!90499 (= e!59602 (array_inv!1761 (buf!2305 thiss!1151)))))

(declare-fun b!90500 () Bool)

(declare-fun res!74629 () Bool)

(assert (=> b!90500 (=> res!74629 e!59604)))

(assert (=> b!90500 (= res!74629 (bvsge (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!90501 () Bool)

(declare-fun e!59609 () Bool)

(assert (=> b!90501 (= e!59609 e!59606)))

(declare-fun res!74618 () Bool)

(assert (=> b!90501 (=> (not res!74618) (not e!59606))))

(declare-fun lt!137172 () (_ BitVec 64))

(assert (=> b!90501 (= res!74618 (= lt!137173 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!137172)))))

(assert (=> b!90501 (= lt!137173 (bitIndex!0 (size!1915 (buf!2305 (_2!4018 lt!137170))) (currentByte!4577 (_2!4018 lt!137170)) (currentBit!4572 (_2!4018 lt!137170))))))

(declare-fun b!90502 () Bool)

(declare-fun res!74632 () Bool)

(assert (=> b!90502 (=> (not res!74632) (not e!59603))))

(assert (=> b!90502 (= res!74632 (bvslt i!576 nBits!336))))

(declare-fun b!90503 () Bool)

(declare-fun res!74619 () Bool)

(assert (=> b!90503 (=> (not res!74619) (not e!59607))))

(assert (=> b!90503 (= res!74619 (and (bvsle i!576 nBits!336) (= (size!1915 (buf!2305 thiss!1152)) (size!1915 (buf!2305 thiss!1151)))))))

(declare-fun res!74622 () Bool)

(assert (=> start!18254 (=> (not res!74622) (not e!59607))))

(assert (=> start!18254 (= res!74622 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18254 e!59607))

(declare-fun inv!12 (BitStream!3392) Bool)

(assert (=> start!18254 (and (inv!12 thiss!1152) e!59608)))

(assert (=> start!18254 (and (inv!12 thiss!1151) e!59602)))

(assert (=> start!18254 true))

(declare-fun b!90493 () Bool)

(assert (=> b!90493 (= e!59603 (not e!59604))))

(declare-fun res!74625 () Bool)

(assert (=> b!90493 (=> res!74625 e!59604)))

(assert (=> b!90493 (= res!74625 (not (invariant!0 (currentBit!4572 (_2!4018 lt!137170)) (currentByte!4577 (_2!4018 lt!137170)) (size!1915 (buf!2305 (_2!4018 lt!137170))))))))

(assert (=> b!90493 e!59609))

(declare-fun res!74630 () Bool)

(assert (=> b!90493 (=> (not res!74630) (not e!59609))))

(assert (=> b!90493 (= res!74630 (= (size!1915 (buf!2305 thiss!1152)) (size!1915 (buf!2305 (_2!4018 lt!137170)))))))

(declare-fun appendBit!0 (BitStream!3392 Bool) tuple2!7548)

(assert (=> b!90493 (= lt!137170 (appendBit!0 thiss!1152 lt!137174))))

(assert (=> b!90493 (= lt!137174 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!90504 () Bool)

(declare-fun res!74621 () Bool)

(assert (=> b!90504 (=> (not res!74621) (not e!59607))))

(assert (=> b!90504 (= res!74621 (invariant!0 (currentBit!4572 thiss!1152) (currentByte!4577 thiss!1152) (size!1915 (buf!2305 thiss!1152))))))

(declare-fun b!90505 () Bool)

(assert (=> b!90505 (= e!59607 e!59603)))

(declare-fun res!74627 () Bool)

(assert (=> b!90505 (=> (not res!74627) (not e!59603))))

(declare-fun lt!137175 () (_ BitVec 64))

(assert (=> b!90505 (= res!74627 (= lt!137172 (bvadd lt!137175 ((_ sign_extend 32) i!576))))))

(assert (=> b!90505 (= lt!137172 (bitIndex!0 (size!1915 (buf!2305 thiss!1152)) (currentByte!4577 thiss!1152) (currentBit!4572 thiss!1152)))))

(assert (=> b!90505 (= lt!137175 (bitIndex!0 (size!1915 (buf!2305 thiss!1151)) (currentByte!4577 thiss!1151) (currentBit!4572 thiss!1151)))))

(assert (= (and start!18254 res!74622) b!90492))

(assert (= (and b!90492 res!74628) b!90494))

(assert (= (and b!90494 res!74623) b!90491))

(assert (= (and b!90491 res!74631) b!90504))

(assert (= (and b!90504 res!74621) b!90503))

(assert (= (and b!90503 res!74619) b!90505))

(assert (= (and b!90505 res!74627) b!90489))

(assert (= (and b!90489 res!74620) b!90502))

(assert (= (and b!90502 res!74632) b!90493))

(assert (= (and b!90493 res!74630) b!90501))

(assert (= (and b!90501 res!74618) b!90496))

(assert (= (and b!90496 res!74626) b!90490))

(assert (= (and b!90490 res!74624) b!90495))

(assert (= (and b!90493 (not res!74625)) b!90500))

(assert (= (and b!90500 (not res!74629)) b!90497))

(assert (= start!18254 b!90498))

(assert (= start!18254 b!90499))

(declare-fun m!134945 () Bool)

(assert (=> b!90504 m!134945))

(declare-fun m!134947 () Bool)

(assert (=> b!90490 m!134947))

(assert (=> b!90490 m!134947))

(declare-fun m!134949 () Bool)

(assert (=> b!90490 m!134949))

(declare-fun m!134951 () Bool)

(assert (=> b!90499 m!134951))

(declare-fun m!134953 () Bool)

(assert (=> b!90493 m!134953))

(declare-fun m!134955 () Bool)

(assert (=> b!90493 m!134955))

(declare-fun m!134957 () Bool)

(assert (=> b!90501 m!134957))

(declare-fun m!134959 () Bool)

(assert (=> b!90497 m!134959))

(declare-fun m!134961 () Bool)

(assert (=> b!90492 m!134961))

(declare-fun m!134963 () Bool)

(assert (=> b!90489 m!134963))

(declare-fun m!134965 () Bool)

(assert (=> b!90498 m!134965))

(declare-fun m!134967 () Bool)

(assert (=> b!90494 m!134967))

(declare-fun m!134969 () Bool)

(assert (=> start!18254 m!134969))

(declare-fun m!134971 () Bool)

(assert (=> start!18254 m!134971))

(declare-fun m!134973 () Bool)

(assert (=> b!90496 m!134973))

(declare-fun m!134975 () Bool)

(assert (=> b!90505 m!134975))

(declare-fun m!134977 () Bool)

(assert (=> b!90505 m!134977))

(declare-fun m!134979 () Bool)

(assert (=> b!90495 m!134979))

(push 1)

(assert (not b!90489))

(assert (not b!90497))

(assert (not b!90504))

(assert (not b!90498))

(assert (not b!90505))

(assert (not start!18254))

(assert (not b!90494))

(assert (not b!90496))

(assert (not b!90490))

(assert (not b!90499))

(assert (not b!90501))

(assert (not b!90493))

(assert (not b!90495))

(assert (not b!90492))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!28168 () Bool)

(assert (=> d!28168 (= (array_inv!1761 (buf!2305 thiss!1152)) (bvsge (size!1915 (buf!2305 thiss!1152)) #b00000000000000000000000000000000))))

(assert (=> b!90498 d!28168))

(declare-fun b!90651 () Bool)

(declare-fun res!74772 () Bool)

(declare-fun e!59671 () Bool)

(assert (=> b!90651 (=> (not res!74772) (not e!59671))))

(assert (=> b!90651 (= res!74772 (and (bvsle (bvadd #b00000000000000000000000000000001 i!576) nBits!336) (= (size!1915 (buf!2305 (_2!4018 lt!137170))) (size!1915 (buf!2305 thiss!1151)))))))

(declare-fun b!90652 () Bool)

(declare-fun res!74777 () Bool)

(declare-fun e!59668 () Bool)

(assert (=> b!90652 (=> (not res!74777) (not e!59668))))

(declare-fun lt!137285 () tuple3!440)

(assert (=> b!90652 (= res!74777 (validate_offset_bits!1 ((_ sign_extend 32) (size!1915 (buf!2305 (_2!4020 lt!137285)))) ((_ sign_extend 32) (currentByte!4577 (_2!4020 lt!137285))) ((_ sign_extend 32) (currentBit!4572 (_2!4020 lt!137285))) ((_ sign_extend 32) (bvsub nBits!336 (_3!244 lt!137285)))))))

(assert (=> b!90652 (or (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (_3!244 lt!137285) #b10000000000000000000000000000000)) (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (bvsub nBits!336 (_3!244 lt!137285)) #b10000000000000000000000000000000)))))

(declare-fun b!90653 () Bool)

(declare-fun e!59670 () Bool)

(declare-fun lt!137280 () tuple2!7550)

(declare-fun lt!137279 () tuple2!7548)

(assert (=> b!90653 (= e!59670 (= (bitIndex!0 (size!1915 (buf!2305 (_1!4019 lt!137280))) (currentByte!4577 (_1!4019 lt!137280)) (currentBit!4572 (_1!4019 lt!137280))) (bitIndex!0 (size!1915 (buf!2305 (_2!4018 lt!137279))) (currentByte!4577 (_2!4018 lt!137279)) (currentBit!4572 (_2!4018 lt!137279)))))))

(declare-fun b!90654 () Bool)

(declare-fun res!74773 () Bool)

(assert (=> b!90654 (=> (not res!74773) (not e!59668))))

(assert (=> b!90654 (= res!74773 (and (bvsle (_3!244 lt!137285) nBits!336) (= (size!1915 (buf!2305 (_2!4020 lt!137285))) (size!1915 (buf!2305 thiss!1151)))))))

(declare-fun b!90655 () Bool)

(declare-fun res!74767 () Bool)

(assert (=> b!90655 (=> (not res!74767) (not e!59668))))

(assert (=> b!90655 (= res!74767 (invariant!0 (currentBit!4572 (_2!4020 lt!137285)) (currentByte!4577 (_2!4020 lt!137285)) (size!1915 (buf!2305 (_2!4020 lt!137285)))))))

(declare-fun d!28170 () Bool)

(assert (=> d!28170 e!59668))

(declare-fun res!74769 () Bool)

(assert (=> d!28170 (=> (not res!74769) (not e!59668))))

(assert (=> d!28170 (= res!74769 (bvsge (_3!244 lt!137285) #b00000000000000000000000000000000))))

(declare-fun e!59667 () tuple3!440)

(assert (=> d!28170 (= lt!137285 e!59667)))

(declare-fun c!5884 () Bool)

(declare-fun lt!137287 () (_ BitVec 32))

(assert (=> d!28170 (= c!5884 (bvslt lt!137287 nBits!336))))

(assert (=> d!28170 (= lt!137287 (bvadd #b00000000000000000000000000000001 i!576 #b00000000000000000000000000000001))))

(declare-fun lt!137281 () tuple2!7548)

(assert (=> d!28170 (= lt!137281 lt!137279)))

(declare-fun e!59669 () Bool)

(assert (=> d!28170 e!59669))

(declare-fun res!74778 () Bool)

(assert (=> d!28170 (=> (not res!74778) (not e!59669))))

(assert (=> d!28170 (= res!74778 (= (size!1915 (buf!2305 (_2!4018 lt!137170))) (size!1915 (buf!2305 (_2!4018 lt!137279)))))))

(declare-fun lt!137282 () Bool)

(assert (=> d!28170 (= lt!137279 (appendBit!0 (_2!4018 lt!137170) lt!137282))))

(assert (=> d!28170 (= lt!137282 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28170 e!59671))

(declare-fun res!74766 () Bool)

(assert (=> d!28170 (=> (not res!74766) (not e!59671))))

(assert (=> d!28170 (= res!74766 (bvsge (bvadd #b00000000000000000000000000000001 i!576) #b00000000000000000000000000000000))))

(assert (=> d!28170 (= (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!4018 lt!137170) (bvadd #b00000000000000000000000000000001 i!576)) lt!137285)))

(declare-fun b!90656 () Bool)

(assert (=> b!90656 (= e!59667 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!4018 lt!137281) lt!137287))))

(declare-fun b!90657 () Bool)

(assert (=> b!90657 (= e!59671 (bvslt (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!90658 () Bool)

(assert (=> b!90658 (= e!59668 (bvsge (_3!244 lt!137285) nBits!336))))

(declare-fun b!90659 () Bool)

(declare-fun res!74775 () Bool)

(assert (=> b!90659 (=> (not res!74775) (not e!59671))))

(assert (=> b!90659 (= res!74775 (= (bitIndex!0 (size!1915 (buf!2305 (_2!4018 lt!137170))) (currentByte!4577 (_2!4018 lt!137170)) (currentBit!4572 (_2!4018 lt!137170))) (bvadd (bitIndex!0 (size!1915 (buf!2305 thiss!1151)) (currentByte!4577 thiss!1151) (currentBit!4572 thiss!1151)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun b!90660 () Bool)

(declare-fun res!74776 () Bool)

(assert (=> b!90660 (=> (not res!74776) (not e!59668))))

(declare-fun lt!137286 () (_ BitVec 64))

(declare-fun lt!137288 () (_ BitVec 64))

(assert (=> b!90660 (= res!74776 (= (bitIndex!0 (size!1915 (buf!2305 (_2!4020 lt!137285))) (currentByte!4577 (_2!4020 lt!137285)) (currentBit!4572 (_2!4020 lt!137285))) (bvadd lt!137288 lt!137286)))))

(assert (=> b!90660 (or (not (= (bvand lt!137288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137286 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!137288 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!137288 lt!137286) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!90660 (= lt!137286 ((_ sign_extend 32) (_3!244 lt!137285)))))

(assert (=> b!90660 (= lt!137288 (bitIndex!0 (size!1915 (buf!2305 thiss!1151)) (currentByte!4577 thiss!1151) (currentBit!4572 thiss!1151)))))

(declare-fun b!90661 () Bool)

(declare-fun res!74774 () Bool)

(assert (=> b!90661 (=> (not res!74774) (not e!59671))))

(assert (=> b!90661 (= res!74774 (invariant!0 (currentBit!4572 (_2!4018 lt!137170)) (currentByte!4577 (_2!4018 lt!137170)) (size!1915 (buf!2305 (_2!4018 lt!137170)))))))

(declare-fun b!90662 () Bool)

(declare-fun Unit!5823 () Unit!5819)

(assert (=> b!90662 (= e!59667 (tuple3!441 Unit!5823 (_2!4018 lt!137281) lt!137287))))

(declare-fun b!90663 () Bool)

(declare-fun res!74768 () Bool)

(assert (=> b!90663 (=> (not res!74768) (not e!59669))))

(assert (=> b!90663 (= res!74768 (isPrefixOf!0 (_2!4018 lt!137170) (_2!4018 lt!137279)))))

(declare-fun b!90664 () Bool)

(declare-fun res!74771 () Bool)

(assert (=> b!90664 (=> (not res!74771) (not e!59669))))

(assert (=> b!90664 (= res!74771 (= (bitIndex!0 (size!1915 (buf!2305 (_2!4018 lt!137279))) (currentByte!4577 (_2!4018 lt!137279)) (currentBit!4572 (_2!4018 lt!137279))) (bvadd (bitIndex!0 (size!1915 (buf!2305 (_2!4018 lt!137170))) (currentByte!4577 (_2!4018 lt!137170)) (currentBit!4572 (_2!4018 lt!137170))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!90665 () Bool)

(declare-fun res!74770 () Bool)

(assert (=> b!90665 (=> (not res!74770) (not e!59671))))

(assert (=> b!90665 (= res!74770 (validate_offset_bits!1 ((_ sign_extend 32) (size!1915 (buf!2305 (_2!4018 lt!137170)))) ((_ sign_extend 32) (currentByte!4577 (_2!4018 lt!137170))) ((_ sign_extend 32) (currentBit!4572 (_2!4018 lt!137170))) ((_ sign_extend 32) (bvsub nBits!336 (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun b!90666 () Bool)

(assert (=> b!90666 (= e!59669 e!59670)))

(declare-fun res!74779 () Bool)

(assert (=> b!90666 (=> (not res!74779) (not e!59670))))

(assert (=> b!90666 (= res!74779 (and (= (_2!4019 lt!137280) lt!137282) (= (_1!4019 lt!137280) (_2!4018 lt!137279))))))

(assert (=> b!90666 (= lt!137280 (readBitPure!0 (readerFrom!0 (_2!4018 lt!137279) (currentBit!4572 (_2!4018 lt!137170)) (currentByte!4577 (_2!4018 lt!137170)))))))

(assert (= (and d!28170 res!74766) b!90661))

(assert (= (and b!90661 res!74774) b!90651))

(assert (= (and b!90651 res!74772) b!90659))

(assert (= (and b!90659 res!74775) b!90665))

(assert (= (and b!90665 res!74770) b!90657))

(assert (= (and d!28170 res!74778) b!90664))

(assert (= (and b!90664 res!74771) b!90663))

(assert (= (and b!90663 res!74768) b!90666))

(assert (= (and b!90666 res!74779) b!90653))

(assert (= (and d!28170 c!5884) b!90656))

(assert (= (and d!28170 (not c!5884)) b!90662))

(assert (= (and d!28170 res!74769) b!90655))

(assert (= (and b!90655 res!74767) b!90654))

(assert (= (and b!90654 res!74773) b!90660))

(assert (= (and b!90660 res!74776) b!90652))

(assert (= (and b!90652 res!74777) b!90658))

(declare-fun m!135035 () Bool)

(assert (=> d!28170 m!135035))

(declare-fun m!135037 () Bool)

(assert (=> b!90664 m!135037))

(assert (=> b!90664 m!134957))

(declare-fun m!135039 () Bool)

(assert (=> b!90656 m!135039))

(declare-fun m!135041 () Bool)

(assert (=> b!90653 m!135041))

(assert (=> b!90653 m!135037))

(declare-fun m!135043 () Bool)

(assert (=> b!90663 m!135043))

(declare-fun m!135045 () Bool)

(assert (=> b!90655 m!135045))

(declare-fun m!135047 () Bool)

(assert (=> b!90665 m!135047))

(declare-fun m!135049 () Bool)

(assert (=> b!90652 m!135049))

(assert (=> b!90661 m!134953))

(assert (=> b!90659 m!134957))

(assert (=> b!90659 m!134977))

(declare-fun m!135051 () Bool)

(assert (=> b!90660 m!135051))

(assert (=> b!90660 m!134977))

(declare-fun m!135053 () Bool)

(assert (=> b!90666 m!135053))

(assert (=> b!90666 m!135053))

(declare-fun m!135055 () Bool)

(assert (=> b!90666 m!135055))

(assert (=> b!90497 d!28170))

(declare-fun d!28202 () Bool)

(declare-fun res!74790 () Bool)

(declare-fun e!59677 () Bool)

(assert (=> d!28202 (=> (not res!74790) (not e!59677))))

(assert (=> d!28202 (= res!74790 (= (size!1915 (buf!2305 thiss!1152)) (size!1915 (buf!2305 (_2!4018 lt!137170)))))))

(assert (=> d!28202 (= (isPrefixOf!0 thiss!1152 (_2!4018 lt!137170)) e!59677)))

(declare-fun b!90677 () Bool)

(declare-fun res!74788 () Bool)

(assert (=> b!90677 (=> (not res!74788) (not e!59677))))

(assert (=> b!90677 (= res!74788 (bvsle (bitIndex!0 (size!1915 (buf!2305 thiss!1152)) (currentByte!4577 thiss!1152) (currentBit!4572 thiss!1152)) (bitIndex!0 (size!1915 (buf!2305 (_2!4018 lt!137170))) (currentByte!4577 (_2!4018 lt!137170)) (currentBit!4572 (_2!4018 lt!137170)))))))

(declare-fun b!90678 () Bool)

(declare-fun e!59676 () Bool)

(assert (=> b!90678 (= e!59677 e!59676)))

(declare-fun res!74789 () Bool)

(assert (=> b!90678 (=> res!74789 e!59676)))

(assert (=> b!90678 (= res!74789 (= (size!1915 (buf!2305 thiss!1152)) #b00000000000000000000000000000000))))

(declare-fun b!90679 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4246 array!4246 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!90679 (= e!59676 (arrayBitRangesEq!0 (buf!2305 thiss!1152) (buf!2305 (_2!4018 lt!137170)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1915 (buf!2305 thiss!1152)) (currentByte!4577 thiss!1152) (currentBit!4572 thiss!1152))))))

(assert (= (and d!28202 res!74790) b!90677))

(assert (= (and b!90677 res!74788) b!90678))

(assert (= (and b!90678 (not res!74789)) b!90679))

(assert (=> b!90677 m!134975))

(assert (=> b!90677 m!134957))

(assert (=> b!90679 m!134975))

(assert (=> b!90679 m!134975))

(declare-fun m!135057 () Bool)

(assert (=> b!90679 m!135057))

(assert (=> b!90496 d!28202))

(declare-fun d!28204 () Bool)

(declare-datatypes ((tuple2!7556 0))(
  ( (tuple2!7557 (_1!4023 Bool) (_2!4023 BitStream!3392)) )
))
(declare-fun lt!137301 () tuple2!7556)

(declare-fun readBit!0 (BitStream!3392) tuple2!7556)

(assert (=> d!28204 (= lt!137301 (readBit!0 (readerFrom!0 (_2!4018 lt!137170) (currentBit!4572 thiss!1152) (currentByte!4577 thiss!1152))))))

(assert (=> d!28204 (= (readBitPure!0 (readerFrom!0 (_2!4018 lt!137170) (currentBit!4572 thiss!1152) (currentByte!4577 thiss!1152))) (tuple2!7551 (_2!4023 lt!137301) (_1!4023 lt!137301)))))

(declare-fun bs!6974 () Bool)

(assert (= bs!6974 d!28204))

(assert (=> bs!6974 m!134947))

(declare-fun m!135063 () Bool)

(assert (=> bs!6974 m!135063))

(assert (=> b!90490 d!28204))

(declare-fun d!28206 () Bool)

(declare-fun e!59685 () Bool)

(assert (=> d!28206 e!59685))

(declare-fun res!74808 () Bool)

(assert (=> d!28206 (=> (not res!74808) (not e!59685))))

(assert (=> d!28206 (= res!74808 (invariant!0 (currentBit!4572 (_2!4018 lt!137170)) (currentByte!4577 (_2!4018 lt!137170)) (size!1915 (buf!2305 (_2!4018 lt!137170)))))))

(assert (=> d!28206 (= (readerFrom!0 (_2!4018 lt!137170) (currentBit!4572 thiss!1152) (currentByte!4577 thiss!1152)) (BitStream!3393 (buf!2305 (_2!4018 lt!137170)) (currentByte!4577 thiss!1152) (currentBit!4572 thiss!1152)))))

(declare-fun b!90698 () Bool)

(assert (=> b!90698 (= e!59685 (invariant!0 (currentBit!4572 thiss!1152) (currentByte!4577 thiss!1152) (size!1915 (buf!2305 (_2!4018 lt!137170)))))))

(assert (= (and d!28206 res!74808) b!90698))

(assert (=> d!28206 m!134953))

(declare-fun m!135083 () Bool)

(assert (=> b!90698 m!135083))

(assert (=> b!90490 d!28206))

(declare-fun d!28210 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!28210 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1915 (buf!2305 thiss!1152))) ((_ sign_extend 32) (currentByte!4577 thiss!1152)) ((_ sign_extend 32) (currentBit!4572 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1915 (buf!2305 thiss!1152))) ((_ sign_extend 32) (currentByte!4577 thiss!1152)) ((_ sign_extend 32) (currentBit!4572 thiss!1152))) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun bs!6975 () Bool)

(assert (= bs!6975 d!28210))

(declare-fun m!135085 () Bool)

(assert (=> bs!6975 m!135085))

(assert (=> b!90489 d!28210))

(declare-fun d!28212 () Bool)

(assert (=> d!28212 (= (inv!12 thiss!1152) (invariant!0 (currentBit!4572 thiss!1152) (currentByte!4577 thiss!1152) (size!1915 (buf!2305 thiss!1152))))))

(declare-fun bs!6976 () Bool)

(assert (= bs!6976 d!28212))

(assert (=> bs!6976 m!134945))

(assert (=> start!18254 d!28212))

(declare-fun d!28214 () Bool)

(assert (=> d!28214 (= (inv!12 thiss!1151) (invariant!0 (currentBit!4572 thiss!1151) (currentByte!4577 thiss!1151) (size!1915 (buf!2305 thiss!1151))))))

(declare-fun bs!6977 () Bool)

(assert (= bs!6977 d!28214))

(assert (=> bs!6977 m!134967))

(assert (=> start!18254 d!28214))

(declare-fun d!28216 () Bool)

(assert (=> d!28216 (= (array_inv!1761 (buf!2305 thiss!1151)) (bvsge (size!1915 (buf!2305 thiss!1151)) #b00000000000000000000000000000000))))

(assert (=> b!90499 d!28216))

(declare-fun d!28218 () Bool)

(assert (=> d!28218 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1915 (buf!2305 thiss!1151))) ((_ sign_extend 32) (currentByte!4577 thiss!1151)) ((_ sign_extend 32) (currentBit!4572 thiss!1151)) ((_ sign_extend 32) nBits!336)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1915 (buf!2305 thiss!1151))) ((_ sign_extend 32) (currentByte!4577 thiss!1151)) ((_ sign_extend 32) (currentBit!4572 thiss!1151))) ((_ sign_extend 32) nBits!336)))))

(declare-fun bs!6978 () Bool)

(assert (= bs!6978 d!28218))

(declare-fun m!135087 () Bool)

(assert (=> bs!6978 m!135087))

(assert (=> b!90492 d!28218))

(declare-fun d!28220 () Bool)

(declare-fun e!59691 () Bool)

(assert (=> d!28220 e!59691))

(declare-fun res!74821 () Bool)

(assert (=> d!28220 (=> (not res!74821) (not e!59691))))

(declare-fun lt!137337 () (_ BitVec 64))

(declare-fun lt!137336 () (_ BitVec 64))

(declare-fun lt!137338 () (_ BitVec 64))

(assert (=> d!28220 (= res!74821 (= lt!137337 (bvsub lt!137336 lt!137338)))))

(assert (=> d!28220 (or (= (bvand lt!137336 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137338 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137336 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137336 lt!137338) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28220 (= lt!137338 (remainingBits!0 ((_ sign_extend 32) (size!1915 (buf!2305 (_2!4018 lt!137170)))) ((_ sign_extend 32) (currentByte!4577 (_2!4018 lt!137170))) ((_ sign_extend 32) (currentBit!4572 (_2!4018 lt!137170)))))))

(declare-fun lt!137335 () (_ BitVec 64))

(declare-fun lt!137340 () (_ BitVec 64))

(assert (=> d!28220 (= lt!137336 (bvmul lt!137335 lt!137340))))

(assert (=> d!28220 (or (= lt!137335 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137340 (bvsdiv (bvmul lt!137335 lt!137340) lt!137335)))))

(assert (=> d!28220 (= lt!137340 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28220 (= lt!137335 ((_ sign_extend 32) (size!1915 (buf!2305 (_2!4018 lt!137170)))))))

(assert (=> d!28220 (= lt!137337 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4577 (_2!4018 lt!137170))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4572 (_2!4018 lt!137170)))))))

(assert (=> d!28220 (invariant!0 (currentBit!4572 (_2!4018 lt!137170)) (currentByte!4577 (_2!4018 lt!137170)) (size!1915 (buf!2305 (_2!4018 lt!137170))))))

(assert (=> d!28220 (= (bitIndex!0 (size!1915 (buf!2305 (_2!4018 lt!137170))) (currentByte!4577 (_2!4018 lt!137170)) (currentBit!4572 (_2!4018 lt!137170))) lt!137337)))

(declare-fun b!90709 () Bool)

(declare-fun res!74820 () Bool)

(assert (=> b!90709 (=> (not res!74820) (not e!59691))))

(assert (=> b!90709 (= res!74820 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137337))))

(declare-fun b!90710 () Bool)

(declare-fun lt!137339 () (_ BitVec 64))

(assert (=> b!90710 (= e!59691 (bvsle lt!137337 (bvmul lt!137339 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!90710 (or (= lt!137339 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137339 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137339)))))

(assert (=> b!90710 (= lt!137339 ((_ sign_extend 32) (size!1915 (buf!2305 (_2!4018 lt!137170)))))))

(assert (= (and d!28220 res!74821) b!90709))

(assert (= (and b!90709 res!74820) b!90710))

(declare-fun m!135093 () Bool)

(assert (=> d!28220 m!135093))

(assert (=> d!28220 m!134953))

(assert (=> b!90501 d!28220))

(declare-fun d!28226 () Bool)

(declare-fun e!59692 () Bool)

(assert (=> d!28226 e!59692))

(declare-fun res!74823 () Bool)

(assert (=> d!28226 (=> (not res!74823) (not e!59692))))

(declare-fun lt!137343 () (_ BitVec 64))

(declare-fun lt!137342 () (_ BitVec 64))

(declare-fun lt!137344 () (_ BitVec 64))

(assert (=> d!28226 (= res!74823 (= lt!137343 (bvsub lt!137342 lt!137344)))))

(assert (=> d!28226 (or (= (bvand lt!137342 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137344 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137342 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137342 lt!137344) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28226 (= lt!137344 (remainingBits!0 ((_ sign_extend 32) (size!1915 (buf!2305 (_1!4019 lt!137171)))) ((_ sign_extend 32) (currentByte!4577 (_1!4019 lt!137171))) ((_ sign_extend 32) (currentBit!4572 (_1!4019 lt!137171)))))))

(declare-fun lt!137341 () (_ BitVec 64))

(declare-fun lt!137346 () (_ BitVec 64))

(assert (=> d!28226 (= lt!137342 (bvmul lt!137341 lt!137346))))

(assert (=> d!28226 (or (= lt!137341 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137346 (bvsdiv (bvmul lt!137341 lt!137346) lt!137341)))))

(assert (=> d!28226 (= lt!137346 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28226 (= lt!137341 ((_ sign_extend 32) (size!1915 (buf!2305 (_1!4019 lt!137171)))))))

(assert (=> d!28226 (= lt!137343 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4577 (_1!4019 lt!137171))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4572 (_1!4019 lt!137171)))))))

(assert (=> d!28226 (invariant!0 (currentBit!4572 (_1!4019 lt!137171)) (currentByte!4577 (_1!4019 lt!137171)) (size!1915 (buf!2305 (_1!4019 lt!137171))))))

(assert (=> d!28226 (= (bitIndex!0 (size!1915 (buf!2305 (_1!4019 lt!137171))) (currentByte!4577 (_1!4019 lt!137171)) (currentBit!4572 (_1!4019 lt!137171))) lt!137343)))

(declare-fun b!90711 () Bool)

(declare-fun res!74822 () Bool)

(assert (=> b!90711 (=> (not res!74822) (not e!59692))))

(assert (=> b!90711 (= res!74822 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137343))))

(declare-fun b!90712 () Bool)

(declare-fun lt!137345 () (_ BitVec 64))

(assert (=> b!90712 (= e!59692 (bvsle lt!137343 (bvmul lt!137345 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!90712 (or (= lt!137345 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137345 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137345)))))

(assert (=> b!90712 (= lt!137345 ((_ sign_extend 32) (size!1915 (buf!2305 (_1!4019 lt!137171)))))))

(assert (= (and d!28226 res!74823) b!90711))

(assert (= (and b!90711 res!74822) b!90712))

(declare-fun m!135095 () Bool)

(assert (=> d!28226 m!135095))

(declare-fun m!135097 () Bool)

(assert (=> d!28226 m!135097))

(assert (=> b!90495 d!28226))

(declare-fun d!28228 () Bool)

(declare-fun e!59695 () Bool)

(assert (=> d!28228 e!59695))

(declare-fun res!74827 () Bool)

(assert (=> d!28228 (=> (not res!74827) (not e!59695))))

(declare-fun lt!137349 () (_ BitVec 64))

(declare-fun lt!137348 () (_ BitVec 64))

(declare-fun lt!137350 () (_ BitVec 64))

(assert (=> d!28228 (= res!74827 (= lt!137349 (bvsub lt!137348 lt!137350)))))

(assert (=> d!28228 (or (= (bvand lt!137348 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137350 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137348 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137348 lt!137350) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28228 (= lt!137350 (remainingBits!0 ((_ sign_extend 32) (size!1915 (buf!2305 thiss!1152))) ((_ sign_extend 32) (currentByte!4577 thiss!1152)) ((_ sign_extend 32) (currentBit!4572 thiss!1152))))))

(declare-fun lt!137347 () (_ BitVec 64))

(declare-fun lt!137352 () (_ BitVec 64))

(assert (=> d!28228 (= lt!137348 (bvmul lt!137347 lt!137352))))

(assert (=> d!28228 (or (= lt!137347 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137352 (bvsdiv (bvmul lt!137347 lt!137352) lt!137347)))))

(assert (=> d!28228 (= lt!137352 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28228 (= lt!137347 ((_ sign_extend 32) (size!1915 (buf!2305 thiss!1152))))))

(assert (=> d!28228 (= lt!137349 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4577 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4572 thiss!1152))))))

(assert (=> d!28228 (invariant!0 (currentBit!4572 thiss!1152) (currentByte!4577 thiss!1152) (size!1915 (buf!2305 thiss!1152)))))

(assert (=> d!28228 (= (bitIndex!0 (size!1915 (buf!2305 thiss!1152)) (currentByte!4577 thiss!1152) (currentBit!4572 thiss!1152)) lt!137349)))

(declare-fun b!90715 () Bool)

(declare-fun res!74826 () Bool)

(assert (=> b!90715 (=> (not res!74826) (not e!59695))))

(assert (=> b!90715 (= res!74826 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137349))))

(declare-fun b!90716 () Bool)

(declare-fun lt!137351 () (_ BitVec 64))

(assert (=> b!90716 (= e!59695 (bvsle lt!137349 (bvmul lt!137351 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!90716 (or (= lt!137351 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137351 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137351)))))

(assert (=> b!90716 (= lt!137351 ((_ sign_extend 32) (size!1915 (buf!2305 thiss!1152))))))

(assert (= (and d!28228 res!74827) b!90715))

(assert (= (and b!90715 res!74826) b!90716))

(assert (=> d!28228 m!135085))

(assert (=> d!28228 m!134945))

(assert (=> b!90505 d!28228))

(declare-fun d!28230 () Bool)

(declare-fun e!59696 () Bool)

(assert (=> d!28230 e!59696))

(declare-fun res!74829 () Bool)

(assert (=> d!28230 (=> (not res!74829) (not e!59696))))

(declare-fun lt!137355 () (_ BitVec 64))

(declare-fun lt!137356 () (_ BitVec 64))

(declare-fun lt!137354 () (_ BitVec 64))

(assert (=> d!28230 (= res!74829 (= lt!137355 (bvsub lt!137354 lt!137356)))))

(assert (=> d!28230 (or (= (bvand lt!137354 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137356 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137354 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137354 lt!137356) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28230 (= lt!137356 (remainingBits!0 ((_ sign_extend 32) (size!1915 (buf!2305 thiss!1151))) ((_ sign_extend 32) (currentByte!4577 thiss!1151)) ((_ sign_extend 32) (currentBit!4572 thiss!1151))))))

(declare-fun lt!137353 () (_ BitVec 64))

(declare-fun lt!137358 () (_ BitVec 64))

(assert (=> d!28230 (= lt!137354 (bvmul lt!137353 lt!137358))))

(assert (=> d!28230 (or (= lt!137353 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137358 (bvsdiv (bvmul lt!137353 lt!137358) lt!137353)))))

(assert (=> d!28230 (= lt!137358 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28230 (= lt!137353 ((_ sign_extend 32) (size!1915 (buf!2305 thiss!1151))))))

(assert (=> d!28230 (= lt!137355 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4577 thiss!1151)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4572 thiss!1151))))))

(assert (=> d!28230 (invariant!0 (currentBit!4572 thiss!1151) (currentByte!4577 thiss!1151) (size!1915 (buf!2305 thiss!1151)))))

(assert (=> d!28230 (= (bitIndex!0 (size!1915 (buf!2305 thiss!1151)) (currentByte!4577 thiss!1151) (currentBit!4572 thiss!1151)) lt!137355)))

(declare-fun b!90717 () Bool)

(declare-fun res!74828 () Bool)

(assert (=> b!90717 (=> (not res!74828) (not e!59696))))

(assert (=> b!90717 (= res!74828 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137355))))

(declare-fun b!90718 () Bool)

(declare-fun lt!137357 () (_ BitVec 64))

(assert (=> b!90718 (= e!59696 (bvsle lt!137355 (bvmul lt!137357 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!90718 (or (= lt!137357 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137357 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137357)))))

(assert (=> b!90718 (= lt!137357 ((_ sign_extend 32) (size!1915 (buf!2305 thiss!1151))))))

(assert (= (and d!28230 res!74829) b!90717))

(assert (= (and b!90717 res!74828) b!90718))

(assert (=> d!28230 m!135087))

(assert (=> d!28230 m!134967))

(assert (=> b!90505 d!28230))

(declare-fun d!28232 () Bool)

(assert (=> d!28232 (= (invariant!0 (currentBit!4572 thiss!1151) (currentByte!4577 thiss!1151) (size!1915 (buf!2305 thiss!1151))) (and (bvsge (currentBit!4572 thiss!1151) #b00000000000000000000000000000000) (bvslt (currentBit!4572 thiss!1151) #b00000000000000000000000000001000) (bvsge (currentByte!4577 thiss!1151) #b00000000000000000000000000000000) (or (bvslt (currentByte!4577 thiss!1151) (size!1915 (buf!2305 thiss!1151))) (and (= (currentBit!4572 thiss!1151) #b00000000000000000000000000000000) (= (currentByte!4577 thiss!1151) (size!1915 (buf!2305 thiss!1151)))))))))

(assert (=> b!90494 d!28232))

(declare-fun d!28236 () Bool)

(assert (=> d!28236 (= (invariant!0 (currentBit!4572 thiss!1152) (currentByte!4577 thiss!1152) (size!1915 (buf!2305 thiss!1152))) (and (bvsge (currentBit!4572 thiss!1152) #b00000000000000000000000000000000) (bvslt (currentBit!4572 thiss!1152) #b00000000000000000000000000001000) (bvsge (currentByte!4577 thiss!1152) #b00000000000000000000000000000000) (or (bvslt (currentByte!4577 thiss!1152) (size!1915 (buf!2305 thiss!1152))) (and (= (currentBit!4572 thiss!1152) #b00000000000000000000000000000000) (= (currentByte!4577 thiss!1152) (size!1915 (buf!2305 thiss!1152)))))))))

(assert (=> b!90504 d!28236))

(declare-fun d!28238 () Bool)

(assert (=> d!28238 (= (invariant!0 (currentBit!4572 (_2!4018 lt!137170)) (currentByte!4577 (_2!4018 lt!137170)) (size!1915 (buf!2305 (_2!4018 lt!137170)))) (and (bvsge (currentBit!4572 (_2!4018 lt!137170)) #b00000000000000000000000000000000) (bvslt (currentBit!4572 (_2!4018 lt!137170)) #b00000000000000000000000000001000) (bvsge (currentByte!4577 (_2!4018 lt!137170)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4577 (_2!4018 lt!137170)) (size!1915 (buf!2305 (_2!4018 lt!137170)))) (and (= (currentBit!4572 (_2!4018 lt!137170)) #b00000000000000000000000000000000) (= (currentByte!4577 (_2!4018 lt!137170)) (size!1915 (buf!2305 (_2!4018 lt!137170))))))))))

(assert (=> b!90493 d!28238))

(declare-fun d!28240 () Bool)

(declare-fun e!59711 () Bool)

(assert (=> d!28240 e!59711))

(declare-fun res!74854 () Bool)

(assert (=> d!28240 (=> (not res!74854) (not e!59711))))

(declare-fun lt!137388 () tuple2!7548)

(assert (=> d!28240 (= res!74854 (= (size!1915 (buf!2305 thiss!1152)) (size!1915 (buf!2305 (_2!4018 lt!137388)))))))

(declare-fun choose!16 (BitStream!3392 Bool) tuple2!7548)

(assert (=> d!28240 (= lt!137388 (choose!16 thiss!1152 lt!137174))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!28240 (validate_offset_bit!0 ((_ sign_extend 32) (size!1915 (buf!2305 thiss!1152))) ((_ sign_extend 32) (currentByte!4577 thiss!1152)) ((_ sign_extend 32) (currentBit!4572 thiss!1152)))))

(assert (=> d!28240 (= (appendBit!0 thiss!1152 lt!137174) lt!137388)))

(declare-fun b!90746 () Bool)

(declare-fun e!59712 () Bool)

(assert (=> b!90746 (= e!59711 e!59712)))

(declare-fun res!74856 () Bool)

(assert (=> b!90746 (=> (not res!74856) (not e!59712))))

(declare-fun lt!137387 () tuple2!7550)

(assert (=> b!90746 (= res!74856 (and (= (_2!4019 lt!137387) lt!137174) (= (_1!4019 lt!137387) (_2!4018 lt!137388))))))

(assert (=> b!90746 (= lt!137387 (readBitPure!0 (readerFrom!0 (_2!4018 lt!137388) (currentBit!4572 thiss!1152) (currentByte!4577 thiss!1152))))))

(declare-fun b!90745 () Bool)

(declare-fun res!74857 () Bool)

(assert (=> b!90745 (=> (not res!74857) (not e!59711))))

(assert (=> b!90745 (= res!74857 (isPrefixOf!0 thiss!1152 (_2!4018 lt!137388)))))

(declare-fun b!90747 () Bool)

(assert (=> b!90747 (= e!59712 (= (bitIndex!0 (size!1915 (buf!2305 (_1!4019 lt!137387))) (currentByte!4577 (_1!4019 lt!137387)) (currentBit!4572 (_1!4019 lt!137387))) (bitIndex!0 (size!1915 (buf!2305 (_2!4018 lt!137388))) (currentByte!4577 (_2!4018 lt!137388)) (currentBit!4572 (_2!4018 lt!137388)))))))

(declare-fun b!90744 () Bool)

(declare-fun res!74855 () Bool)

(assert (=> b!90744 (=> (not res!74855) (not e!59711))))

(declare-fun lt!137385 () (_ BitVec 64))

(declare-fun lt!137386 () (_ BitVec 64))

(assert (=> b!90744 (= res!74855 (= (bitIndex!0 (size!1915 (buf!2305 (_2!4018 lt!137388))) (currentByte!4577 (_2!4018 lt!137388)) (currentBit!4572 (_2!4018 lt!137388))) (bvadd lt!137386 lt!137385)))))

(assert (=> b!90744 (or (not (= (bvand lt!137386 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137385 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!137386 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!137386 lt!137385) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!90744 (= lt!137385 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!90744 (= lt!137386 (bitIndex!0 (size!1915 (buf!2305 thiss!1152)) (currentByte!4577 thiss!1152) (currentBit!4572 thiss!1152)))))

(assert (= (and d!28240 res!74854) b!90744))

(assert (= (and b!90744 res!74855) b!90745))

(assert (= (and b!90745 res!74857) b!90746))

(assert (= (and b!90746 res!74856) b!90747))

(declare-fun m!135109 () Bool)

(assert (=> d!28240 m!135109))

(declare-fun m!135111 () Bool)

(assert (=> d!28240 m!135111))

(declare-fun m!135113 () Bool)

(assert (=> b!90747 m!135113))

(declare-fun m!135115 () Bool)

(assert (=> b!90747 m!135115))

(declare-fun m!135117 () Bool)

(assert (=> b!90746 m!135117))

(assert (=> b!90746 m!135117))

(declare-fun m!135119 () Bool)

(assert (=> b!90746 m!135119))

(assert (=> b!90744 m!135115))

(assert (=> b!90744 m!134975))

(declare-fun m!135121 () Bool)

(assert (=> b!90745 m!135121))

(assert (=> b!90493 d!28240))

(push 1)

(assert (not d!28240))

(assert (not d!28206))

(assert (not b!90664))

(assert (not d!28230))

(assert (not b!90677))

(assert (not b!90747))

(assert (not b!90660))

(assert (not b!90653))

(assert (not d!28210))

(assert (not b!90666))

(assert (not d!28220))

(assert (not b!90665))

(assert (not d!28204))

(assert (not b!90679))

(assert (not b!90656))

(assert (not d!28212))

(assert (not b!90659))

(assert (not d!28228))

(assert (not b!90652))

(assert (not b!90655))

(assert (not b!90698))

(assert (not b!90744))

(assert (not b!90663))

(assert (not d!28226))

(assert (not b!90661))

(assert (not b!90746))

(assert (not b!90745))

(assert (not d!28214))

(assert (not d!28170))

(assert (not d!28218))

(check-sat)

(pop 1)

(push 1)

(check-sat)

