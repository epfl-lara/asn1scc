; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17688 () Bool)

(assert start!17688)

(declare-fun b!85480 () Bool)

(declare-fun res!70150 () Bool)

(declare-fun e!56932 () Bool)

(assert (=> b!85480 (=> (not res!70150) (not e!56932))))

(declare-datatypes ((array!4064 0))(
  ( (array!4065 (arr!2473 (Array (_ BitVec 32) (_ BitVec 8))) (size!1836 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3234 0))(
  ( (BitStream!3235 (buf!2226 array!4064) (currentByte!4423 (_ BitVec 32)) (currentBit!4418 (_ BitVec 32))) )
))
(declare-fun thiss!1151 () BitStream!3234)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!85480 (= res!70150 (invariant!0 (currentBit!4418 thiss!1151) (currentByte!4423 thiss!1151) (size!1836 (buf!2226 thiss!1151))))))

(declare-fun b!85481 () Bool)

(declare-fun e!56940 () Bool)

(declare-fun e!56936 () Bool)

(assert (=> b!85481 (= e!56940 e!56936)))

(declare-fun res!70138 () Bool)

(assert (=> b!85481 (=> (not res!70138) (not e!56936))))

(declare-fun lt!134668 () (_ BitVec 64))

(declare-fun lt!134669 () (_ BitVec 64))

(assert (=> b!85481 (= res!70138 (= lt!134668 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!134669)))))

(declare-datatypes ((Unit!5688 0))(
  ( (Unit!5689) )
))
(declare-datatypes ((tuple2!7268 0))(
  ( (tuple2!7269 (_1!3849 Unit!5688) (_2!3849 BitStream!3234)) )
))
(declare-fun lt!134672 () tuple2!7268)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!85481 (= lt!134668 (bitIndex!0 (size!1836 (buf!2226 (_2!3849 lt!134672))) (currentByte!4423 (_2!3849 lt!134672)) (currentBit!4418 (_2!3849 lt!134672))))))

(declare-fun res!70141 () Bool)

(assert (=> start!17688 (=> (not res!70141) (not e!56932))))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> start!17688 (= res!70141 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17688 e!56932))

(declare-fun thiss!1152 () BitStream!3234)

(declare-fun e!56933 () Bool)

(declare-fun inv!12 (BitStream!3234) Bool)

(assert (=> start!17688 (and (inv!12 thiss!1152) e!56933)))

(declare-fun e!56935 () Bool)

(assert (=> start!17688 (and (inv!12 thiss!1151) e!56935)))

(assert (=> start!17688 true))

(declare-fun b!85482 () Bool)

(declare-fun res!70143 () Bool)

(declare-fun e!56937 () Bool)

(assert (=> b!85482 (=> (not res!70143) (not e!56937))))

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!85482 (= res!70143 (bvslt i!576 nBits!336))))

(declare-fun b!85483 () Bool)

(declare-fun res!70152 () Bool)

(assert (=> b!85483 (=> (not res!70152) (not e!56932))))

(assert (=> b!85483 (= res!70152 (and (bvsle i!576 nBits!336) (= (size!1836 (buf!2226 thiss!1152)) (size!1836 (buf!2226 thiss!1151)))))))

(declare-fun b!85484 () Bool)

(declare-fun res!70145 () Bool)

(declare-fun e!56930 () Bool)

(assert (=> b!85484 (=> (not res!70145) (not e!56930))))

(declare-fun lt!134673 () (_ BitVec 64))

(assert (=> b!85484 (= res!70145 (= (bitIndex!0 (size!1836 (buf!2226 (_2!3849 lt!134672))) (currentByte!4423 (_2!3849 lt!134672)) (currentBit!4418 (_2!3849 lt!134672))) (bvadd lt!134673 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun b!85485 () Bool)

(assert (=> b!85485 (= e!56932 e!56937)))

(declare-fun res!70140 () Bool)

(assert (=> b!85485 (=> (not res!70140) (not e!56937))))

(assert (=> b!85485 (= res!70140 (= lt!134669 (bvadd lt!134673 ((_ sign_extend 32) i!576))))))

(assert (=> b!85485 (= lt!134669 (bitIndex!0 (size!1836 (buf!2226 thiss!1152)) (currentByte!4423 thiss!1152) (currentBit!4418 thiss!1152)))))

(assert (=> b!85485 (= lt!134673 (bitIndex!0 (size!1836 (buf!2226 thiss!1151)) (currentByte!4423 thiss!1151) (currentBit!4418 thiss!1151)))))

(declare-fun b!85486 () Bool)

(declare-fun res!70153 () Bool)

(assert (=> b!85486 (=> (not res!70153) (not e!56932))))

(assert (=> b!85486 (= res!70153 (invariant!0 (currentBit!4418 thiss!1152) (currentByte!4423 thiss!1152) (size!1836 (buf!2226 thiss!1152))))))

(declare-fun b!85487 () Bool)

(declare-fun res!70146 () Bool)

(declare-fun e!56938 () Bool)

(assert (=> b!85487 (=> res!70146 e!56938)))

(assert (=> b!85487 (= res!70146 (bvsge (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!85488 () Bool)

(assert (=> b!85488 (= e!56937 (not e!56938))))

(declare-fun res!70148 () Bool)

(assert (=> b!85488 (=> res!70148 e!56938)))

(assert (=> b!85488 (= res!70148 (not (invariant!0 (currentBit!4418 (_2!3849 lt!134672)) (currentByte!4423 (_2!3849 lt!134672)) (size!1836 (buf!2226 (_2!3849 lt!134672))))))))

(assert (=> b!85488 e!56940))

(declare-fun res!70147 () Bool)

(assert (=> b!85488 (=> (not res!70147) (not e!56940))))

(assert (=> b!85488 (= res!70147 (= (size!1836 (buf!2226 thiss!1152)) (size!1836 (buf!2226 (_2!3849 lt!134672)))))))

(declare-fun lt!134671 () Bool)

(declare-fun appendBit!0 (BitStream!3234 Bool) tuple2!7268)

(assert (=> b!85488 (= lt!134672 (appendBit!0 thiss!1152 lt!134671))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!85488 (= lt!134671 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!85489 () Bool)

(declare-fun res!70151 () Bool)

(assert (=> b!85489 (=> (not res!70151) (not e!56932))))

(assert (=> b!85489 (= res!70151 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!85490 () Bool)

(declare-fun res!70137 () Bool)

(assert (=> b!85490 (=> (not res!70137) (not e!56937))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!85490 (= res!70137 (validate_offset_bits!1 ((_ sign_extend 32) (size!1836 (buf!2226 thiss!1152))) ((_ sign_extend 32) (currentByte!4423 thiss!1152)) ((_ sign_extend 32) (currentBit!4418 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!85491 () Bool)

(declare-fun array_inv!1682 (array!4064) Bool)

(assert (=> b!85491 (= e!56933 (array_inv!1682 (buf!2226 thiss!1152)))))

(declare-fun b!85492 () Bool)

(declare-fun res!70144 () Bool)

(assert (=> b!85492 (=> (not res!70144) (not e!56932))))

(assert (=> b!85492 (= res!70144 (validate_offset_bits!1 ((_ sign_extend 32) (size!1836 (buf!2226 thiss!1151))) ((_ sign_extend 32) (currentByte!4423 thiss!1151)) ((_ sign_extend 32) (currentBit!4418 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!85493 () Bool)

(declare-fun e!56934 () Bool)

(declare-datatypes ((tuple2!7270 0))(
  ( (tuple2!7271 (_1!3850 BitStream!3234) (_2!3850 Bool)) )
))
(declare-fun lt!134670 () tuple2!7270)

(assert (=> b!85493 (= e!56934 (= (bitIndex!0 (size!1836 (buf!2226 (_1!3850 lt!134670))) (currentByte!4423 (_1!3850 lt!134670)) (currentBit!4418 (_1!3850 lt!134670))) lt!134668))))

(declare-fun b!85494 () Bool)

(assert (=> b!85494 (= e!56930 (validate_offset_bits!1 ((_ sign_extend 32) (size!1836 (buf!2226 (_2!3849 lt!134672)))) ((_ sign_extend 32) (currentByte!4423 (_2!3849 lt!134672))) ((_ sign_extend 32) (currentBit!4418 (_2!3849 lt!134672))) ((_ sign_extend 32) (bvsub nBits!336 (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun b!85495 () Bool)

(assert (=> b!85495 (= e!56935 (array_inv!1682 (buf!2226 thiss!1151)))))

(declare-fun b!85496 () Bool)

(assert (=> b!85496 (= e!56936 e!56934)))

(declare-fun res!70149 () Bool)

(assert (=> b!85496 (=> (not res!70149) (not e!56934))))

(assert (=> b!85496 (= res!70149 (and (= (_2!3850 lt!134670) lt!134671) (= (_1!3850 lt!134670) (_2!3849 lt!134672))))))

(declare-fun readBitPure!0 (BitStream!3234) tuple2!7270)

(declare-fun readerFrom!0 (BitStream!3234 (_ BitVec 32) (_ BitVec 32)) BitStream!3234)

(assert (=> b!85496 (= lt!134670 (readBitPure!0 (readerFrom!0 (_2!3849 lt!134672) (currentBit!4418 thiss!1152) (currentByte!4423 thiss!1152))))))

(declare-fun b!85497 () Bool)

(assert (=> b!85497 (= e!56938 e!56930)))

(declare-fun res!70139 () Bool)

(assert (=> b!85497 (=> (not res!70139) (not e!56930))))

(assert (=> b!85497 (= res!70139 (and (bvsge (bvadd #b00000000000000000000000000000001 i!576) #b00000000000000000000000000000000) (= (size!1836 (buf!2226 (_2!3849 lt!134672))) (size!1836 (buf!2226 thiss!1151)))))))

(declare-fun b!85498 () Bool)

(declare-fun res!70142 () Bool)

(assert (=> b!85498 (=> (not res!70142) (not e!56936))))

(declare-fun isPrefixOf!0 (BitStream!3234 BitStream!3234) Bool)

(assert (=> b!85498 (= res!70142 (isPrefixOf!0 thiss!1152 (_2!3849 lt!134672)))))

(assert (= (and start!17688 res!70141) b!85492))

(assert (= (and b!85492 res!70144) b!85480))

(assert (= (and b!85480 res!70150) b!85489))

(assert (= (and b!85489 res!70151) b!85486))

(assert (= (and b!85486 res!70153) b!85483))

(assert (= (and b!85483 res!70152) b!85485))

(assert (= (and b!85485 res!70140) b!85490))

(assert (= (and b!85490 res!70137) b!85482))

(assert (= (and b!85482 res!70143) b!85488))

(assert (= (and b!85488 res!70147) b!85481))

(assert (= (and b!85481 res!70138) b!85498))

(assert (= (and b!85498 res!70142) b!85496))

(assert (= (and b!85496 res!70149) b!85493))

(assert (= (and b!85488 (not res!70148)) b!85487))

(assert (= (and b!85487 (not res!70146)) b!85497))

(assert (= (and b!85497 res!70139) b!85484))

(assert (= (and b!85484 res!70145) b!85494))

(assert (= start!17688 b!85491))

(assert (= start!17688 b!85495))

(declare-fun m!131615 () Bool)

(assert (=> b!85494 m!131615))

(declare-fun m!131617 () Bool)

(assert (=> start!17688 m!131617))

(declare-fun m!131619 () Bool)

(assert (=> start!17688 m!131619))

(declare-fun m!131621 () Bool)

(assert (=> b!85484 m!131621))

(declare-fun m!131623 () Bool)

(assert (=> b!85480 m!131623))

(assert (=> b!85481 m!131621))

(declare-fun m!131625 () Bool)

(assert (=> b!85498 m!131625))

(declare-fun m!131627 () Bool)

(assert (=> b!85485 m!131627))

(declare-fun m!131629 () Bool)

(assert (=> b!85485 m!131629))

(declare-fun m!131631 () Bool)

(assert (=> b!85488 m!131631))

(declare-fun m!131633 () Bool)

(assert (=> b!85488 m!131633))

(declare-fun m!131635 () Bool)

(assert (=> b!85495 m!131635))

(declare-fun m!131637 () Bool)

(assert (=> b!85491 m!131637))

(declare-fun m!131639 () Bool)

(assert (=> b!85496 m!131639))

(assert (=> b!85496 m!131639))

(declare-fun m!131641 () Bool)

(assert (=> b!85496 m!131641))

(declare-fun m!131643 () Bool)

(assert (=> b!85490 m!131643))

(declare-fun m!131645 () Bool)

(assert (=> b!85486 m!131645))

(declare-fun m!131647 () Bool)

(assert (=> b!85493 m!131647))

(declare-fun m!131649 () Bool)

(assert (=> b!85492 m!131649))

(check-sat (not b!85492) (not b!85488) (not b!85496) (not b!85491) (not b!85486) (not b!85480) (not b!85495) (not b!85485) (not b!85498) (not b!85484) (not b!85490) (not b!85494) (not b!85481) (not start!17688) (not b!85493))
(check-sat)
(get-model)

(declare-fun d!27330 () Bool)

(declare-fun e!56991 () Bool)

(assert (=> d!27330 e!56991))

(declare-fun res!70235 () Bool)

(assert (=> d!27330 (=> (not res!70235) (not e!56991))))

(declare-fun lt!134748 () (_ BitVec 64))

(declare-fun lt!134744 () (_ BitVec 64))

(declare-fun lt!134747 () (_ BitVec 64))

(assert (=> d!27330 (= res!70235 (= lt!134747 (bvsub lt!134744 lt!134748)))))

(assert (=> d!27330 (or (= (bvand lt!134744 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134748 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!134744 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!134744 lt!134748) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!27330 (= lt!134748 (remainingBits!0 ((_ sign_extend 32) (size!1836 (buf!2226 thiss!1152))) ((_ sign_extend 32) (currentByte!4423 thiss!1152)) ((_ sign_extend 32) (currentBit!4418 thiss!1152))))))

(declare-fun lt!134743 () (_ BitVec 64))

(declare-fun lt!134745 () (_ BitVec 64))

(assert (=> d!27330 (= lt!134744 (bvmul lt!134743 lt!134745))))

(assert (=> d!27330 (or (= lt!134743 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!134745 (bvsdiv (bvmul lt!134743 lt!134745) lt!134743)))))

(assert (=> d!27330 (= lt!134745 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27330 (= lt!134743 ((_ sign_extend 32) (size!1836 (buf!2226 thiss!1152))))))

(assert (=> d!27330 (= lt!134747 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4423 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4418 thiss!1152))))))

(assert (=> d!27330 (invariant!0 (currentBit!4418 thiss!1152) (currentByte!4423 thiss!1152) (size!1836 (buf!2226 thiss!1152)))))

(assert (=> d!27330 (= (bitIndex!0 (size!1836 (buf!2226 thiss!1152)) (currentByte!4423 thiss!1152) (currentBit!4418 thiss!1152)) lt!134747)))

(declare-fun b!85584 () Bool)

(declare-fun res!70234 () Bool)

(assert (=> b!85584 (=> (not res!70234) (not e!56991))))

(assert (=> b!85584 (= res!70234 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!134747))))

(declare-fun b!85585 () Bool)

(declare-fun lt!134746 () (_ BitVec 64))

(assert (=> b!85585 (= e!56991 (bvsle lt!134747 (bvmul lt!134746 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!85585 (or (= lt!134746 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!134746 #b0000000000000000000000000000000000000000000000000000000000001000) lt!134746)))))

(assert (=> b!85585 (= lt!134746 ((_ sign_extend 32) (size!1836 (buf!2226 thiss!1152))))))

(assert (= (and d!27330 res!70235) b!85584))

(assert (= (and b!85584 res!70234) b!85585))

(declare-fun m!131705 () Bool)

(assert (=> d!27330 m!131705))

(assert (=> d!27330 m!131645))

(assert (=> b!85485 d!27330))

(declare-fun d!27362 () Bool)

(declare-fun e!56992 () Bool)

(assert (=> d!27362 e!56992))

(declare-fun res!70237 () Bool)

(assert (=> d!27362 (=> (not res!70237) (not e!56992))))

(declare-fun lt!134753 () (_ BitVec 64))

(declare-fun lt!134750 () (_ BitVec 64))

(declare-fun lt!134754 () (_ BitVec 64))

(assert (=> d!27362 (= res!70237 (= lt!134753 (bvsub lt!134750 lt!134754)))))

(assert (=> d!27362 (or (= (bvand lt!134750 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134754 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!134750 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!134750 lt!134754) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27362 (= lt!134754 (remainingBits!0 ((_ sign_extend 32) (size!1836 (buf!2226 thiss!1151))) ((_ sign_extend 32) (currentByte!4423 thiss!1151)) ((_ sign_extend 32) (currentBit!4418 thiss!1151))))))

(declare-fun lt!134749 () (_ BitVec 64))

(declare-fun lt!134751 () (_ BitVec 64))

(assert (=> d!27362 (= lt!134750 (bvmul lt!134749 lt!134751))))

(assert (=> d!27362 (or (= lt!134749 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!134751 (bvsdiv (bvmul lt!134749 lt!134751) lt!134749)))))

(assert (=> d!27362 (= lt!134751 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27362 (= lt!134749 ((_ sign_extend 32) (size!1836 (buf!2226 thiss!1151))))))

(assert (=> d!27362 (= lt!134753 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4423 thiss!1151)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4418 thiss!1151))))))

(assert (=> d!27362 (invariant!0 (currentBit!4418 thiss!1151) (currentByte!4423 thiss!1151) (size!1836 (buf!2226 thiss!1151)))))

(assert (=> d!27362 (= (bitIndex!0 (size!1836 (buf!2226 thiss!1151)) (currentByte!4423 thiss!1151) (currentBit!4418 thiss!1151)) lt!134753)))

(declare-fun b!85586 () Bool)

(declare-fun res!70236 () Bool)

(assert (=> b!85586 (=> (not res!70236) (not e!56992))))

(assert (=> b!85586 (= res!70236 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!134753))))

(declare-fun b!85587 () Bool)

(declare-fun lt!134752 () (_ BitVec 64))

(assert (=> b!85587 (= e!56992 (bvsle lt!134753 (bvmul lt!134752 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!85587 (or (= lt!134752 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!134752 #b0000000000000000000000000000000000000000000000000000000000001000) lt!134752)))))

(assert (=> b!85587 (= lt!134752 ((_ sign_extend 32) (size!1836 (buf!2226 thiss!1151))))))

(assert (= (and d!27362 res!70237) b!85586))

(assert (= (and b!85586 res!70236) b!85587))

(declare-fun m!131707 () Bool)

(assert (=> d!27362 m!131707))

(assert (=> d!27362 m!131623))

(assert (=> b!85485 d!27362))

(declare-fun d!27364 () Bool)

(assert (=> d!27364 (= (array_inv!1682 (buf!2226 thiss!1151)) (bvsge (size!1836 (buf!2226 thiss!1151)) #b00000000000000000000000000000000))))

(assert (=> b!85495 d!27364))

(declare-fun d!27368 () Bool)

(declare-fun e!56993 () Bool)

(assert (=> d!27368 e!56993))

(declare-fun res!70239 () Bool)

(assert (=> d!27368 (=> (not res!70239) (not e!56993))))

(declare-fun lt!134760 () (_ BitVec 64))

(declare-fun lt!134759 () (_ BitVec 64))

(declare-fun lt!134756 () (_ BitVec 64))

(assert (=> d!27368 (= res!70239 (= lt!134759 (bvsub lt!134756 lt!134760)))))

(assert (=> d!27368 (or (= (bvand lt!134756 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134760 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!134756 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!134756 lt!134760) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27368 (= lt!134760 (remainingBits!0 ((_ sign_extend 32) (size!1836 (buf!2226 (_2!3849 lt!134672)))) ((_ sign_extend 32) (currentByte!4423 (_2!3849 lt!134672))) ((_ sign_extend 32) (currentBit!4418 (_2!3849 lt!134672)))))))

(declare-fun lt!134755 () (_ BitVec 64))

(declare-fun lt!134757 () (_ BitVec 64))

(assert (=> d!27368 (= lt!134756 (bvmul lt!134755 lt!134757))))

(assert (=> d!27368 (or (= lt!134755 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!134757 (bvsdiv (bvmul lt!134755 lt!134757) lt!134755)))))

(assert (=> d!27368 (= lt!134757 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27368 (= lt!134755 ((_ sign_extend 32) (size!1836 (buf!2226 (_2!3849 lt!134672)))))))

(assert (=> d!27368 (= lt!134759 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4423 (_2!3849 lt!134672))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4418 (_2!3849 lt!134672)))))))

(assert (=> d!27368 (invariant!0 (currentBit!4418 (_2!3849 lt!134672)) (currentByte!4423 (_2!3849 lt!134672)) (size!1836 (buf!2226 (_2!3849 lt!134672))))))

(assert (=> d!27368 (= (bitIndex!0 (size!1836 (buf!2226 (_2!3849 lt!134672))) (currentByte!4423 (_2!3849 lt!134672)) (currentBit!4418 (_2!3849 lt!134672))) lt!134759)))

(declare-fun b!85588 () Bool)

(declare-fun res!70238 () Bool)

(assert (=> b!85588 (=> (not res!70238) (not e!56993))))

(assert (=> b!85588 (= res!70238 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!134759))))

(declare-fun b!85589 () Bool)

(declare-fun lt!134758 () (_ BitVec 64))

(assert (=> b!85589 (= e!56993 (bvsle lt!134759 (bvmul lt!134758 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!85589 (or (= lt!134758 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!134758 #b0000000000000000000000000000000000000000000000000000000000001000) lt!134758)))))

(assert (=> b!85589 (= lt!134758 ((_ sign_extend 32) (size!1836 (buf!2226 (_2!3849 lt!134672)))))))

(assert (= (and d!27368 res!70239) b!85588))

(assert (= (and b!85588 res!70238) b!85589))

(declare-fun m!131709 () Bool)

(assert (=> d!27368 m!131709))

(assert (=> d!27368 m!131631))

(assert (=> b!85484 d!27368))

(declare-fun d!27370 () Bool)

(assert (=> d!27370 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1836 (buf!2226 (_2!3849 lt!134672)))) ((_ sign_extend 32) (currentByte!4423 (_2!3849 lt!134672))) ((_ sign_extend 32) (currentBit!4418 (_2!3849 lt!134672))) ((_ sign_extend 32) (bvsub nBits!336 (bvadd #b00000000000000000000000000000001 i!576)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1836 (buf!2226 (_2!3849 lt!134672)))) ((_ sign_extend 32) (currentByte!4423 (_2!3849 lt!134672))) ((_ sign_extend 32) (currentBit!4418 (_2!3849 lt!134672)))) ((_ sign_extend 32) (bvsub nBits!336 (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun bs!6779 () Bool)

(assert (= bs!6779 d!27370))

(assert (=> bs!6779 m!131709))

(assert (=> b!85494 d!27370))

(declare-fun d!27372 () Bool)

(declare-fun e!56994 () Bool)

(assert (=> d!27372 e!56994))

(declare-fun res!70241 () Bool)

(assert (=> d!27372 (=> (not res!70241) (not e!56994))))

(declare-fun lt!134765 () (_ BitVec 64))

(declare-fun lt!134762 () (_ BitVec 64))

(declare-fun lt!134766 () (_ BitVec 64))

(assert (=> d!27372 (= res!70241 (= lt!134765 (bvsub lt!134762 lt!134766)))))

(assert (=> d!27372 (or (= (bvand lt!134762 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134766 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!134762 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!134762 lt!134766) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27372 (= lt!134766 (remainingBits!0 ((_ sign_extend 32) (size!1836 (buf!2226 (_1!3850 lt!134670)))) ((_ sign_extend 32) (currentByte!4423 (_1!3850 lt!134670))) ((_ sign_extend 32) (currentBit!4418 (_1!3850 lt!134670)))))))

(declare-fun lt!134761 () (_ BitVec 64))

(declare-fun lt!134763 () (_ BitVec 64))

(assert (=> d!27372 (= lt!134762 (bvmul lt!134761 lt!134763))))

(assert (=> d!27372 (or (= lt!134761 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!134763 (bvsdiv (bvmul lt!134761 lt!134763) lt!134761)))))

(assert (=> d!27372 (= lt!134763 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27372 (= lt!134761 ((_ sign_extend 32) (size!1836 (buf!2226 (_1!3850 lt!134670)))))))

(assert (=> d!27372 (= lt!134765 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4423 (_1!3850 lt!134670))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4418 (_1!3850 lt!134670)))))))

(assert (=> d!27372 (invariant!0 (currentBit!4418 (_1!3850 lt!134670)) (currentByte!4423 (_1!3850 lt!134670)) (size!1836 (buf!2226 (_1!3850 lt!134670))))))

(assert (=> d!27372 (= (bitIndex!0 (size!1836 (buf!2226 (_1!3850 lt!134670))) (currentByte!4423 (_1!3850 lt!134670)) (currentBit!4418 (_1!3850 lt!134670))) lt!134765)))

(declare-fun b!85590 () Bool)

(declare-fun res!70240 () Bool)

(assert (=> b!85590 (=> (not res!70240) (not e!56994))))

(assert (=> b!85590 (= res!70240 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!134765))))

(declare-fun b!85591 () Bool)

(declare-fun lt!134764 () (_ BitVec 64))

(assert (=> b!85591 (= e!56994 (bvsle lt!134765 (bvmul lt!134764 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!85591 (or (= lt!134764 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!134764 #b0000000000000000000000000000000000000000000000000000000000001000) lt!134764)))))

(assert (=> b!85591 (= lt!134764 ((_ sign_extend 32) (size!1836 (buf!2226 (_1!3850 lt!134670)))))))

(assert (= (and d!27372 res!70241) b!85590))

(assert (= (and b!85590 res!70240) b!85591))

(declare-fun m!131711 () Bool)

(assert (=> d!27372 m!131711))

(declare-fun m!131713 () Bool)

(assert (=> d!27372 m!131713))

(assert (=> b!85493 d!27372))

(declare-fun d!27374 () Bool)

(assert (=> d!27374 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1836 (buf!2226 thiss!1151))) ((_ sign_extend 32) (currentByte!4423 thiss!1151)) ((_ sign_extend 32) (currentBit!4418 thiss!1151)) ((_ sign_extend 32) nBits!336)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1836 (buf!2226 thiss!1151))) ((_ sign_extend 32) (currentByte!4423 thiss!1151)) ((_ sign_extend 32) (currentBit!4418 thiss!1151))) ((_ sign_extend 32) nBits!336)))))

(declare-fun bs!6780 () Bool)

(assert (= bs!6780 d!27374))

(assert (=> bs!6780 m!131707))

(assert (=> b!85492 d!27374))

(assert (=> b!85481 d!27368))

(declare-fun d!27376 () Bool)

(assert (=> d!27376 (= (array_inv!1682 (buf!2226 thiss!1152)) (bvsge (size!1836 (buf!2226 thiss!1152)) #b00000000000000000000000000000000))))

(assert (=> b!85491 d!27376))

(declare-fun d!27378 () Bool)

(assert (=> d!27378 (= (invariant!0 (currentBit!4418 thiss!1151) (currentByte!4423 thiss!1151) (size!1836 (buf!2226 thiss!1151))) (and (bvsge (currentBit!4418 thiss!1151) #b00000000000000000000000000000000) (bvslt (currentBit!4418 thiss!1151) #b00000000000000000000000000001000) (bvsge (currentByte!4423 thiss!1151) #b00000000000000000000000000000000) (or (bvslt (currentByte!4423 thiss!1151) (size!1836 (buf!2226 thiss!1151))) (and (= (currentBit!4418 thiss!1151) #b00000000000000000000000000000000) (= (currentByte!4423 thiss!1151) (size!1836 (buf!2226 thiss!1151)))))))))

(assert (=> b!85480 d!27378))

(declare-fun d!27380 () Bool)

(assert (=> d!27380 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1836 (buf!2226 thiss!1152))) ((_ sign_extend 32) (currentByte!4423 thiss!1152)) ((_ sign_extend 32) (currentBit!4418 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1836 (buf!2226 thiss!1152))) ((_ sign_extend 32) (currentByte!4423 thiss!1152)) ((_ sign_extend 32) (currentBit!4418 thiss!1152))) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun bs!6781 () Bool)

(assert (= bs!6781 d!27380))

(assert (=> bs!6781 m!131705))

(assert (=> b!85490 d!27380))

(declare-fun d!27382 () Bool)

(assert (=> d!27382 (= (inv!12 thiss!1152) (invariant!0 (currentBit!4418 thiss!1152) (currentByte!4423 thiss!1152) (size!1836 (buf!2226 thiss!1152))))))

(declare-fun bs!6782 () Bool)

(assert (= bs!6782 d!27382))

(assert (=> bs!6782 m!131645))

(assert (=> start!17688 d!27382))

(declare-fun d!27384 () Bool)

(assert (=> d!27384 (= (inv!12 thiss!1151) (invariant!0 (currentBit!4418 thiss!1151) (currentByte!4423 thiss!1151) (size!1836 (buf!2226 thiss!1151))))))

(declare-fun bs!6783 () Bool)

(assert (= bs!6783 d!27384))

(assert (=> bs!6783 m!131623))

(assert (=> start!17688 d!27384))

(declare-fun d!27386 () Bool)

(assert (=> d!27386 (= (invariant!0 (currentBit!4418 (_2!3849 lt!134672)) (currentByte!4423 (_2!3849 lt!134672)) (size!1836 (buf!2226 (_2!3849 lt!134672)))) (and (bvsge (currentBit!4418 (_2!3849 lt!134672)) #b00000000000000000000000000000000) (bvslt (currentBit!4418 (_2!3849 lt!134672)) #b00000000000000000000000000001000) (bvsge (currentByte!4423 (_2!3849 lt!134672)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4423 (_2!3849 lt!134672)) (size!1836 (buf!2226 (_2!3849 lt!134672)))) (and (= (currentBit!4418 (_2!3849 lt!134672)) #b00000000000000000000000000000000) (= (currentByte!4423 (_2!3849 lt!134672)) (size!1836 (buf!2226 (_2!3849 lt!134672))))))))))

(assert (=> b!85488 d!27386))

(declare-fun d!27388 () Bool)

(declare-fun e!57013 () Bool)

(assert (=> d!27388 e!57013))

(declare-fun res!70281 () Bool)

(assert (=> d!27388 (=> (not res!70281) (not e!57013))))

(declare-fun lt!134813 () tuple2!7268)

(assert (=> d!27388 (= res!70281 (= (size!1836 (buf!2226 thiss!1152)) (size!1836 (buf!2226 (_2!3849 lt!134813)))))))

(declare-fun choose!16 (BitStream!3234 Bool) tuple2!7268)

(assert (=> d!27388 (= lt!134813 (choose!16 thiss!1152 lt!134671))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!27388 (validate_offset_bit!0 ((_ sign_extend 32) (size!1836 (buf!2226 thiss!1152))) ((_ sign_extend 32) (currentByte!4423 thiss!1152)) ((_ sign_extend 32) (currentBit!4418 thiss!1152)))))

(assert (=> d!27388 (= (appendBit!0 thiss!1152 lt!134671) lt!134813)))

(declare-fun b!85634 () Bool)

(declare-fun e!57014 () Bool)

(declare-fun lt!134814 () tuple2!7270)

(assert (=> b!85634 (= e!57014 (= (bitIndex!0 (size!1836 (buf!2226 (_1!3850 lt!134814))) (currentByte!4423 (_1!3850 lt!134814)) (currentBit!4418 (_1!3850 lt!134814))) (bitIndex!0 (size!1836 (buf!2226 (_2!3849 lt!134813))) (currentByte!4423 (_2!3849 lt!134813)) (currentBit!4418 (_2!3849 lt!134813)))))))

(declare-fun b!85633 () Bool)

(assert (=> b!85633 (= e!57013 e!57014)))

(declare-fun res!70279 () Bool)

(assert (=> b!85633 (=> (not res!70279) (not e!57014))))

(assert (=> b!85633 (= res!70279 (and (= (_2!3850 lt!134814) lt!134671) (= (_1!3850 lt!134814) (_2!3849 lt!134813))))))

(assert (=> b!85633 (= lt!134814 (readBitPure!0 (readerFrom!0 (_2!3849 lt!134813) (currentBit!4418 thiss!1152) (currentByte!4423 thiss!1152))))))

(declare-fun b!85631 () Bool)

(declare-fun res!70280 () Bool)

(assert (=> b!85631 (=> (not res!70280) (not e!57013))))

(declare-fun lt!134812 () (_ BitVec 64))

(declare-fun lt!134811 () (_ BitVec 64))

(assert (=> b!85631 (= res!70280 (= (bitIndex!0 (size!1836 (buf!2226 (_2!3849 lt!134813))) (currentByte!4423 (_2!3849 lt!134813)) (currentBit!4418 (_2!3849 lt!134813))) (bvadd lt!134811 lt!134812)))))

(assert (=> b!85631 (or (not (= (bvand lt!134811 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134812 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!134811 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!134811 lt!134812) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!85631 (= lt!134812 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!85631 (= lt!134811 (bitIndex!0 (size!1836 (buf!2226 thiss!1152)) (currentByte!4423 thiss!1152) (currentBit!4418 thiss!1152)))))

(declare-fun b!85632 () Bool)

(declare-fun res!70278 () Bool)

(assert (=> b!85632 (=> (not res!70278) (not e!57013))))

(assert (=> b!85632 (= res!70278 (isPrefixOf!0 thiss!1152 (_2!3849 lt!134813)))))

(assert (= (and d!27388 res!70281) b!85631))

(assert (= (and b!85631 res!70280) b!85632))

(assert (= (and b!85632 res!70278) b!85633))

(assert (= (and b!85633 res!70279) b!85634))

(declare-fun m!131743 () Bool)

(assert (=> d!27388 m!131743))

(declare-fun m!131745 () Bool)

(assert (=> d!27388 m!131745))

(declare-fun m!131747 () Bool)

(assert (=> b!85632 m!131747))

(declare-fun m!131749 () Bool)

(assert (=> b!85633 m!131749))

(assert (=> b!85633 m!131749))

(declare-fun m!131751 () Bool)

(assert (=> b!85633 m!131751))

(declare-fun m!131753 () Bool)

(assert (=> b!85634 m!131753))

(declare-fun m!131755 () Bool)

(assert (=> b!85634 m!131755))

(assert (=> b!85631 m!131755))

(assert (=> b!85631 m!131627))

(assert (=> b!85488 d!27388))

(declare-fun d!27392 () Bool)

(declare-fun res!70293 () Bool)

(declare-fun e!57021 () Bool)

(assert (=> d!27392 (=> (not res!70293) (not e!57021))))

(assert (=> d!27392 (= res!70293 (= (size!1836 (buf!2226 thiss!1152)) (size!1836 (buf!2226 (_2!3849 lt!134672)))))))

(assert (=> d!27392 (= (isPrefixOf!0 thiss!1152 (_2!3849 lt!134672)) e!57021)))

(declare-fun b!85645 () Bool)

(declare-fun res!70294 () Bool)

(assert (=> b!85645 (=> (not res!70294) (not e!57021))))

(assert (=> b!85645 (= res!70294 (bvsle (bitIndex!0 (size!1836 (buf!2226 thiss!1152)) (currentByte!4423 thiss!1152) (currentBit!4418 thiss!1152)) (bitIndex!0 (size!1836 (buf!2226 (_2!3849 lt!134672))) (currentByte!4423 (_2!3849 lt!134672)) (currentBit!4418 (_2!3849 lt!134672)))))))

(declare-fun b!85646 () Bool)

(declare-fun e!57022 () Bool)

(assert (=> b!85646 (= e!57021 e!57022)))

(declare-fun res!70292 () Bool)

(assert (=> b!85646 (=> res!70292 e!57022)))

(assert (=> b!85646 (= res!70292 (= (size!1836 (buf!2226 thiss!1152)) #b00000000000000000000000000000000))))

(declare-fun b!85647 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4064 array!4064 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!85647 (= e!57022 (arrayBitRangesEq!0 (buf!2226 thiss!1152) (buf!2226 (_2!3849 lt!134672)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1836 (buf!2226 thiss!1152)) (currentByte!4423 thiss!1152) (currentBit!4418 thiss!1152))))))

(assert (= (and d!27392 res!70293) b!85645))

(assert (= (and b!85645 res!70294) b!85646))

(assert (= (and b!85646 (not res!70292)) b!85647))

(assert (=> b!85645 m!131627))

(assert (=> b!85645 m!131621))

(assert (=> b!85647 m!131627))

(assert (=> b!85647 m!131627))

(declare-fun m!131767 () Bool)

(assert (=> b!85647 m!131767))

(assert (=> b!85498 d!27392))

(declare-fun d!27404 () Bool)

(assert (=> d!27404 (= (invariant!0 (currentBit!4418 thiss!1152) (currentByte!4423 thiss!1152) (size!1836 (buf!2226 thiss!1152))) (and (bvsge (currentBit!4418 thiss!1152) #b00000000000000000000000000000000) (bvslt (currentBit!4418 thiss!1152) #b00000000000000000000000000001000) (bvsge (currentByte!4423 thiss!1152) #b00000000000000000000000000000000) (or (bvslt (currentByte!4423 thiss!1152) (size!1836 (buf!2226 thiss!1152))) (and (= (currentBit!4418 thiss!1152) #b00000000000000000000000000000000) (= (currentByte!4423 thiss!1152) (size!1836 (buf!2226 thiss!1152)))))))))

(assert (=> b!85486 d!27404))

(declare-fun d!27406 () Bool)

(declare-datatypes ((tuple2!7280 0))(
  ( (tuple2!7281 (_1!3855 Bool) (_2!3855 BitStream!3234)) )
))
(declare-fun lt!134832 () tuple2!7280)

(declare-fun readBit!0 (BitStream!3234) tuple2!7280)

(assert (=> d!27406 (= lt!134832 (readBit!0 (readerFrom!0 (_2!3849 lt!134672) (currentBit!4418 thiss!1152) (currentByte!4423 thiss!1152))))))

(assert (=> d!27406 (= (readBitPure!0 (readerFrom!0 (_2!3849 lt!134672) (currentBit!4418 thiss!1152) (currentByte!4423 thiss!1152))) (tuple2!7271 (_2!3855 lt!134832) (_1!3855 lt!134832)))))

(declare-fun bs!6787 () Bool)

(assert (= bs!6787 d!27406))

(assert (=> bs!6787 m!131639))

(declare-fun m!131771 () Bool)

(assert (=> bs!6787 m!131771))

(assert (=> b!85496 d!27406))

(declare-fun d!27414 () Bool)

(declare-fun e!57030 () Bool)

(assert (=> d!27414 e!57030))

(declare-fun res!70306 () Bool)

(assert (=> d!27414 (=> (not res!70306) (not e!57030))))

(assert (=> d!27414 (= res!70306 (invariant!0 (currentBit!4418 (_2!3849 lt!134672)) (currentByte!4423 (_2!3849 lt!134672)) (size!1836 (buf!2226 (_2!3849 lt!134672)))))))

(assert (=> d!27414 (= (readerFrom!0 (_2!3849 lt!134672) (currentBit!4418 thiss!1152) (currentByte!4423 thiss!1152)) (BitStream!3235 (buf!2226 (_2!3849 lt!134672)) (currentByte!4423 thiss!1152) (currentBit!4418 thiss!1152)))))

(declare-fun b!85657 () Bool)

(assert (=> b!85657 (= e!57030 (invariant!0 (currentBit!4418 thiss!1152) (currentByte!4423 thiss!1152) (size!1836 (buf!2226 (_2!3849 lt!134672)))))))

(assert (= (and d!27414 res!70306) b!85657))

(assert (=> d!27414 m!131631))

(declare-fun m!131773 () Bool)

(assert (=> b!85657 m!131773))

(assert (=> b!85496 d!27414))

(check-sat (not d!27382) (not d!27372) (not b!85647) (not d!27406) (not b!85634) (not d!27374) (not b!85645) (not d!27330) (not d!27368) (not b!85632) (not d!27370) (not d!27414) (not b!85631) (not b!85633) (not d!27362) (not b!85657) (not d!27388) (not d!27384) (not d!27380))
(check-sat)
