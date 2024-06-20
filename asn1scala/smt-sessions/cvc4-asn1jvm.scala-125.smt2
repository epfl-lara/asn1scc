; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3096 () Bool)

(assert start!3096)

(declare-fun b!14106 () Bool)

(declare-fun e!8696 () Bool)

(declare-datatypes ((array!790 0))(
  ( (array!791 (arr!768 (Array (_ BitVec 32) (_ BitVec 8))) (size!339 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!638 0))(
  ( (BitStream!639 (buf!690 array!790) (currentByte!1822 (_ BitVec 32)) (currentBit!1817 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!1660 0))(
  ( (tuple2!1661 (_1!885 BitStream!638) (_2!885 Bool)) )
))
(declare-fun lt!21751 () tuple2!1660)

(declare-fun lt!21748 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!14106 (= e!8696 (= (bitIndex!0 (size!339 (buf!690 (_1!885 lt!21751))) (currentByte!1822 (_1!885 lt!21751)) (currentBit!1817 (_1!885 lt!21751))) lt!21748))))

(declare-fun b!14108 () Bool)

(declare-fun e!8694 () Bool)

(assert (=> b!14108 (= e!8694 e!8696)))

(declare-fun res!13381 () Bool)

(assert (=> b!14108 (=> (not res!13381) (not e!8696))))

(declare-datatypes ((Unit!1143 0))(
  ( (Unit!1144) )
))
(declare-datatypes ((tuple2!1662 0))(
  ( (tuple2!1663 (_1!886 Unit!1143) (_2!886 BitStream!638)) )
))
(declare-fun lt!21749 () tuple2!1662)

(assert (=> b!14108 (= res!13381 (and (not (_2!885 lt!21751)) (= (_1!885 lt!21751) (_2!886 lt!21749))))))

(declare-fun thiss!957 () BitStream!638)

(declare-fun readBitPure!0 (BitStream!638) tuple2!1660)

(declare-fun readerFrom!0 (BitStream!638 (_ BitVec 32) (_ BitVec 32)) BitStream!638)

(assert (=> b!14108 (= lt!21751 (readBitPure!0 (readerFrom!0 (_2!886 lt!21749) (currentBit!1817 thiss!957) (currentByte!1822 thiss!957))))))

(declare-fun b!14109 () Bool)

(declare-fun e!8690 () Bool)

(declare-fun e!8693 () Bool)

(assert (=> b!14109 (= e!8690 (not e!8693))))

(declare-fun res!13380 () Bool)

(assert (=> b!14109 (=> res!13380 e!8693)))

(assert (=> b!14109 (= res!13380 (not (= (size!339 (buf!690 (_2!886 lt!21749))) (size!339 (buf!690 thiss!957)))))))

(declare-fun e!8695 () Bool)

(assert (=> b!14109 e!8695))

(declare-fun res!13383 () Bool)

(assert (=> b!14109 (=> (not res!13383) (not e!8695))))

(assert (=> b!14109 (= res!13383 (= (size!339 (buf!690 thiss!957)) (size!339 (buf!690 (_2!886 lt!21749)))))))

(declare-fun appendBit!0 (BitStream!638 Bool) tuple2!1662)

(assert (=> b!14109 (= lt!21749 (appendBit!0 thiss!957 false))))

(declare-fun b!14110 () Bool)

(declare-fun lt!21752 () (_ BitVec 64))

(declare-fun lt!21750 () (_ BitVec 64))

(assert (=> b!14110 (= e!8693 (or (not (= lt!21752 #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!21752 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!21750) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!14110 (= lt!21752 (bvand lt!21750 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!14110 (= lt!21750 (bitIndex!0 (size!339 (buf!690 thiss!957)) (currentByte!1822 thiss!957) (currentBit!1817 thiss!957)))))

(declare-fun b!14111 () Bool)

(declare-fun e!8691 () Bool)

(declare-fun array_inv!328 (array!790) Bool)

(assert (=> b!14111 (= e!8691 (array_inv!328 (buf!690 thiss!957)))))

(declare-fun b!14112 () Bool)

(assert (=> b!14112 (= e!8695 e!8694)))

(declare-fun res!13384 () Bool)

(assert (=> b!14112 (=> (not res!13384) (not e!8694))))

(declare-fun lt!21747 () (_ BitVec 64))

(assert (=> b!14112 (= res!13384 (= lt!21748 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!21747)))))

(assert (=> b!14112 (= lt!21748 (bitIndex!0 (size!339 (buf!690 (_2!886 lt!21749))) (currentByte!1822 (_2!886 lt!21749)) (currentBit!1817 (_2!886 lt!21749))))))

(assert (=> b!14112 (= lt!21747 (bitIndex!0 (size!339 (buf!690 thiss!957)) (currentByte!1822 thiss!957) (currentBit!1817 thiss!957)))))

(declare-fun b!14107 () Bool)

(declare-fun res!13379 () Bool)

(assert (=> b!14107 (=> (not res!13379) (not e!8694))))

(declare-fun isPrefixOf!0 (BitStream!638 BitStream!638) Bool)

(assert (=> b!14107 (= res!13379 (isPrefixOf!0 thiss!957 (_2!886 lt!21749)))))

(declare-fun res!13382 () Bool)

(assert (=> start!3096 (=> (not res!13382) (not e!8690))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!3096 (= res!13382 (validate_offset_bit!0 ((_ sign_extend 32) (size!339 (buf!690 thiss!957))) ((_ sign_extend 32) (currentByte!1822 thiss!957)) ((_ sign_extend 32) (currentBit!1817 thiss!957))))))

(assert (=> start!3096 e!8690))

(declare-fun inv!12 (BitStream!638) Bool)

(assert (=> start!3096 (and (inv!12 thiss!957) e!8691)))

(assert (= (and start!3096 res!13382) b!14109))

(assert (= (and b!14109 res!13383) b!14112))

(assert (= (and b!14112 res!13384) b!14107))

(assert (= (and b!14107 res!13379) b!14108))

(assert (= (and b!14108 res!13381) b!14106))

(assert (= (and b!14109 (not res!13380)) b!14110))

(assert (= start!3096 b!14111))

(declare-fun m!20617 () Bool)

(assert (=> b!14112 m!20617))

(declare-fun m!20619 () Bool)

(assert (=> b!14112 m!20619))

(declare-fun m!20621 () Bool)

(assert (=> b!14108 m!20621))

(assert (=> b!14108 m!20621))

(declare-fun m!20623 () Bool)

(assert (=> b!14108 m!20623))

(declare-fun m!20625 () Bool)

(assert (=> start!3096 m!20625))

(declare-fun m!20627 () Bool)

(assert (=> start!3096 m!20627))

(assert (=> b!14110 m!20619))

(declare-fun m!20629 () Bool)

(assert (=> b!14107 m!20629))

(declare-fun m!20631 () Bool)

(assert (=> b!14111 m!20631))

(declare-fun m!20633 () Bool)

(assert (=> b!14109 m!20633))

(declare-fun m!20635 () Bool)

(assert (=> b!14106 m!20635))

(push 1)

(assert (not b!14110))

(assert (not start!3096))

(assert (not b!14108))

(assert (not b!14109))

(assert (not b!14112))

(assert (not b!14107))

(assert (not b!14111))

(assert (not b!14106))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!4580 () Bool)

(assert (=> d!4580 (= (array_inv!328 (buf!690 thiss!957)) (bvsge (size!339 (buf!690 thiss!957)) #b00000000000000000000000000000000))))

(assert (=> b!14111 d!4580))

(declare-fun d!4582 () Bool)

(declare-fun e!8710 () Bool)

(assert (=> d!4582 e!8710))

(declare-fun res!13412 () Bool)

(assert (=> d!4582 (=> (not res!13412) (not e!8710))))

(declare-fun lt!21811 () (_ BitVec 64))

(declare-fun lt!21810 () (_ BitVec 64))

(declare-fun lt!21812 () (_ BitVec 64))

(assert (=> d!4582 (= res!13412 (= lt!21810 (bvsub lt!21812 lt!21811)))))

(assert (=> d!4582 (or (= (bvand lt!21812 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21811 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21812 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21812 lt!21811) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!4582 (= lt!21811 (remainingBits!0 ((_ sign_extend 32) (size!339 (buf!690 (_1!885 lt!21751)))) ((_ sign_extend 32) (currentByte!1822 (_1!885 lt!21751))) ((_ sign_extend 32) (currentBit!1817 (_1!885 lt!21751)))))))

(declare-fun lt!21808 () (_ BitVec 64))

(declare-fun lt!21807 () (_ BitVec 64))

(assert (=> d!4582 (= lt!21812 (bvmul lt!21808 lt!21807))))

(assert (=> d!4582 (or (= lt!21808 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21807 (bvsdiv (bvmul lt!21808 lt!21807) lt!21808)))))

(assert (=> d!4582 (= lt!21807 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4582 (= lt!21808 ((_ sign_extend 32) (size!339 (buf!690 (_1!885 lt!21751)))))))

(assert (=> d!4582 (= lt!21810 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1822 (_1!885 lt!21751))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1817 (_1!885 lt!21751)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!4582 (invariant!0 (currentBit!1817 (_1!885 lt!21751)) (currentByte!1822 (_1!885 lt!21751)) (size!339 (buf!690 (_1!885 lt!21751))))))

(assert (=> d!4582 (= (bitIndex!0 (size!339 (buf!690 (_1!885 lt!21751))) (currentByte!1822 (_1!885 lt!21751)) (currentBit!1817 (_1!885 lt!21751))) lt!21810)))

(declare-fun b!14140 () Bool)

(declare-fun res!13411 () Bool)

(assert (=> b!14140 (=> (not res!13411) (not e!8710))))

(assert (=> b!14140 (= res!13411 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21810))))

(declare-fun b!14141 () Bool)

(declare-fun lt!21809 () (_ BitVec 64))

(assert (=> b!14141 (= e!8710 (bvsle lt!21810 (bvmul lt!21809 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!14141 (or (= lt!21809 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21809 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21809)))))

(assert (=> b!14141 (= lt!21809 ((_ sign_extend 32) (size!339 (buf!690 (_1!885 lt!21751)))))))

(assert (= (and d!4582 res!13412) b!14140))

(assert (= (and b!14140 res!13411) b!14141))

(declare-fun m!20657 () Bool)

(assert (=> d!4582 m!20657))

(declare-fun m!20659 () Bool)

(assert (=> d!4582 m!20659))

(assert (=> b!14106 d!4582))

(declare-fun b!14190 () Bool)

(declare-fun res!13461 () Bool)

(declare-fun e!8739 () Bool)

(assert (=> b!14190 (=> (not res!13461) (not e!8739))))

(declare-fun lt!21872 () tuple2!1662)

(assert (=> b!14190 (= res!13461 (isPrefixOf!0 thiss!957 (_2!886 lt!21872)))))

(declare-fun b!14189 () Bool)

(declare-fun res!13460 () Bool)

(assert (=> b!14189 (=> (not res!13460) (not e!8739))))

(declare-fun lt!21869 () (_ BitVec 64))

(declare-fun lt!21870 () (_ BitVec 64))

(assert (=> b!14189 (= res!13460 (= (bitIndex!0 (size!339 (buf!690 (_2!886 lt!21872))) (currentByte!1822 (_2!886 lt!21872)) (currentBit!1817 (_2!886 lt!21872))) (bvadd lt!21870 lt!21869)))))

(assert (=> b!14189 (or (not (= (bvand lt!21870 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21869 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!21870 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!21870 lt!21869) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!14189 (= lt!21869 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!14189 (= lt!21870 (bitIndex!0 (size!339 (buf!690 thiss!957)) (currentByte!1822 thiss!957) (currentBit!1817 thiss!957)))))

(declare-fun b!14192 () Bool)

(declare-fun e!8738 () Bool)

(declare-fun lt!21871 () tuple2!1660)

(assert (=> b!14192 (= e!8738 (= (bitIndex!0 (size!339 (buf!690 (_1!885 lt!21871))) (currentByte!1822 (_1!885 lt!21871)) (currentBit!1817 (_1!885 lt!21871))) (bitIndex!0 (size!339 (buf!690 (_2!886 lt!21872))) (currentByte!1822 (_2!886 lt!21872)) (currentBit!1817 (_2!886 lt!21872)))))))

(declare-fun b!14191 () Bool)

(assert (=> b!14191 (= e!8739 e!8738)))

(declare-fun res!13462 () Bool)

(assert (=> b!14191 (=> (not res!13462) (not e!8738))))

(assert (=> b!14191 (= res!13462 (and (= (_2!885 lt!21871) false) (= (_1!885 lt!21871) (_2!886 lt!21872))))))

(assert (=> b!14191 (= lt!21871 (readBitPure!0 (readerFrom!0 (_2!886 lt!21872) (currentBit!1817 thiss!957) (currentByte!1822 thiss!957))))))

(declare-fun d!4592 () Bool)

(assert (=> d!4592 e!8739))

(declare-fun res!13463 () Bool)

(assert (=> d!4592 (=> (not res!13463) (not e!8739))))

(assert (=> d!4592 (= res!13463 (= (size!339 (buf!690 thiss!957)) (size!339 (buf!690 (_2!886 lt!21872)))))))

(declare-fun choose!16 (BitStream!638 Bool) tuple2!1662)

(assert (=> d!4592 (= lt!21872 (choose!16 thiss!957 false))))

(assert (=> d!4592 (validate_offset_bit!0 ((_ sign_extend 32) (size!339 (buf!690 thiss!957))) ((_ sign_extend 32) (currentByte!1822 thiss!957)) ((_ sign_extend 32) (currentBit!1817 thiss!957)))))

(assert (=> d!4592 (= (appendBit!0 thiss!957 false) lt!21872)))

(assert (= (and d!4592 res!13463) b!14189))

(assert (= (and b!14189 res!13460) b!14190))

(assert (= (and b!14190 res!13461) b!14191))

(assert (= (and b!14191 res!13462) b!14192))

(declare-fun m!20699 () Bool)

(assert (=> b!14189 m!20699))

(assert (=> b!14189 m!20619))

(declare-fun m!20701 () Bool)

(assert (=> b!14190 m!20701))

(declare-fun m!20703 () Bool)

(assert (=> b!14192 m!20703))

(assert (=> b!14192 m!20699))

(declare-fun m!20705 () Bool)

(assert (=> b!14191 m!20705))

(assert (=> b!14191 m!20705))

(declare-fun m!20707 () Bool)

(assert (=> b!14191 m!20707))

(declare-fun m!20709 () Bool)

(assert (=> d!4592 m!20709))

(assert (=> d!4592 m!20625))

(assert (=> b!14109 d!4592))

(declare-fun d!4620 () Bool)

(declare-fun e!8740 () Bool)

(assert (=> d!4620 e!8740))

(declare-fun res!13465 () Bool)

(assert (=> d!4620 (=> (not res!13465) (not e!8740))))

(declare-fun lt!21877 () (_ BitVec 64))

(declare-fun lt!21878 () (_ BitVec 64))

(declare-fun lt!21876 () (_ BitVec 64))

(assert (=> d!4620 (= res!13465 (= lt!21876 (bvsub lt!21878 lt!21877)))))

(assert (=> d!4620 (or (= (bvand lt!21878 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21877 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21878 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21878 lt!21877) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4620 (= lt!21877 (remainingBits!0 ((_ sign_extend 32) (size!339 (buf!690 thiss!957))) ((_ sign_extend 32) (currentByte!1822 thiss!957)) ((_ sign_extend 32) (currentBit!1817 thiss!957))))))

(declare-fun lt!21874 () (_ BitVec 64))

(declare-fun lt!21873 () (_ BitVec 64))

(assert (=> d!4620 (= lt!21878 (bvmul lt!21874 lt!21873))))

(assert (=> d!4620 (or (= lt!21874 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21873 (bvsdiv (bvmul lt!21874 lt!21873) lt!21874)))))

(assert (=> d!4620 (= lt!21873 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4620 (= lt!21874 ((_ sign_extend 32) (size!339 (buf!690 thiss!957))))))

(assert (=> d!4620 (= lt!21876 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1822 thiss!957)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1817 thiss!957))))))

(assert (=> d!4620 (invariant!0 (currentBit!1817 thiss!957) (currentByte!1822 thiss!957) (size!339 (buf!690 thiss!957)))))

(assert (=> d!4620 (= (bitIndex!0 (size!339 (buf!690 thiss!957)) (currentByte!1822 thiss!957) (currentBit!1817 thiss!957)) lt!21876)))

(declare-fun b!14193 () Bool)

(declare-fun res!13464 () Bool)

(assert (=> b!14193 (=> (not res!13464) (not e!8740))))

(assert (=> b!14193 (= res!13464 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21876))))

(declare-fun b!14194 () Bool)

(declare-fun lt!21875 () (_ BitVec 64))

(assert (=> b!14194 (= e!8740 (bvsle lt!21876 (bvmul lt!21875 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!14194 (or (= lt!21875 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21875 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21875)))))

(assert (=> b!14194 (= lt!21875 ((_ sign_extend 32) (size!339 (buf!690 thiss!957))))))

(assert (= (and d!4620 res!13465) b!14193))

(assert (= (and b!14193 res!13464) b!14194))

(declare-fun m!20711 () Bool)

(assert (=> d!4620 m!20711))

(declare-fun m!20713 () Bool)

(assert (=> d!4620 m!20713))

(assert (=> b!14110 d!4620))

(declare-fun d!4622 () Bool)

(declare-datatypes ((tuple2!1668 0))(
  ( (tuple2!1669 (_1!889 Bool) (_2!889 BitStream!638)) )
))
(declare-fun lt!21881 () tuple2!1668)

(declare-fun readBit!0 (BitStream!638) tuple2!1668)

(assert (=> d!4622 (= lt!21881 (readBit!0 (readerFrom!0 (_2!886 lt!21749) (currentBit!1817 thiss!957) (currentByte!1822 thiss!957))))))

(assert (=> d!4622 (= (readBitPure!0 (readerFrom!0 (_2!886 lt!21749) (currentBit!1817 thiss!957) (currentByte!1822 thiss!957))) (tuple2!1661 (_2!889 lt!21881) (_1!889 lt!21881)))))

(declare-fun bs!1261 () Bool)

(assert (= bs!1261 d!4622))

(assert (=> bs!1261 m!20621))

(declare-fun m!20717 () Bool)

(assert (=> bs!1261 m!20717))

(assert (=> b!14108 d!4622))

(declare-fun d!4624 () Bool)

(declare-fun e!8749 () Bool)

(assert (=> d!4624 e!8749))

(declare-fun res!13478 () Bool)

(assert (=> d!4624 (=> (not res!13478) (not e!8749))))

(assert (=> d!4624 (= res!13478 (invariant!0 (currentBit!1817 (_2!886 lt!21749)) (currentByte!1822 (_2!886 lt!21749)) (size!339 (buf!690 (_2!886 lt!21749)))))))

(assert (=> d!4624 (= (readerFrom!0 (_2!886 lt!21749) (currentBit!1817 thiss!957) (currentByte!1822 thiss!957)) (BitStream!639 (buf!690 (_2!886 lt!21749)) (currentByte!1822 thiss!957) (currentBit!1817 thiss!957)))))

(declare-fun b!14206 () Bool)

(assert (=> b!14206 (= e!8749 (invariant!0 (currentBit!1817 thiss!957) (currentByte!1822 thiss!957) (size!339 (buf!690 (_2!886 lt!21749)))))))

(assert (= (and d!4624 res!13478) b!14206))

(declare-fun m!20719 () Bool)

(assert (=> d!4624 m!20719))

(declare-fun m!20721 () Bool)

(assert (=> b!14206 m!20721))

(assert (=> b!14108 d!4624))

(declare-fun d!4626 () Bool)

(assert (=> d!4626 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!339 (buf!690 thiss!957))) ((_ sign_extend 32) (currentByte!1822 thiss!957)) ((_ sign_extend 32) (currentBit!1817 thiss!957))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!339 (buf!690 thiss!957))) ((_ sign_extend 32) (currentByte!1822 thiss!957)) ((_ sign_extend 32) (currentBit!1817 thiss!957))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!1262 () Bool)

(assert (= bs!1262 d!4626))

(assert (=> bs!1262 m!20711))

(assert (=> start!3096 d!4626))

(declare-fun d!4628 () Bool)

(assert (=> d!4628 (= (inv!12 thiss!957) (invariant!0 (currentBit!1817 thiss!957) (currentByte!1822 thiss!957) (size!339 (buf!690 thiss!957))))))

(declare-fun bs!1263 () Bool)

(assert (= bs!1263 d!4628))

(assert (=> bs!1263 m!20713))

(assert (=> start!3096 d!4628))

(declare-fun d!4630 () Bool)

(declare-fun e!8750 () Bool)

(assert (=> d!4630 e!8750))

(declare-fun res!13480 () Bool)

(assert (=> d!4630 (=> (not res!13480) (not e!8750))))

(declare-fun lt!21887 () (_ BitVec 64))

(declare-fun lt!21886 () (_ BitVec 64))

(declare-fun lt!21885 () (_ BitVec 64))

(assert (=> d!4630 (= res!13480 (= lt!21885 (bvsub lt!21887 lt!21886)))))

(assert (=> d!4630 (or (= (bvand lt!21887 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21886 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21887 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21887 lt!21886) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4630 (= lt!21886 (remainingBits!0 ((_ sign_extend 32) (size!339 (buf!690 (_2!886 lt!21749)))) ((_ sign_extend 32) (currentByte!1822 (_2!886 lt!21749))) ((_ sign_extend 32) (currentBit!1817 (_2!886 lt!21749)))))))

(declare-fun lt!21883 () (_ BitVec 64))

(declare-fun lt!21882 () (_ BitVec 64))

(assert (=> d!4630 (= lt!21887 (bvmul lt!21883 lt!21882))))

(assert (=> d!4630 (or (= lt!21883 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21882 (bvsdiv (bvmul lt!21883 lt!21882) lt!21883)))))

(assert (=> d!4630 (= lt!21882 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4630 (= lt!21883 ((_ sign_extend 32) (size!339 (buf!690 (_2!886 lt!21749)))))))

(assert (=> d!4630 (= lt!21885 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1822 (_2!886 lt!21749))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1817 (_2!886 lt!21749)))))))

(assert (=> d!4630 (invariant!0 (currentBit!1817 (_2!886 lt!21749)) (currentByte!1822 (_2!886 lt!21749)) (size!339 (buf!690 (_2!886 lt!21749))))))

(assert (=> d!4630 (= (bitIndex!0 (size!339 (buf!690 (_2!886 lt!21749))) (currentByte!1822 (_2!886 lt!21749)) (currentBit!1817 (_2!886 lt!21749))) lt!21885)))

(declare-fun b!14207 () Bool)

(declare-fun res!13479 () Bool)

(assert (=> b!14207 (=> (not res!13479) (not e!8750))))

(assert (=> b!14207 (= res!13479 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21885))))

(declare-fun b!14208 () Bool)

(declare-fun lt!21884 () (_ BitVec 64))

(assert (=> b!14208 (= e!8750 (bvsle lt!21885 (bvmul lt!21884 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!14208 (or (= lt!21884 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21884 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21884)))))

(assert (=> b!14208 (= lt!21884 ((_ sign_extend 32) (size!339 (buf!690 (_2!886 lt!21749)))))))

(assert (= (and d!4630 res!13480) b!14207))

(assert (= (and b!14207 res!13479) b!14208))

(declare-fun m!20723 () Bool)

(assert (=> d!4630 m!20723))

(assert (=> d!4630 m!20719))

(assert (=> b!14112 d!4630))

(assert (=> b!14112 d!4620))

(declare-fun d!4632 () Bool)

(declare-fun res!13489 () Bool)

(declare-fun e!8755 () Bool)

(assert (=> d!4632 (=> (not res!13489) (not e!8755))))

(assert (=> d!4632 (= res!13489 (= (size!339 (buf!690 thiss!957)) (size!339 (buf!690 (_2!886 lt!21749)))))))

(assert (=> d!4632 (= (isPrefixOf!0 thiss!957 (_2!886 lt!21749)) e!8755)))

(declare-fun b!14215 () Bool)

(declare-fun res!13488 () Bool)

(assert (=> b!14215 (=> (not res!13488) (not e!8755))))

(assert (=> b!14215 (= res!13488 (bvsle (bitIndex!0 (size!339 (buf!690 thiss!957)) (currentByte!1822 thiss!957) (currentBit!1817 thiss!957)) (bitIndex!0 (size!339 (buf!690 (_2!886 lt!21749))) (currentByte!1822 (_2!886 lt!21749)) (currentBit!1817 (_2!886 lt!21749)))))))

(declare-fun b!14216 () Bool)

(declare-fun e!8756 () Bool)

(assert (=> b!14216 (= e!8755 e!8756)))

(declare-fun res!13487 () Bool)

(assert (=> b!14216 (=> res!13487 e!8756)))

(assert (=> b!14216 (= res!13487 (= (size!339 (buf!690 thiss!957)) #b00000000000000000000000000000000))))

(declare-fun b!14217 () Bool)

(declare-fun arrayBitRangesEq!0 (array!790 array!790 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!14217 (= e!8756 (arrayBitRangesEq!0 (buf!690 thiss!957) (buf!690 (_2!886 lt!21749)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!339 (buf!690 thiss!957)) (currentByte!1822 thiss!957) (currentBit!1817 thiss!957))))))

(assert (= (and d!4632 res!13489) b!14215))

(assert (= (and b!14215 res!13488) b!14216))

(assert (= (and b!14216 (not res!13487)) b!14217))

(assert (=> b!14215 m!20619))

(assert (=> b!14215 m!20617))

(assert (=> b!14217 m!20619))

(assert (=> b!14217 m!20619))

(declare-fun m!20725 () Bool)

(assert (=> b!14217 m!20725))

(assert (=> b!14107 d!4632))

(push 1)

(assert (not d!4626))

(assert (not b!14191))

(assert (not d!4582))

(assert (not d!4628))

(assert (not b!14215))

(assert (not d!4622))

(assert (not b!14206))

(assert (not d!4630))

(assert (not b!14217))

(assert (not d!4592))

(assert (not b!14192))

(assert (not d!4620))

(assert (not d!4624))

(assert (not b!14190))

(assert (not b!14189))

(check-sat)

(pop 1)

(push 1)

(check-sat)

