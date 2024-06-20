; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18450 () Bool)

(assert start!18450)

(declare-fun b!91640 () Bool)

(declare-fun e!60246 () Bool)

(declare-datatypes ((array!4283 0))(
  ( (array!4284 (arr!2566 (Array (_ BitVec 32) (_ BitVec 8))) (size!1929 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3420 0))(
  ( (BitStream!3421 (buf!2319 array!4283) (currentByte!4618 (_ BitVec 32)) (currentBit!4613 (_ BitVec 32))) )
))
(declare-fun base!8 () BitStream!3420)

(declare-fun array_inv!1775 (array!4283) Bool)

(assert (=> b!91640 (= e!60246 (array_inv!1775 (buf!2319 base!8)))))

(declare-fun b!91641 () Bool)

(declare-fun res!75665 () Bool)

(declare-fun e!60245 () Bool)

(assert (=> b!91641 (=> (not res!75665) (not e!60245))))

(declare-fun bitStream2!8 () BitStream!3420)

(declare-fun bitStream1!8 () BitStream!3420)

(assert (=> b!91641 (= res!75665 (and (= (buf!2319 bitStream1!8) (buf!2319 bitStream2!8)) (= (buf!2319 bitStream1!8) (buf!2319 base!8))))))

(declare-fun b!91642 () Bool)

(declare-fun res!75663 () Bool)

(assert (=> b!91642 (=> (not res!75663) (not e!60245))))

(declare-fun isPrefixOf!0 (BitStream!3420 BitStream!3420) Bool)

(assert (=> b!91642 (= res!75663 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!91643 () Bool)

(declare-fun e!60240 () Bool)

(assert (=> b!91643 (= e!60240 (array_inv!1775 (buf!2319 bitStream2!8)))))

(declare-fun b!91644 () Bool)

(declare-fun res!75666 () Bool)

(assert (=> b!91644 (=> (not res!75666) (not e!60245))))

(assert (=> b!91644 (= res!75666 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!91645 () Bool)

(declare-fun res!75664 () Bool)

(assert (=> b!91645 (=> (not res!75664) (not e!60245))))

(assert (=> b!91645 (= res!75664 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!91646 () Bool)

(declare-fun res!75662 () Bool)

(assert (=> b!91646 (=> (not res!75662) (not e!60245))))

(declare-datatypes ((List!816 0))(
  ( (Nil!813) (Cons!812 (h!931 Bool) (t!1566 List!816)) )
))
(declare-fun listBits!13 () List!816)

(declare-fun length!407 (List!816) Int)

(assert (=> b!91646 (= res!75662 (> (length!407 listBits!13) 0))))

(declare-fun res!75667 () Bool)

(assert (=> start!18450 (=> (not res!75667) (not e!60245))))

(declare-fun nBits!484 () (_ BitVec 64))

(assert (=> start!18450 (= res!75667 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18450 e!60245))

(assert (=> start!18450 true))

(declare-fun e!60244 () Bool)

(declare-fun inv!12 (BitStream!3420) Bool)

(assert (=> start!18450 (and (inv!12 bitStream1!8) e!60244)))

(assert (=> start!18450 (and (inv!12 bitStream2!8) e!60240)))

(assert (=> start!18450 (and (inv!12 base!8) e!60246)))

(declare-fun b!91647 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!91647 (= e!60245 (not (invariant!0 (currentBit!4613 base!8) (currentByte!4618 base!8) (size!1929 (buf!2319 base!8)))))))

(declare-fun b!91648 () Bool)

(assert (=> b!91648 (= e!60244 (array_inv!1775 (buf!2319 bitStream1!8)))))

(assert (= (and start!18450 res!75667) b!91646))

(assert (= (and b!91646 res!75662) b!91644))

(assert (= (and b!91644 res!75666) b!91645))

(assert (= (and b!91645 res!75664) b!91642))

(assert (= (and b!91642 res!75663) b!91641))

(assert (= (and b!91641 res!75665) b!91647))

(assert (= start!18450 b!91648))

(assert (= start!18450 b!91643))

(assert (= start!18450 b!91640))

(declare-fun m!135747 () Bool)

(assert (=> b!91640 m!135747))

(declare-fun m!135749 () Bool)

(assert (=> b!91643 m!135749))

(declare-fun m!135751 () Bool)

(assert (=> b!91644 m!135751))

(declare-fun m!135753 () Bool)

(assert (=> b!91645 m!135753))

(declare-fun m!135755 () Bool)

(assert (=> b!91647 m!135755))

(declare-fun m!135757 () Bool)

(assert (=> start!18450 m!135757))

(declare-fun m!135759 () Bool)

(assert (=> start!18450 m!135759))

(declare-fun m!135761 () Bool)

(assert (=> start!18450 m!135761))

(declare-fun m!135763 () Bool)

(assert (=> b!91646 m!135763))

(declare-fun m!135765 () Bool)

(assert (=> b!91648 m!135765))

(declare-fun m!135767 () Bool)

(assert (=> b!91642 m!135767))

(check-sat (not b!91640) (not b!91646) (not b!91648) (not b!91647) (not b!91643) (not b!91645) (not b!91644) (not start!18450) (not b!91642))
(check-sat)
(get-model)

(declare-fun d!28482 () Bool)

(declare-fun res!75715 () Bool)

(declare-fun e!60286 () Bool)

(assert (=> d!28482 (=> (not res!75715) (not e!60286))))

(assert (=> d!28482 (= res!75715 (= (size!1929 (buf!2319 bitStream1!8)) (size!1929 (buf!2319 base!8))))))

(assert (=> d!28482 (= (isPrefixOf!0 bitStream1!8 base!8) e!60286)))

(declare-fun b!91703 () Bool)

(declare-fun res!75714 () Bool)

(assert (=> b!91703 (=> (not res!75714) (not e!60286))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!91703 (= res!75714 (bvsle (bitIndex!0 (size!1929 (buf!2319 bitStream1!8)) (currentByte!4618 bitStream1!8) (currentBit!4613 bitStream1!8)) (bitIndex!0 (size!1929 (buf!2319 base!8)) (currentByte!4618 base!8) (currentBit!4613 base!8))))))

(declare-fun b!91704 () Bool)

(declare-fun e!60287 () Bool)

(assert (=> b!91704 (= e!60286 e!60287)))

(declare-fun res!75713 () Bool)

(assert (=> b!91704 (=> res!75713 e!60287)))

(assert (=> b!91704 (= res!75713 (= (size!1929 (buf!2319 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!91705 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4283 array!4283 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!91705 (= e!60287 (arrayBitRangesEq!0 (buf!2319 bitStream1!8) (buf!2319 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1929 (buf!2319 bitStream1!8)) (currentByte!4618 bitStream1!8) (currentBit!4613 bitStream1!8))))))

(assert (= (and d!28482 res!75715) b!91703))

(assert (= (and b!91703 res!75714) b!91704))

(assert (= (and b!91704 (not res!75713)) b!91705))

(declare-fun m!135817 () Bool)

(assert (=> b!91703 m!135817))

(declare-fun m!135819 () Bool)

(assert (=> b!91703 m!135819))

(assert (=> b!91705 m!135817))

(assert (=> b!91705 m!135817))

(declare-fun m!135821 () Bool)

(assert (=> b!91705 m!135821))

(assert (=> b!91644 d!28482))

(declare-fun d!28520 () Bool)

(assert (=> d!28520 (= (array_inv!1775 (buf!2319 bitStream2!8)) (bvsge (size!1929 (buf!2319 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!91643 d!28520))

(declare-fun d!28530 () Bool)

(declare-fun res!75727 () Bool)

(declare-fun e!60294 () Bool)

(assert (=> d!28530 (=> (not res!75727) (not e!60294))))

(assert (=> d!28530 (= res!75727 (= (size!1929 (buf!2319 bitStream2!8)) (size!1929 (buf!2319 base!8))))))

(assert (=> d!28530 (= (isPrefixOf!0 bitStream2!8 base!8) e!60294)))

(declare-fun b!91715 () Bool)

(declare-fun res!75726 () Bool)

(assert (=> b!91715 (=> (not res!75726) (not e!60294))))

(assert (=> b!91715 (= res!75726 (bvsle (bitIndex!0 (size!1929 (buf!2319 bitStream2!8)) (currentByte!4618 bitStream2!8) (currentBit!4613 bitStream2!8)) (bitIndex!0 (size!1929 (buf!2319 base!8)) (currentByte!4618 base!8) (currentBit!4613 base!8))))))

(declare-fun b!91716 () Bool)

(declare-fun e!60295 () Bool)

(assert (=> b!91716 (= e!60294 e!60295)))

(declare-fun res!75725 () Bool)

(assert (=> b!91716 (=> res!75725 e!60295)))

(assert (=> b!91716 (= res!75725 (= (size!1929 (buf!2319 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!91717 () Bool)

(assert (=> b!91717 (= e!60295 (arrayBitRangesEq!0 (buf!2319 bitStream2!8) (buf!2319 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1929 (buf!2319 bitStream2!8)) (currentByte!4618 bitStream2!8) (currentBit!4613 bitStream2!8))))))

(assert (= (and d!28530 res!75727) b!91715))

(assert (= (and b!91715 res!75726) b!91716))

(assert (= (and b!91716 (not res!75725)) b!91717))

(declare-fun m!135833 () Bool)

(assert (=> b!91715 m!135833))

(assert (=> b!91715 m!135819))

(assert (=> b!91717 m!135833))

(assert (=> b!91717 m!135833))

(declare-fun m!135835 () Bool)

(assert (=> b!91717 m!135835))

(assert (=> b!91645 d!28530))

(declare-fun d!28532 () Bool)

(assert (=> d!28532 (= (array_inv!1775 (buf!2319 base!8)) (bvsge (size!1929 (buf!2319 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!91640 d!28532))

(declare-fun d!28534 () Bool)

(declare-fun size!1933 (List!816) Int)

(assert (=> d!28534 (= (length!407 listBits!13) (size!1933 listBits!13))))

(declare-fun bs!7039 () Bool)

(assert (= bs!7039 d!28534))

(declare-fun m!135837 () Bool)

(assert (=> bs!7039 m!135837))

(assert (=> b!91646 d!28534))

(declare-fun d!28536 () Bool)

(assert (=> d!28536 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4613 bitStream1!8) (currentByte!4618 bitStream1!8) (size!1929 (buf!2319 bitStream1!8))))))

(declare-fun bs!7040 () Bool)

(assert (= bs!7040 d!28536))

(declare-fun m!135839 () Bool)

(assert (=> bs!7040 m!135839))

(assert (=> start!18450 d!28536))

(declare-fun d!28538 () Bool)

(assert (=> d!28538 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4613 bitStream2!8) (currentByte!4618 bitStream2!8) (size!1929 (buf!2319 bitStream2!8))))))

(declare-fun bs!7041 () Bool)

(assert (= bs!7041 d!28538))

(declare-fun m!135841 () Bool)

(assert (=> bs!7041 m!135841))

(assert (=> start!18450 d!28538))

(declare-fun d!28540 () Bool)

(assert (=> d!28540 (= (inv!12 base!8) (invariant!0 (currentBit!4613 base!8) (currentByte!4618 base!8) (size!1929 (buf!2319 base!8))))))

(declare-fun bs!7042 () Bool)

(assert (= bs!7042 d!28540))

(assert (=> bs!7042 m!135755))

(assert (=> start!18450 d!28540))

(declare-fun d!28542 () Bool)

(assert (=> d!28542 (= (array_inv!1775 (buf!2319 bitStream1!8)) (bvsge (size!1929 (buf!2319 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!91648 d!28542))

(declare-fun d!28544 () Bool)

(assert (=> d!28544 (= (invariant!0 (currentBit!4613 base!8) (currentByte!4618 base!8) (size!1929 (buf!2319 base!8))) (and (bvsge (currentBit!4613 base!8) #b00000000000000000000000000000000) (bvslt (currentBit!4613 base!8) #b00000000000000000000000000001000) (bvsge (currentByte!4618 base!8) #b00000000000000000000000000000000) (or (bvslt (currentByte!4618 base!8) (size!1929 (buf!2319 base!8))) (and (= (currentBit!4613 base!8) #b00000000000000000000000000000000) (= (currentByte!4618 base!8) (size!1929 (buf!2319 base!8)))))))))

(assert (=> b!91647 d!28544))

(declare-fun d!28546 () Bool)

(declare-fun res!75730 () Bool)

(declare-fun e!60296 () Bool)

(assert (=> d!28546 (=> (not res!75730) (not e!60296))))

(assert (=> d!28546 (= res!75730 (= (size!1929 (buf!2319 bitStream1!8)) (size!1929 (buf!2319 bitStream2!8))))))

(assert (=> d!28546 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!60296)))

(declare-fun b!91718 () Bool)

(declare-fun res!75729 () Bool)

(assert (=> b!91718 (=> (not res!75729) (not e!60296))))

(assert (=> b!91718 (= res!75729 (bvsle (bitIndex!0 (size!1929 (buf!2319 bitStream1!8)) (currentByte!4618 bitStream1!8) (currentBit!4613 bitStream1!8)) (bitIndex!0 (size!1929 (buf!2319 bitStream2!8)) (currentByte!4618 bitStream2!8) (currentBit!4613 bitStream2!8))))))

(declare-fun b!91719 () Bool)

(declare-fun e!60297 () Bool)

(assert (=> b!91719 (= e!60296 e!60297)))

(declare-fun res!75728 () Bool)

(assert (=> b!91719 (=> res!75728 e!60297)))

(assert (=> b!91719 (= res!75728 (= (size!1929 (buf!2319 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!91720 () Bool)

(assert (=> b!91720 (= e!60297 (arrayBitRangesEq!0 (buf!2319 bitStream1!8) (buf!2319 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1929 (buf!2319 bitStream1!8)) (currentByte!4618 bitStream1!8) (currentBit!4613 bitStream1!8))))))

(assert (= (and d!28546 res!75730) b!91718))

(assert (= (and b!91718 res!75729) b!91719))

(assert (= (and b!91719 (not res!75728)) b!91720))

