; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53848 () Bool)

(assert start!53848)

(declare-fun b!250700 () Bool)

(declare-fun res!209899 () Bool)

(declare-fun e!173753 () Bool)

(assert (=> b!250700 (=> (not res!209899) (not e!173753))))

(declare-datatypes ((array!13664 0))(
  ( (array!13665 (arr!6981 (Array (_ BitVec 32) (_ BitVec 8))) (size!5994 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10910 0))(
  ( (BitStream!10911 (buf!6490 array!13664) (currentByte!11930 (_ BitVec 32)) (currentBit!11925 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10910)

(declare-datatypes ((Unit!18127 0))(
  ( (Unit!18128) )
))
(declare-datatypes ((tuple2!21522 0))(
  ( (tuple2!21523 (_1!11686 Unit!18127) (_2!11686 BitStream!10910)) )
))
(declare-fun lt!389465 () tuple2!21522)

(declare-fun isPrefixOf!0 (BitStream!10910 BitStream!10910) Bool)

(assert (=> b!250700 (= res!209899 (isPrefixOf!0 thiss!1005 (_2!11686 lt!389465)))))

(declare-fun b!250701 () Bool)

(declare-fun res!209904 () Bool)

(declare-fun e!173762 () Bool)

(assert (=> b!250701 (=> (not res!209904) (not e!173762))))

(declare-fun lt!389472 () tuple2!21522)

(assert (=> b!250701 (= res!209904 (isPrefixOf!0 (_2!11686 lt!389465) (_2!11686 lt!389472)))))

(declare-fun b!250702 () Bool)

(declare-fun e!173758 () Bool)

(declare-datatypes ((tuple2!21524 0))(
  ( (tuple2!21525 (_1!11687 BitStream!10910) (_2!11687 Bool)) )
))
(declare-fun lt!389474 () tuple2!21524)

(declare-fun lt!389467 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!250702 (= e!173758 (= (bitIndex!0 (size!5994 (buf!6490 (_1!11687 lt!389474))) (currentByte!11930 (_1!11687 lt!389474)) (currentBit!11925 (_1!11687 lt!389474))) lt!389467))))

(declare-fun b!250703 () Bool)

(assert (=> b!250703 (= e!173753 e!173758)))

(declare-fun res!209909 () Bool)

(assert (=> b!250703 (=> (not res!209909) (not e!173758))))

(declare-fun bit!26 () Bool)

(assert (=> b!250703 (= res!209909 (and (= (_2!11687 lt!389474) bit!26) (= (_1!11687 lt!389474) (_2!11686 lt!389465))))))

(declare-fun readBitPure!0 (BitStream!10910) tuple2!21524)

(declare-fun readerFrom!0 (BitStream!10910 (_ BitVec 32) (_ BitVec 32)) BitStream!10910)

(assert (=> b!250703 (= lt!389474 (readBitPure!0 (readerFrom!0 (_2!11686 lt!389465) (currentBit!11925 thiss!1005) (currentByte!11930 thiss!1005))))))

(declare-fun res!209910 () Bool)

(declare-fun e!173760 () Bool)

(assert (=> start!53848 (=> (not res!209910) (not e!173760))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!53848 (= res!209910 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53848 e!173760))

(assert (=> start!53848 true))

(declare-fun e!173761 () Bool)

(declare-fun inv!12 (BitStream!10910) Bool)

(assert (=> start!53848 (and (inv!12 thiss!1005) e!173761)))

(declare-fun b!250704 () Bool)

(declare-fun e!173759 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!250704 (= e!173759 (invariant!0 (currentBit!11925 thiss!1005) (currentByte!11930 thiss!1005) (size!5994 (buf!6490 (_2!11686 lt!389465)))))))

(declare-fun b!250705 () Bool)

(declare-fun array_inv!5735 (array!13664) Bool)

(assert (=> b!250705 (= e!173761 (array_inv!5735 (buf!6490 thiss!1005)))))

(declare-fun b!250706 () Bool)

(declare-fun lt!389466 () tuple2!21524)

(declare-datatypes ((tuple2!21526 0))(
  ( (tuple2!21527 (_1!11688 BitStream!10910) (_2!11688 BitStream!10910)) )
))
(declare-fun lt!389471 () tuple2!21526)

(assert (=> b!250706 (= e!173762 (not (or (not (_2!11687 lt!389466)) (not (= (_1!11687 lt!389466) (_2!11688 lt!389471))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10910 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21524)

(assert (=> b!250706 (= lt!389466 (checkBitsLoopPure!0 (_1!11688 lt!389471) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!389473 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!250706 (validate_offset_bits!1 ((_ sign_extend 32) (size!5994 (buf!6490 (_2!11686 lt!389472)))) ((_ sign_extend 32) (currentByte!11930 (_2!11686 lt!389465))) ((_ sign_extend 32) (currentBit!11925 (_2!11686 lt!389465))) lt!389473)))

(declare-fun lt!389475 () Unit!18127)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10910 array!13664 (_ BitVec 64)) Unit!18127)

(assert (=> b!250706 (= lt!389475 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11686 lt!389465) (buf!6490 (_2!11686 lt!389472)) lt!389473))))

(declare-fun reader!0 (BitStream!10910 BitStream!10910) tuple2!21526)

(assert (=> b!250706 (= lt!389471 (reader!0 (_2!11686 lt!389465) (_2!11686 lt!389472)))))

(declare-fun b!250707 () Bool)

(declare-fun res!209908 () Bool)

(assert (=> b!250707 (=> (not res!209908) (not e!173760))))

(assert (=> b!250707 (= res!209908 (bvslt from!289 nBits!297))))

(declare-fun b!250708 () Bool)

(declare-fun e!173754 () Bool)

(declare-fun arrayBitRangesEq!0 (array!13664 array!13664 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!250708 (= e!173754 (arrayBitRangesEq!0 (buf!6490 (_2!11686 lt!389465)) (buf!6490 (_2!11686 lt!389472)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!5994 (buf!6490 (_2!11686 lt!389465))) (currentByte!11930 thiss!1005) (currentBit!11925 thiss!1005)))))))

(declare-fun b!250709 () Bool)

(assert (=> b!250709 (= e!173760 (not e!173754))))

(declare-fun res!209905 () Bool)

(assert (=> b!250709 (=> res!209905 e!173754)))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!250709 (= res!209905 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!5994 (buf!6490 (_2!11686 lt!389465)))) ((_ sign_extend 32) (currentByte!11930 thiss!1005)) ((_ sign_extend 32) (currentBit!11925 thiss!1005)))))))

(assert (=> b!250709 e!173759))

(declare-fun res!209902 () Bool)

(assert (=> b!250709 (=> (not res!209902) (not e!173759))))

(assert (=> b!250709 (= res!209902 (isPrefixOf!0 thiss!1005 (_2!11686 lt!389472)))))

(declare-fun lt!389469 () Unit!18127)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10910 BitStream!10910 BitStream!10910) Unit!18127)

(assert (=> b!250709 (= lt!389469 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11686 lt!389465) (_2!11686 lt!389472)))))

(declare-fun e!173757 () Bool)

(assert (=> b!250709 e!173757))

(declare-fun res!209907 () Bool)

(assert (=> b!250709 (=> (not res!209907) (not e!173757))))

(assert (=> b!250709 (= res!209907 (= (size!5994 (buf!6490 (_2!11686 lt!389465))) (size!5994 (buf!6490 (_2!11686 lt!389472)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10910 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21522)

(assert (=> b!250709 (= lt!389472 (appendNBitsLoop!0 (_2!11686 lt!389465) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!250709 (validate_offset_bits!1 ((_ sign_extend 32) (size!5994 (buf!6490 (_2!11686 lt!389465)))) ((_ sign_extend 32) (currentByte!11930 (_2!11686 lt!389465))) ((_ sign_extend 32) (currentBit!11925 (_2!11686 lt!389465))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!389470 () Unit!18127)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10910 BitStream!10910 (_ BitVec 64) (_ BitVec 64)) Unit!18127)

(assert (=> b!250709 (= lt!389470 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11686 lt!389465) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!173756 () Bool)

(assert (=> b!250709 e!173756))

(declare-fun res!209901 () Bool)

(assert (=> b!250709 (=> (not res!209901) (not e!173756))))

(assert (=> b!250709 (= res!209901 (= (size!5994 (buf!6490 thiss!1005)) (size!5994 (buf!6490 (_2!11686 lt!389465)))))))

(declare-fun appendBit!0 (BitStream!10910 Bool) tuple2!21522)

(assert (=> b!250709 (= lt!389465 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!250710 () Bool)

(assert (=> b!250710 (= e!173757 e!173762)))

(declare-fun res!209906 () Bool)

(assert (=> b!250710 (=> (not res!209906) (not e!173762))))

(assert (=> b!250710 (= res!209906 (= (bitIndex!0 (size!5994 (buf!6490 (_2!11686 lt!389472))) (currentByte!11930 (_2!11686 lt!389472)) (currentBit!11925 (_2!11686 lt!389472))) (bvadd (bitIndex!0 (size!5994 (buf!6490 (_2!11686 lt!389465))) (currentByte!11930 (_2!11686 lt!389465)) (currentBit!11925 (_2!11686 lt!389465))) lt!389473)))))

(assert (=> b!250710 (= lt!389473 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!250711 () Bool)

(declare-fun res!209900 () Bool)

(assert (=> b!250711 (=> (not res!209900) (not e!173760))))

(assert (=> b!250711 (= res!209900 (validate_offset_bits!1 ((_ sign_extend 32) (size!5994 (buf!6490 thiss!1005))) ((_ sign_extend 32) (currentByte!11930 thiss!1005)) ((_ sign_extend 32) (currentBit!11925 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!250712 () Bool)

(assert (=> b!250712 (= e!173756 e!173753)))

(declare-fun res!209903 () Bool)

(assert (=> b!250712 (=> (not res!209903) (not e!173753))))

(declare-fun lt!389468 () (_ BitVec 64))

(assert (=> b!250712 (= res!209903 (= lt!389467 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!389468)))))

(assert (=> b!250712 (= lt!389467 (bitIndex!0 (size!5994 (buf!6490 (_2!11686 lt!389465))) (currentByte!11930 (_2!11686 lt!389465)) (currentBit!11925 (_2!11686 lt!389465))))))

(assert (=> b!250712 (= lt!389468 (bitIndex!0 (size!5994 (buf!6490 thiss!1005)) (currentByte!11930 thiss!1005) (currentBit!11925 thiss!1005)))))

(assert (= (and start!53848 res!209910) b!250711))

(assert (= (and b!250711 res!209900) b!250707))

(assert (= (and b!250707 res!209908) b!250709))

(assert (= (and b!250709 res!209901) b!250712))

(assert (= (and b!250712 res!209903) b!250700))

(assert (= (and b!250700 res!209899) b!250703))

(assert (= (and b!250703 res!209909) b!250702))

(assert (= (and b!250709 res!209907) b!250710))

(assert (= (and b!250710 res!209906) b!250701))

(assert (= (and b!250701 res!209904) b!250706))

(assert (= (and b!250709 res!209902) b!250704))

(assert (= (and b!250709 (not res!209905)) b!250708))

(assert (= start!53848 b!250705))

(declare-fun m!377269 () Bool)

(assert (=> b!250703 m!377269))

(assert (=> b!250703 m!377269))

(declare-fun m!377271 () Bool)

(assert (=> b!250703 m!377271))

(declare-fun m!377273 () Bool)

(assert (=> b!250710 m!377273))

(declare-fun m!377275 () Bool)

(assert (=> b!250710 m!377275))

(declare-fun m!377277 () Bool)

(assert (=> b!250709 m!377277))

(declare-fun m!377279 () Bool)

(assert (=> b!250709 m!377279))

(declare-fun m!377281 () Bool)

(assert (=> b!250709 m!377281))

(declare-fun m!377283 () Bool)

(assert (=> b!250709 m!377283))

(declare-fun m!377285 () Bool)

(assert (=> b!250709 m!377285))

(declare-fun m!377287 () Bool)

(assert (=> b!250709 m!377287))

(declare-fun m!377289 () Bool)

(assert (=> b!250709 m!377289))

(declare-fun m!377291 () Bool)

(assert (=> b!250705 m!377291))

(declare-fun m!377293 () Bool)

(assert (=> start!53848 m!377293))

(declare-fun m!377295 () Bool)

(assert (=> b!250711 m!377295))

(declare-fun m!377297 () Bool)

(assert (=> b!250706 m!377297))

(declare-fun m!377299 () Bool)

(assert (=> b!250706 m!377299))

(declare-fun m!377301 () Bool)

(assert (=> b!250706 m!377301))

(declare-fun m!377303 () Bool)

(assert (=> b!250706 m!377303))

(declare-fun m!377305 () Bool)

(assert (=> b!250700 m!377305))

(declare-fun m!377307 () Bool)

(assert (=> b!250701 m!377307))

(declare-fun m!377309 () Bool)

(assert (=> b!250702 m!377309))

(assert (=> b!250712 m!377275))

(declare-fun m!377311 () Bool)

(assert (=> b!250712 m!377311))

(declare-fun m!377313 () Bool)

(assert (=> b!250708 m!377313))

(declare-fun m!377315 () Bool)

(assert (=> b!250708 m!377315))

(declare-fun m!377317 () Bool)

(assert (=> b!250704 m!377317))

(push 1)

(assert (not b!250709))

(assert (not b!250712))

(assert (not start!53848))

(assert (not b!250702))

(assert (not b!250705))

(assert (not b!250708))

(assert (not b!250700))

(assert (not b!250703))

(assert (not b!250710))

(assert (not b!250706))

(assert (not b!250701))

(assert (not b!250711))

(assert (not b!250704))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!83936 () Bool)

(declare-fun res!209964 () Bool)

(declare-fun e!173797 () Bool)

(assert (=> d!83936 (=> (not res!209964) (not e!173797))))

(assert (=> d!83936 (= res!209964 (= (size!5994 (buf!6490 (_2!11686 lt!389465))) (size!5994 (buf!6490 (_2!11686 lt!389472)))))))

(assert (=> d!83936 (= (isPrefixOf!0 (_2!11686 lt!389465) (_2!11686 lt!389472)) e!173797)))

(declare-fun b!250773 () Bool)

(declare-fun res!209965 () Bool)

(assert (=> b!250773 (=> (not res!209965) (not e!173797))))

(assert (=> b!250773 (= res!209965 (bvsle (bitIndex!0 (size!5994 (buf!6490 (_2!11686 lt!389465))) (currentByte!11930 (_2!11686 lt!389465)) (currentBit!11925 (_2!11686 lt!389465))) (bitIndex!0 (size!5994 (buf!6490 (_2!11686 lt!389472))) (currentByte!11930 (_2!11686 lt!389472)) (currentBit!11925 (_2!11686 lt!389472)))))))

(declare-fun b!250774 () Bool)

(declare-fun e!173796 () Bool)

(assert (=> b!250774 (= e!173797 e!173796)))

(declare-fun res!209966 () Bool)

(assert (=> b!250774 (=> res!209966 e!173796)))

(assert (=> b!250774 (= res!209966 (= (size!5994 (buf!6490 (_2!11686 lt!389465))) #b00000000000000000000000000000000))))

(declare-fun b!250775 () Bool)

(assert (=> b!250775 (= e!173796 (arrayBitRangesEq!0 (buf!6490 (_2!11686 lt!389465)) (buf!6490 (_2!11686 lt!389472)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5994 (buf!6490 (_2!11686 lt!389465))) (currentByte!11930 (_2!11686 lt!389465)) (currentBit!11925 (_2!11686 lt!389465)))))))

(assert (= (and d!83936 res!209964) b!250773))

(assert (= (and b!250773 res!209965) b!250774))

(assert (= (and b!250774 (not res!209966)) b!250775))

(assert (=> b!250773 m!377275))

(assert (=> b!250773 m!377273))

(assert (=> b!250775 m!377275))

(assert (=> b!250775 m!377275))

(declare-fun m!377389 () Bool)

(assert (=> b!250775 m!377389))

(assert (=> b!250701 d!83936))

(declare-fun d!83940 () Bool)

(declare-fun e!173818 () Bool)

(assert (=> d!83940 e!173818))

(declare-fun res!209986 () Bool)

(assert (=> d!83940 (=> (not res!209986) (not e!173818))))

(declare-fun lt!389607 () (_ BitVec 64))

(declare-fun lt!389609 () (_ BitVec 64))

(declare-fun lt!389605 () (_ BitVec 64))

(assert (=> d!83940 (= res!209986 (= lt!389609 (bvsub lt!389605 lt!389607)))))

(assert (=> d!83940 (or (= (bvand lt!389605 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389607 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!389605 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!389605 lt!389607) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!83940 (= lt!389607 (remainingBits!0 ((_ sign_extend 32) (size!5994 (buf!6490 (_2!11686 lt!389465)))) ((_ sign_extend 32) (currentByte!11930 (_2!11686 lt!389465))) ((_ sign_extend 32) (currentBit!11925 (_2!11686 lt!389465)))))))

(declare-fun lt!389610 () (_ BitVec 64))

(declare-fun lt!389606 () (_ BitVec 64))

(assert (=> d!83940 (= lt!389605 (bvmul lt!389610 lt!389606))))

(assert (=> d!83940 (or (= lt!389610 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!389606 (bvsdiv (bvmul lt!389610 lt!389606) lt!389610)))))

(assert (=> d!83940 (= lt!389606 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83940 (= lt!389610 ((_ sign_extend 32) (size!5994 (buf!6490 (_2!11686 lt!389465)))))))

(assert (=> d!83940 (= lt!389609 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11930 (_2!11686 lt!389465))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11925 (_2!11686 lt!389465)))))))

(assert (=> d!83940 (invariant!0 (currentBit!11925 (_2!11686 lt!389465)) (currentByte!11930 (_2!11686 lt!389465)) (size!5994 (buf!6490 (_2!11686 lt!389465))))))

(assert (=> d!83940 (= (bitIndex!0 (size!5994 (buf!6490 (_2!11686 lt!389465))) (currentByte!11930 (_2!11686 lt!389465)) (currentBit!11925 (_2!11686 lt!389465))) lt!389609)))

(declare-fun b!250801 () Bool)

(declare-fun res!209987 () Bool)

(assert (=> b!250801 (=> (not res!209987) (not e!173818))))

(assert (=> b!250801 (= res!209987 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!389609))))

(declare-fun b!250802 () Bool)

(declare-fun lt!389608 () (_ BitVec 64))

(assert (=> b!250802 (= e!173818 (bvsle lt!389609 (bvmul lt!389608 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!250802 (or (= lt!389608 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!389608 #b0000000000000000000000000000000000000000000000000000000000001000) lt!389608)))))

(assert (=> b!250802 (= lt!389608 ((_ sign_extend 32) (size!5994 (buf!6490 (_2!11686 lt!389465)))))))

(assert (= (and d!83940 res!209986) b!250801))

(assert (= (and b!250801 res!209987) b!250802))

(declare-fun m!377399 () Bool)

(assert (=> d!83940 m!377399))

(declare-fun m!377403 () Bool)

(assert (=> d!83940 m!377403))

(assert (=> b!250712 d!83940))

(declare-fun d!83942 () Bool)

(declare-fun e!173819 () Bool)

(assert (=> d!83942 e!173819))

(declare-fun res!209988 () Bool)

(assert (=> d!83942 (=> (not res!209988) (not e!173819))))

(declare-fun lt!389611 () (_ BitVec 64))

(declare-fun lt!389615 () (_ BitVec 64))

(declare-fun lt!389613 () (_ BitVec 64))

(assert (=> d!83942 (= res!209988 (= lt!389615 (bvsub lt!389611 lt!389613)))))

(assert (=> d!83942 (or (= (bvand lt!389611 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389613 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!389611 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!389611 lt!389613) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83942 (= lt!389613 (remainingBits!0 ((_ sign_extend 32) (size!5994 (buf!6490 thiss!1005))) ((_ sign_extend 32) (currentByte!11930 thiss!1005)) ((_ sign_extend 32) (currentBit!11925 thiss!1005))))))

(declare-fun lt!389616 () (_ BitVec 64))

(declare-fun lt!389612 () (_ BitVec 64))

(assert (=> d!83942 (= lt!389611 (bvmul lt!389616 lt!389612))))

(assert (=> d!83942 (or (= lt!389616 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!389612 (bvsdiv (bvmul lt!389616 lt!389612) lt!389616)))))

(assert (=> d!83942 (= lt!389612 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83942 (= lt!389616 ((_ sign_extend 32) (size!5994 (buf!6490 thiss!1005))))))

(assert (=> d!83942 (= lt!389615 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11930 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11925 thiss!1005))))))

(assert (=> d!83942 (invariant!0 (currentBit!11925 thiss!1005) (currentByte!11930 thiss!1005) (size!5994 (buf!6490 thiss!1005)))))

(assert (=> d!83942 (= (bitIndex!0 (size!5994 (buf!6490 thiss!1005)) (currentByte!11930 thiss!1005) (currentBit!11925 thiss!1005)) lt!389615)))

(declare-fun b!250803 () Bool)

(declare-fun res!209989 () Bool)

(assert (=> b!250803 (=> (not res!209989) (not e!173819))))

(assert (=> b!250803 (= res!209989 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!389615))))

(declare-fun b!250804 () Bool)

(declare-fun lt!389614 () (_ BitVec 64))

(assert (=> b!250804 (= e!173819 (bvsle lt!389615 (bvmul lt!389614 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!250804 (or (= lt!389614 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!389614 #b0000000000000000000000000000000000000000000000000000000000001000) lt!389614)))))

(assert (=> b!250804 (= lt!389614 ((_ sign_extend 32) (size!5994 (buf!6490 thiss!1005))))))

(assert (= (and d!83942 res!209988) b!250803))

(assert (= (and b!250803 res!209989) b!250804))

(declare-fun m!377411 () Bool)

(assert (=> d!83942 m!377411))

(declare-fun m!377413 () Bool)

(assert (=> d!83942 m!377413))

(assert (=> b!250712 d!83942))

(declare-fun d!83946 () Bool)

(assert (=> d!83946 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11925 thiss!1005) (currentByte!11930 thiss!1005) (size!5994 (buf!6490 thiss!1005))))))

(declare-fun bs!21271 () Bool)

(assert (= bs!21271 d!83946))

(assert (=> bs!21271 m!377413))

(assert (=> start!53848 d!83946))

(declare-fun d!83948 () Bool)

(declare-fun e!173820 () Bool)

(assert (=> d!83948 e!173820))

(declare-fun res!209990 () Bool)

(assert (=> d!83948 (=> (not res!209990) (not e!173820))))

(declare-fun lt!389619 () (_ BitVec 64))

(declare-fun lt!389621 () (_ BitVec 64))

(declare-fun lt!389617 () (_ BitVec 64))

(assert (=> d!83948 (= res!209990 (= lt!389621 (bvsub lt!389617 lt!389619)))))

(assert (=> d!83948 (or (= (bvand lt!389617 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389619 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!389617 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!389617 lt!389619) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83948 (= lt!389619 (remainingBits!0 ((_ sign_extend 32) (size!5994 (buf!6490 (_1!11687 lt!389474)))) ((_ sign_extend 32) (currentByte!11930 (_1!11687 lt!389474))) ((_ sign_extend 32) (currentBit!11925 (_1!11687 lt!389474)))))))

(declare-fun lt!389622 () (_ BitVec 64))

(declare-fun lt!389618 () (_ BitVec 64))

(assert (=> d!83948 (= lt!389617 (bvmul lt!389622 lt!389618))))

(assert (=> d!83948 (or (= lt!389622 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!389618 (bvsdiv (bvmul lt!389622 lt!389618) lt!389622)))))

(assert (=> d!83948 (= lt!389618 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83948 (= lt!389622 ((_ sign_extend 32) (size!5994 (buf!6490 (_1!11687 lt!389474)))))))

(assert (=> d!83948 (= lt!389621 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11930 (_1!11687 lt!389474))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11925 (_1!11687 lt!389474)))))))

(assert (=> d!83948 (invariant!0 (currentBit!11925 (_1!11687 lt!389474)) (currentByte!11930 (_1!11687 lt!389474)) (size!5994 (buf!6490 (_1!11687 lt!389474))))))

(assert (=> d!83948 (= (bitIndex!0 (size!5994 (buf!6490 (_1!11687 lt!389474))) (currentByte!11930 (_1!11687 lt!389474)) (currentBit!11925 (_1!11687 lt!389474))) lt!389621)))

(declare-fun b!250805 () Bool)

(declare-fun res!209991 () Bool)

(assert (=> b!250805 (=> (not res!209991) (not e!173820))))

(assert (=> b!250805 (= res!209991 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!389621))))

(declare-fun b!250806 () Bool)

(declare-fun lt!389620 () (_ BitVec 64))

(assert (=> b!250806 (= e!173820 (bvsle lt!389621 (bvmul lt!389620 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!250806 (or (= lt!389620 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!389620 #b0000000000000000000000000000000000000000000000000000000000001000) lt!389620)))))

(assert (=> b!250806 (= lt!389620 ((_ sign_extend 32) (size!5994 (buf!6490 (_1!11687 lt!389474)))))))

(assert (= (and d!83948 res!209990) b!250805))

(assert (= (and b!250805 res!209991) b!250806))

(declare-fun m!377415 () Bool)

(assert (=> d!83948 m!377415))

(declare-fun m!377417 () Bool)

(assert (=> d!83948 m!377417))

(assert (=> b!250702 d!83948))

(declare-fun d!83950 () Bool)

(declare-fun res!209992 () Bool)

(declare-fun e!173822 () Bool)

(assert (=> d!83950 (=> (not res!209992) (not e!173822))))

(assert (=> d!83950 (= res!209992 (= (size!5994 (buf!6490 thiss!1005)) (size!5994 (buf!6490 (_2!11686 lt!389465)))))))

(assert (=> d!83950 (= (isPrefixOf!0 thiss!1005 (_2!11686 lt!389465)) e!173822)))

(declare-fun b!250807 () Bool)

(declare-fun res!209993 () Bool)

(assert (=> b!250807 (=> (not res!209993) (not e!173822))))

(assert (=> b!250807 (= res!209993 (bvsle (bitIndex!0 (size!5994 (buf!6490 thiss!1005)) (currentByte!11930 thiss!1005) (currentBit!11925 thiss!1005)) (bitIndex!0 (size!5994 (buf!6490 (_2!11686 lt!389465))) (currentByte!11930 (_2!11686 lt!389465)) (currentBit!11925 (_2!11686 lt!389465)))))))

(declare-fun b!250808 () Bool)

(declare-fun e!173821 () Bool)

(assert (=> b!250808 (= e!173822 e!173821)))

(declare-fun res!209994 () Bool)

(assert (=> b!250808 (=> res!209994 e!173821)))

(assert (=> b!250808 (= res!209994 (= (size!5994 (buf!6490 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!250809 () Bool)

(assert (=> b!250809 (= e!173821 (arrayBitRangesEq!0 (buf!6490 thiss!1005) (buf!6490 (_2!11686 lt!389465)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5994 (buf!6490 thiss!1005)) (currentByte!11930 thiss!1005) (currentBit!11925 thiss!1005))))))

(assert (= (and d!83950 res!209992) b!250807))

(assert (= (and b!250807 res!209993) b!250808))

(assert (= (and b!250808 (not res!209994)) b!250809))

(assert (=> b!250807 m!377311))

(assert (=> b!250807 m!377275))

(assert (=> b!250809 m!377311))

(assert (=> b!250809 m!377311))

(declare-fun m!377419 () Bool)

(assert (=> b!250809 m!377419))

(assert (=> b!250700 d!83950))

(declare-fun d!83952 () Bool)

(assert (=> d!83952 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5994 (buf!6490 thiss!1005))) ((_ sign_extend 32) (currentByte!11930 thiss!1005)) ((_ sign_extend 32) (currentBit!11925 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5994 (buf!6490 thiss!1005))) ((_ sign_extend 32) (currentByte!11930 thiss!1005)) ((_ sign_extend 32) (currentBit!11925 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21272 () Bool)

(assert (= bs!21272 d!83952))

(assert (=> bs!21272 m!377411))

(assert (=> b!250711 d!83952))

(declare-fun d!83954 () Bool)

(assert (=> d!83954 (= (invariant!0 (currentBit!11925 thiss!1005) (currentByte!11930 thiss!1005) (size!5994 (buf!6490 (_2!11686 lt!389465)))) (and (bvsge (currentBit!11925 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11925 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11930 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11930 thiss!1005) (size!5994 (buf!6490 (_2!11686 lt!389465)))) (and (= (currentBit!11925 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11930 thiss!1005) (size!5994 (buf!6490 (_2!11686 lt!389465))))))))))

(assert (=> b!250704 d!83954))

(declare-fun d!83956 () Bool)

(declare-datatypes ((tuple2!21532 0))(
  ( (tuple2!21533 (_1!11693 Bool) (_2!11693 BitStream!10910)) )
))
(declare-fun lt!389641 () tuple2!21532)

(declare-fun readBit!0 (BitStream!10910) tuple2!21532)

(assert (=> d!83956 (= lt!389641 (readBit!0 (readerFrom!0 (_2!11686 lt!389465) (currentBit!11925 thiss!1005) (currentByte!11930 thiss!1005))))))

(assert (=> d!83956 (= (readBitPure!0 (readerFrom!0 (_2!11686 lt!389465) (currentBit!11925 thiss!1005) (currentByte!11930 thiss!1005))) (tuple2!21525 (_2!11693 lt!389641) (_1!11693 lt!389641)))))

(declare-fun bs!21273 () Bool)

(assert (= bs!21273 d!83956))

(assert (=> bs!21273 m!377269))

(declare-fun m!377421 () Bool)

(assert (=> bs!21273 m!377421))

(assert (=> b!250703 d!83956))

(declare-fun d!83958 () Bool)

(declare-fun e!173833 () Bool)

(assert (=> d!83958 e!173833))

(declare-fun res!210014 () Bool)

(assert (=> d!83958 (=> (not res!210014) (not e!173833))))

(assert (=> d!83958 (= res!210014 (invariant!0 (currentBit!11925 (_2!11686 lt!389465)) (currentByte!11930 (_2!11686 lt!389465)) (size!5994 (buf!6490 (_2!11686 lt!389465)))))))

(assert (=> d!83958 (= (readerFrom!0 (_2!11686 lt!389465) (currentBit!11925 thiss!1005) (currentByte!11930 thiss!1005)) (BitStream!10911 (buf!6490 (_2!11686 lt!389465)) (currentByte!11930 thiss!1005) (currentBit!11925 thiss!1005)))))

(declare-fun b!250828 () Bool)

(assert (=> b!250828 (= e!173833 (invariant!0 (currentBit!11925 thiss!1005) (currentByte!11930 thiss!1005) (size!5994 (buf!6490 (_2!11686 lt!389465)))))))

(assert (= (and d!83958 res!210014) b!250828))

(assert (=> d!83958 m!377403))

(assert (=> b!250828 m!377317))

(assert (=> b!250703 d!83958))

(declare-fun d!83960 () Bool)

(assert (=> d!83960 (= (array_inv!5735 (buf!6490 thiss!1005)) (bvsge (size!5994 (buf!6490 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!250705 d!83960))

(declare-fun d!83964 () Bool)

(declare-fun lt!389685 () tuple2!21532)

(declare-fun checkBitsLoop!0 (BitStream!10910 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21532)

(assert (=> d!83964 (= lt!389685 (checkBitsLoop!0 (_1!11688 lt!389471) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!83964 (= (checkBitsLoopPure!0 (_1!11688 lt!389471) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21525 (_2!11693 lt!389685) (_1!11693 lt!389685)))))

(declare-fun bs!21275 () Bool)

(assert (= bs!21275 d!83964))

(declare-fun m!377451 () Bool)

(assert (=> bs!21275 m!377451))

(assert (=> b!250706 d!83964))

(declare-fun d!83976 () Bool)

(assert (=> d!83976 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5994 (buf!6490 (_2!11686 lt!389472)))) ((_ sign_extend 32) (currentByte!11930 (_2!11686 lt!389465))) ((_ sign_extend 32) (currentBit!11925 (_2!11686 lt!389465))) lt!389473) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5994 (buf!6490 (_2!11686 lt!389472)))) ((_ sign_extend 32) (currentByte!11930 (_2!11686 lt!389465))) ((_ sign_extend 32) (currentBit!11925 (_2!11686 lt!389465)))) lt!389473))))

(declare-fun bs!21276 () Bool)

(assert (= bs!21276 d!83976))

(declare-fun m!377453 () Bool)

(assert (=> bs!21276 m!377453))

(assert (=> b!250706 d!83976))

(declare-fun d!83978 () Bool)

(assert (=> d!83978 (validate_offset_bits!1 ((_ sign_extend 32) (size!5994 (buf!6490 (_2!11686 lt!389472)))) ((_ sign_extend 32) (currentByte!11930 (_2!11686 lt!389465))) ((_ sign_extend 32) (currentBit!11925 (_2!11686 lt!389465))) lt!389473)))

(declare-fun lt!389694 () Unit!18127)

(declare-fun choose!9 (BitStream!10910 array!13664 (_ BitVec 64) BitStream!10910) Unit!18127)

(assert (=> d!83978 (= lt!389694 (choose!9 (_2!11686 lt!389465) (buf!6490 (_2!11686 lt!389472)) lt!389473 (BitStream!10911 (buf!6490 (_2!11686 lt!389472)) (currentByte!11930 (_2!11686 lt!389465)) (currentBit!11925 (_2!11686 lt!389465)))))))

(assert (=> d!83978 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11686 lt!389465) (buf!6490 (_2!11686 lt!389472)) lt!389473) lt!389694)))

(declare-fun bs!21279 () Bool)

(assert (= bs!21279 d!83978))

(assert (=> bs!21279 m!377299))

(declare-fun m!377463 () Bool)

(assert (=> bs!21279 m!377463))

(assert (=> b!250706 d!83978))

(declare-fun b!250900 () Bool)

(declare-fun e!173881 () Unit!18127)

(declare-fun lt!389789 () Unit!18127)

(assert (=> b!250900 (= e!173881 lt!389789)))

(declare-fun lt!389785 () (_ BitVec 64))

(assert (=> b!250900 (= lt!389785 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!389781 () (_ BitVec 64))

(assert (=> b!250900 (= lt!389781 (bitIndex!0 (size!5994 (buf!6490 (_2!11686 lt!389465))) (currentByte!11930 (_2!11686 lt!389465)) (currentBit!11925 (_2!11686 lt!389465))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13664 array!13664 (_ BitVec 64) (_ BitVec 64)) Unit!18127)

(assert (=> b!250900 (= lt!389789 (arrayBitRangesEqSymmetric!0 (buf!6490 (_2!11686 lt!389465)) (buf!6490 (_2!11686 lt!389472)) lt!389785 lt!389781))))

(assert (=> b!250900 (arrayBitRangesEq!0 (buf!6490 (_2!11686 lt!389472)) (buf!6490 (_2!11686 lt!389465)) lt!389785 lt!389781)))

(declare-fun b!250901 () Bool)

(declare-fun res!210078 () Bool)

(declare-fun e!173880 () Bool)

(assert (=> b!250901 (=> (not res!210078) (not e!173880))))

(declare-fun lt!389780 () tuple2!21526)

(assert (=> b!250901 (= res!210078 (isPrefixOf!0 (_1!11688 lt!389780) (_2!11686 lt!389465)))))

(declare-fun b!250902 () Bool)

(declare-fun res!210079 () Bool)

(assert (=> b!250902 (=> (not res!210079) (not e!173880))))

(assert (=> b!250902 (= res!210079 (isPrefixOf!0 (_2!11688 lt!389780) (_2!11686 lt!389472)))))

(declare-fun d!83988 () Bool)

(assert (=> d!83988 e!173880))

(declare-fun res!210077 () Bool)

(assert (=> d!83988 (=> (not res!210077) (not e!173880))))

(assert (=> d!83988 (= res!210077 (isPrefixOf!0 (_1!11688 lt!389780) (_2!11688 lt!389780)))))

(declare-fun lt!389774 () BitStream!10910)

(assert (=> d!83988 (= lt!389780 (tuple2!21527 lt!389774 (_2!11686 lt!389472)))))

(declare-fun lt!389776 () Unit!18127)

(declare-fun lt!389773 () Unit!18127)

(assert (=> d!83988 (= lt!389776 lt!389773)))

(assert (=> d!83988 (isPrefixOf!0 lt!389774 (_2!11686 lt!389472))))

(assert (=> d!83988 (= lt!389773 (lemmaIsPrefixTransitive!0 lt!389774 (_2!11686 lt!389472) (_2!11686 lt!389472)))))

(declare-fun lt!389778 () Unit!18127)

(declare-fun lt!389787 () Unit!18127)

(assert (=> d!83988 (= lt!389778 lt!389787)))

(assert (=> d!83988 (isPrefixOf!0 lt!389774 (_2!11686 lt!389472))))

(assert (=> d!83988 (= lt!389787 (lemmaIsPrefixTransitive!0 lt!389774 (_2!11686 lt!389465) (_2!11686 lt!389472)))))

(declare-fun lt!389788 () Unit!18127)

(assert (=> d!83988 (= lt!389788 e!173881)))

(declare-fun c!11608 () Bool)

(assert (=> d!83988 (= c!11608 (not (= (size!5994 (buf!6490 (_2!11686 lt!389465))) #b00000000000000000000000000000000)))))

(declare-fun lt!389786 () Unit!18127)

(declare-fun lt!389779 () Unit!18127)

(assert (=> d!83988 (= lt!389786 lt!389779)))

(assert (=> d!83988 (isPrefixOf!0 (_2!11686 lt!389472) (_2!11686 lt!389472))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10910) Unit!18127)

(assert (=> d!83988 (= lt!389779 (lemmaIsPrefixRefl!0 (_2!11686 lt!389472)))))

(declare-fun lt!389777 () Unit!18127)

(declare-fun lt!389775 () Unit!18127)

(assert (=> d!83988 (= lt!389777 lt!389775)))

(assert (=> d!83988 (= lt!389775 (lemmaIsPrefixRefl!0 (_2!11686 lt!389472)))))

(declare-fun lt!389783 () Unit!18127)

(declare-fun lt!389771 () Unit!18127)

(assert (=> d!83988 (= lt!389783 lt!389771)))

(assert (=> d!83988 (isPrefixOf!0 lt!389774 lt!389774)))

(assert (=> d!83988 (= lt!389771 (lemmaIsPrefixRefl!0 lt!389774))))

(declare-fun lt!389784 () Unit!18127)

(declare-fun lt!389782 () Unit!18127)

(assert (=> d!83988 (= lt!389784 lt!389782)))

(assert (=> d!83988 (isPrefixOf!0 (_2!11686 lt!389465) (_2!11686 lt!389465))))

(assert (=> d!83988 (= lt!389782 (lemmaIsPrefixRefl!0 (_2!11686 lt!389465)))))

(assert (=> d!83988 (= lt!389774 (BitStream!10911 (buf!6490 (_2!11686 lt!389472)) (currentByte!11930 (_2!11686 lt!389465)) (currentBit!11925 (_2!11686 lt!389465))))))

(assert (=> d!83988 (isPrefixOf!0 (_2!11686 lt!389465) (_2!11686 lt!389472))))

(assert (=> d!83988 (= (reader!0 (_2!11686 lt!389465) (_2!11686 lt!389472)) lt!389780)))

(declare-fun b!250903 () Bool)

(declare-fun Unit!18130 () Unit!18127)

(assert (=> b!250903 (= e!173881 Unit!18130)))

(declare-fun lt!389790 () (_ BitVec 64))

(declare-fun lt!389772 () (_ BitVec 64))

(declare-fun b!250904 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!10910 (_ BitVec 64)) BitStream!10910)

(assert (=> b!250904 (= e!173880 (= (_1!11688 lt!389780) (withMovedBitIndex!0 (_2!11688 lt!389780) (bvsub lt!389790 lt!389772))))))

(assert (=> b!250904 (or (= (bvand lt!389790 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389772 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!389790 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!389790 lt!389772) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!250904 (= lt!389772 (bitIndex!0 (size!5994 (buf!6490 (_2!11686 lt!389472))) (currentByte!11930 (_2!11686 lt!389472)) (currentBit!11925 (_2!11686 lt!389472))))))

(assert (=> b!250904 (= lt!389790 (bitIndex!0 (size!5994 (buf!6490 (_2!11686 lt!389465))) (currentByte!11930 (_2!11686 lt!389465)) (currentBit!11925 (_2!11686 lt!389465))))))

(assert (= (and d!83988 c!11608) b!250900))

(assert (= (and d!83988 (not c!11608)) b!250903))

(assert (= (and d!83988 res!210077) b!250901))

(assert (= (and b!250901 res!210078) b!250902))

(assert (= (and b!250902 res!210079) b!250904))

(declare-fun m!377503 () Bool)

(assert (=> b!250901 m!377503))

(assert (=> b!250900 m!377275))

(declare-fun m!377505 () Bool)

(assert (=> b!250900 m!377505))

(declare-fun m!377507 () Bool)

(assert (=> b!250900 m!377507))

(declare-fun m!377509 () Bool)

(assert (=> d!83988 m!377509))

(declare-fun m!377511 () Bool)

(assert (=> d!83988 m!377511))

(declare-fun m!377513 () Bool)

(assert (=> d!83988 m!377513))

(declare-fun m!377515 () Bool)

(assert (=> d!83988 m!377515))

(assert (=> d!83988 m!377307))

(declare-fun m!377517 () Bool)

(assert (=> d!83988 m!377517))

(declare-fun m!377519 () Bool)

(assert (=> d!83988 m!377519))

(declare-fun m!377521 () Bool)

(assert (=> d!83988 m!377521))

(declare-fun m!377523 () Bool)

(assert (=> d!83988 m!377523))

(declare-fun m!377525 () Bool)

(assert (=> d!83988 m!377525))

(declare-fun m!377527 () Bool)

(assert (=> d!83988 m!377527))

(declare-fun m!377529 () Bool)

(assert (=> b!250902 m!377529))

(declare-fun m!377531 () Bool)

(assert (=> b!250904 m!377531))

(assert (=> b!250904 m!377273))

(assert (=> b!250904 m!377275))

(assert (=> b!250706 d!83988))

(declare-fun d!84006 () Bool)

(assert (=> d!84006 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!5994 (buf!6490 (_2!11686 lt!389465)))) ((_ sign_extend 32) (currentByte!11930 thiss!1005)) ((_ sign_extend 32) (currentBit!11925 thiss!1005))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5994 (buf!6490 (_2!11686 lt!389465)))) ((_ sign_extend 32) (currentByte!11930 thiss!1005)) ((_ sign_extend 32) (currentBit!11925 thiss!1005))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!21281 () Bool)

(assert (= bs!21281 d!84006))

(declare-fun m!377533 () Bool)

(assert (=> bs!21281 m!377533))

(assert (=> b!250709 d!84006))

(declare-fun b!250928 () Bool)

(declare-fun res!210105 () Bool)

(declare-fun e!173895 () Bool)

(assert (=> b!250928 (=> (not res!210105) (not e!173895))))

(declare-fun lt!389835 () tuple2!21522)

(assert (=> b!250928 (= res!210105 (isPrefixOf!0 (_2!11686 lt!389465) (_2!11686 lt!389835)))))

(declare-fun b!250930 () Bool)

(declare-fun e!173894 () Bool)

(declare-fun lt!389840 () (_ BitVec 64))

(assert (=> b!250930 (= e!173894 (validate_offset_bits!1 ((_ sign_extend 32) (size!5994 (buf!6490 (_2!11686 lt!389465)))) ((_ sign_extend 32) (currentByte!11930 (_2!11686 lt!389465))) ((_ sign_extend 32) (currentBit!11925 (_2!11686 lt!389465))) lt!389840))))

(declare-fun b!250929 () Bool)

(declare-fun lt!389837 () tuple2!21524)

(declare-fun lt!389839 () tuple2!21526)

(assert (=> b!250929 (= e!173895 (and (_2!11687 lt!389837) (= (_1!11687 lt!389837) (_2!11688 lt!389839))))))

(assert (=> b!250929 (= lt!389837 (checkBitsLoopPure!0 (_1!11688 lt!389839) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!389834 () Unit!18127)

(declare-fun lt!389833 () Unit!18127)

(assert (=> b!250929 (= lt!389834 lt!389833)))

(assert (=> b!250929 (validate_offset_bits!1 ((_ sign_extend 32) (size!5994 (buf!6490 (_2!11686 lt!389835)))) ((_ sign_extend 32) (currentByte!11930 (_2!11686 lt!389465))) ((_ sign_extend 32) (currentBit!11925 (_2!11686 lt!389465))) lt!389840)))

(assert (=> b!250929 (= lt!389833 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11686 lt!389465) (buf!6490 (_2!11686 lt!389835)) lt!389840))))

(assert (=> b!250929 e!173894))

(declare-fun res!210103 () Bool)

(assert (=> b!250929 (=> (not res!210103) (not e!173894))))

(assert (=> b!250929 (= res!210103 (and (= (size!5994 (buf!6490 (_2!11686 lt!389465))) (size!5994 (buf!6490 (_2!11686 lt!389835)))) (bvsge lt!389840 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!250929 (= lt!389840 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!250929 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!250929 (= lt!389839 (reader!0 (_2!11686 lt!389465) (_2!11686 lt!389835)))))

(declare-fun d!84008 () Bool)

(assert (=> d!84008 e!173895))

(declare-fun res!210102 () Bool)

(assert (=> d!84008 (=> (not res!210102) (not e!173895))))

(assert (=> d!84008 (= res!210102 (= (size!5994 (buf!6490 (_2!11686 lt!389465))) (size!5994 (buf!6490 (_2!11686 lt!389835)))))))

(declare-fun choose!51 (BitStream!10910 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21522)

(assert (=> d!84008 (= lt!389835 (choose!51 (_2!11686 lt!389465) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!84008 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!84008 (= (appendNBitsLoop!0 (_2!11686 lt!389465) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!389835)))

(declare-fun b!250927 () Bool)

(declare-fun res!210104 () Bool)

(assert (=> b!250927 (=> (not res!210104) (not e!173895))))

(declare-fun lt!389838 () (_ BitVec 64))

(declare-fun lt!389836 () (_ BitVec 64))

(assert (=> b!250927 (= res!210104 (= (bitIndex!0 (size!5994 (buf!6490 (_2!11686 lt!389835))) (currentByte!11930 (_2!11686 lt!389835)) (currentBit!11925 (_2!11686 lt!389835))) (bvadd lt!389836 lt!389838)))))

(assert (=> b!250927 (or (not (= (bvand lt!389836 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389838 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!389836 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!389836 lt!389838) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!250927 (= lt!389838 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!250927 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!250927 (= lt!389836 (bitIndex!0 (size!5994 (buf!6490 (_2!11686 lt!389465))) (currentByte!11930 (_2!11686 lt!389465)) (currentBit!11925 (_2!11686 lt!389465))))))

(assert (= (and d!84008 res!210102) b!250927))

(assert (= (and b!250927 res!210104) b!250928))

(assert (= (and b!250928 res!210105) b!250929))

(assert (= (and b!250929 res!210103) b!250930))

(declare-fun m!377553 () Bool)

(assert (=> b!250929 m!377553))

(declare-fun m!377555 () Bool)

(assert (=> b!250929 m!377555))

(declare-fun m!377557 () Bool)

(assert (=> b!250929 m!377557))

(declare-fun m!377559 () Bool)

(assert (=> b!250929 m!377559))

(declare-fun m!377561 () Bool)

(assert (=> b!250928 m!377561))

(declare-fun m!377563 () Bool)

(assert (=> b!250927 m!377563))

(assert (=> b!250927 m!377275))

(declare-fun m!377567 () Bool)

(assert (=> b!250930 m!377567))

(declare-fun m!377569 () Bool)

(assert (=> d!84008 m!377569))

(assert (=> b!250709 d!84008))

(declare-fun d!84016 () Bool)

(assert (=> d!84016 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5994 (buf!6490 (_2!11686 lt!389465)))) ((_ sign_extend 32) (currentByte!11930 (_2!11686 lt!389465))) ((_ sign_extend 32) (currentBit!11925 (_2!11686 lt!389465))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5994 (buf!6490 (_2!11686 lt!389465)))) ((_ sign_extend 32) (currentByte!11930 (_2!11686 lt!389465))) ((_ sign_extend 32) (currentBit!11925 (_2!11686 lt!389465)))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!21283 () Bool)

(assert (= bs!21283 d!84016))

(assert (=> bs!21283 m!377399))

(assert (=> b!250709 d!84016))

(declare-fun d!84020 () Bool)

(declare-fun res!210110 () Bool)

(declare-fun e!173900 () Bool)

(assert (=> d!84020 (=> (not res!210110) (not e!173900))))

(assert (=> d!84020 (= res!210110 (= (size!5994 (buf!6490 thiss!1005)) (size!5994 (buf!6490 (_2!11686 lt!389472)))))))

(assert (=> d!84020 (= (isPrefixOf!0 thiss!1005 (_2!11686 lt!389472)) e!173900)))

(declare-fun b!250935 () Bool)

(declare-fun res!210111 () Bool)

(assert (=> b!250935 (=> (not res!210111) (not e!173900))))

(assert (=> b!250935 (= res!210111 (bvsle (bitIndex!0 (size!5994 (buf!6490 thiss!1005)) (currentByte!11930 thiss!1005) (currentBit!11925 thiss!1005)) (bitIndex!0 (size!5994 (buf!6490 (_2!11686 lt!389472))) (currentByte!11930 (_2!11686 lt!389472)) (currentBit!11925 (_2!11686 lt!389472)))))))

(declare-fun b!250936 () Bool)

(declare-fun e!173899 () Bool)

(assert (=> b!250936 (= e!173900 e!173899)))

(declare-fun res!210112 () Bool)

(assert (=> b!250936 (=> res!210112 e!173899)))

(assert (=> b!250936 (= res!210112 (= (size!5994 (buf!6490 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!250937 () Bool)

(assert (=> b!250937 (= e!173899 (arrayBitRangesEq!0 (buf!6490 thiss!1005) (buf!6490 (_2!11686 lt!389472)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5994 (buf!6490 thiss!1005)) (currentByte!11930 thiss!1005) (currentBit!11925 thiss!1005))))))

(assert (= (and d!84020 res!210110) b!250935))

(assert (= (and b!250935 res!210111) b!250936))

(assert (= (and b!250936 (not res!210112)) b!250937))

(assert (=> b!250935 m!377311))

(assert (=> b!250935 m!377273))

(assert (=> b!250937 m!377311))

(assert (=> b!250937 m!377311))

(declare-fun m!377571 () Bool)

(assert (=> b!250937 m!377571))

(assert (=> b!250709 d!84020))

(declare-fun d!84022 () Bool)

(assert (=> d!84022 (isPrefixOf!0 thiss!1005 (_2!11686 lt!389472))))

(declare-fun lt!389846 () Unit!18127)

(declare-fun choose!30 (BitStream!10910 BitStream!10910 BitStream!10910) Unit!18127)

(assert (=> d!84022 (= lt!389846 (choose!30 thiss!1005 (_2!11686 lt!389465) (_2!11686 lt!389472)))))

(assert (=> d!84022 (isPrefixOf!0 thiss!1005 (_2!11686 lt!389465))))

(assert (=> d!84022 (= (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11686 lt!389465) (_2!11686 lt!389472)) lt!389846)))

(declare-fun bs!21285 () Bool)

(assert (= bs!21285 d!84022))

(assert (=> bs!21285 m!377287))

(declare-fun m!377573 () Bool)

(assert (=> bs!21285 m!377573))

(assert (=> bs!21285 m!377305))

(assert (=> b!250709 d!84022))

(declare-fun b!250948 () Bool)

(declare-fun res!210123 () Bool)

(declare-fun e!173906 () Bool)

(assert (=> b!250948 (=> (not res!210123) (not e!173906))))

(declare-fun lt!389864 () tuple2!21522)

(assert (=> b!250948 (= res!210123 (isPrefixOf!0 thiss!1005 (_2!11686 lt!389864)))))

(declare-fun d!84026 () Bool)

(assert (=> d!84026 e!173906))

(declare-fun res!210124 () Bool)

(assert (=> d!84026 (=> (not res!210124) (not e!173906))))

(assert (=> d!84026 (= res!210124 (= (size!5994 (buf!6490 thiss!1005)) (size!5994 (buf!6490 (_2!11686 lt!389864)))))))

(declare-fun choose!16 (BitStream!10910 Bool) tuple2!21522)

(assert (=> d!84026 (= lt!389864 (choose!16 thiss!1005 bit!26))))

(assert (=> d!84026 (validate_offset_bit!0 ((_ sign_extend 32) (size!5994 (buf!6490 thiss!1005))) ((_ sign_extend 32) (currentByte!11930 thiss!1005)) ((_ sign_extend 32) (currentBit!11925 thiss!1005)))))

(assert (=> d!84026 (= (appendBit!0 thiss!1005 bit!26) lt!389864)))

(declare-fun b!250950 () Bool)

(declare-fun e!173905 () Bool)

(declare-fun lt!389862 () tuple2!21524)

(assert (=> b!250950 (= e!173905 (= (bitIndex!0 (size!5994 (buf!6490 (_1!11687 lt!389862))) (currentByte!11930 (_1!11687 lt!389862)) (currentBit!11925 (_1!11687 lt!389862))) (bitIndex!0 (size!5994 (buf!6490 (_2!11686 lt!389864))) (currentByte!11930 (_2!11686 lt!389864)) (currentBit!11925 (_2!11686 lt!389864)))))))

(declare-fun b!250949 () Bool)

(assert (=> b!250949 (= e!173906 e!173905)))

(declare-fun res!210122 () Bool)

(assert (=> b!250949 (=> (not res!210122) (not e!173905))))

(assert (=> b!250949 (= res!210122 (and (= (_2!11687 lt!389862) bit!26) (= (_1!11687 lt!389862) (_2!11686 lt!389864))))))

(assert (=> b!250949 (= lt!389862 (readBitPure!0 (readerFrom!0 (_2!11686 lt!389864) (currentBit!11925 thiss!1005) (currentByte!11930 thiss!1005))))))

(declare-fun b!250947 () Bool)

(declare-fun res!210121 () Bool)

(assert (=> b!250947 (=> (not res!210121) (not e!173906))))

(declare-fun lt!389865 () (_ BitVec 64))

(declare-fun lt!389863 () (_ BitVec 64))

(assert (=> b!250947 (= res!210121 (= (bitIndex!0 (size!5994 (buf!6490 (_2!11686 lt!389864))) (currentByte!11930 (_2!11686 lt!389864)) (currentBit!11925 (_2!11686 lt!389864))) (bvadd lt!389863 lt!389865)))))

(assert (=> b!250947 (or (not (= (bvand lt!389863 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389865 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!389863 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!389863 lt!389865) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!250947 (= lt!389865 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!250947 (= lt!389863 (bitIndex!0 (size!5994 (buf!6490 thiss!1005)) (currentByte!11930 thiss!1005) (currentBit!11925 thiss!1005)))))

(assert (= (and d!84026 res!210124) b!250947))

(assert (= (and b!250947 res!210121) b!250948))

(assert (= (and b!250948 res!210123) b!250949))

(assert (= (and b!250949 res!210122) b!250950))

(declare-fun m!377583 () Bool)

(assert (=> b!250948 m!377583))

(declare-fun m!377585 () Bool)

(assert (=> b!250947 m!377585))

(assert (=> b!250947 m!377311))

(declare-fun m!377587 () Bool)

(assert (=> b!250949 m!377587))

(assert (=> b!250949 m!377587))

(declare-fun m!377589 () Bool)

(assert (=> b!250949 m!377589))

(declare-fun m!377591 () Bool)

(assert (=> b!250950 m!377591))

(assert (=> b!250950 m!377585))

(declare-fun m!377593 () Bool)

(assert (=> d!84026 m!377593))

(declare-fun m!377595 () Bool)

(assert (=> d!84026 m!377595))

(assert (=> b!250709 d!84026))

(declare-fun d!84036 () Bool)

(declare-fun e!173909 () Bool)

(assert (=> d!84036 e!173909))

(declare-fun res!210127 () Bool)

(assert (=> d!84036 (=> (not res!210127) (not e!173909))))

(assert (=> d!84036 (= res!210127 (or (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!389868 () Unit!18127)

(declare-fun choose!27 (BitStream!10910 BitStream!10910 (_ BitVec 64) (_ BitVec 64)) Unit!18127)

(assert (=> d!84036 (= lt!389868 (choose!27 thiss!1005 (_2!11686 lt!389465) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!84036 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!297 from!289)))))

(assert (=> d!84036 (= (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11686 lt!389465) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) lt!389868)))

(declare-fun b!250953 () Bool)

(assert (=> b!250953 (= e!173909 (validate_offset_bits!1 ((_ sign_extend 32) (size!5994 (buf!6490 (_2!11686 lt!389465)))) ((_ sign_extend 32) (currentByte!11930 (_2!11686 lt!389465))) ((_ sign_extend 32) (currentBit!11925 (_2!11686 lt!389465))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!84036 res!210127) b!250953))

(declare-fun m!377597 () Bool)

(assert (=> d!84036 m!377597))

(assert (=> b!250953 m!377279))

(assert (=> b!250709 d!84036))

(declare-fun d!84038 () Bool)

(declare-fun e!173910 () Bool)

(assert (=> d!84038 e!173910))

(declare-fun res!210128 () Bool)

(assert (=> d!84038 (=> (not res!210128) (not e!173910))))

(declare-fun lt!389871 () (_ BitVec 64))

(declare-fun lt!389873 () (_ BitVec 64))

(declare-fun lt!389869 () (_ BitVec 64))

(assert (=> d!84038 (= res!210128 (= lt!389873 (bvsub lt!389869 lt!389871)))))

(assert (=> d!84038 (or (= (bvand lt!389869 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389871 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!389869 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!389869 lt!389871) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84038 (= lt!389871 (remainingBits!0 ((_ sign_extend 32) (size!5994 (buf!6490 (_2!11686 lt!389472)))) ((_ sign_extend 32) (currentByte!11930 (_2!11686 lt!389472))) ((_ sign_extend 32) (currentBit!11925 (_2!11686 lt!389472)))))))

(declare-fun lt!389874 () (_ BitVec 64))

(declare-fun lt!389870 () (_ BitVec 64))

(assert (=> d!84038 (= lt!389869 (bvmul lt!389874 lt!389870))))

(assert (=> d!84038 (or (= lt!389874 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!389870 (bvsdiv (bvmul lt!389874 lt!389870) lt!389874)))))

(assert (=> d!84038 (= lt!389870 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84038 (= lt!389874 ((_ sign_extend 32) (size!5994 (buf!6490 (_2!11686 lt!389472)))))))

(assert (=> d!84038 (= lt!389873 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11930 (_2!11686 lt!389472))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11925 (_2!11686 lt!389472)))))))

(assert (=> d!84038 (invariant!0 (currentBit!11925 (_2!11686 lt!389472)) (currentByte!11930 (_2!11686 lt!389472)) (size!5994 (buf!6490 (_2!11686 lt!389472))))))

(assert (=> d!84038 (= (bitIndex!0 (size!5994 (buf!6490 (_2!11686 lt!389472))) (currentByte!11930 (_2!11686 lt!389472)) (currentBit!11925 (_2!11686 lt!389472))) lt!389873)))

(declare-fun b!250954 () Bool)

(declare-fun res!210129 () Bool)

(assert (=> b!250954 (=> (not res!210129) (not e!173910))))

(assert (=> b!250954 (= res!210129 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!389873))))

(declare-fun b!250955 () Bool)

(declare-fun lt!389872 () (_ BitVec 64))

(assert (=> b!250955 (= e!173910 (bvsle lt!389873 (bvmul lt!389872 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!250955 (or (= lt!389872 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!389872 #b0000000000000000000000000000000000000000000000000000000000001000) lt!389872)))))

(assert (=> b!250955 (= lt!389872 ((_ sign_extend 32) (size!5994 (buf!6490 (_2!11686 lt!389472)))))))

(assert (= (and d!84038 res!210128) b!250954))

(assert (= (and b!250954 res!210129) b!250955))

(declare-fun m!377599 () Bool)

(assert (=> d!84038 m!377599))

(declare-fun m!377601 () Bool)

(assert (=> d!84038 m!377601))

(assert (=> b!250710 d!84038))

(assert (=> b!250710 d!83940))

(declare-fun b!250985 () Bool)

(declare-fun e!173932 () Bool)

(declare-fun e!173931 () Bool)

(assert (=> b!250985 (= e!173932 e!173931)))

(declare-fun c!11614 () Bool)

(declare-datatypes ((tuple4!294 0))(
  ( (tuple4!295 (_1!11694 (_ BitVec 32)) (_2!11694 (_ BitVec 32)) (_3!927 (_ BitVec 32)) (_4!147 (_ BitVec 32))) )
))
(declare-fun lt!389942 () tuple4!294)

(assert (=> b!250985 (= c!11614 (= (_3!927 lt!389942) (_4!147 lt!389942)))))

(declare-fun b!250986 () Bool)

(declare-fun e!173933 () Bool)

(assert (=> b!250986 (= e!173933 e!173932)))

(declare-fun res!210150 () Bool)

(assert (=> b!250986 (=> (not res!210150) (not e!173932))))

(declare-fun e!173930 () Bool)

(assert (=> b!250986 (= res!210150 e!173930)))

(declare-fun res!210153 () Bool)

(assert (=> b!250986 (=> res!210153 e!173930)))

(assert (=> b!250986 (= res!210153 (bvsge (_1!11694 lt!389942) (_2!11694 lt!389942)))))

(declare-fun lt!389941 () (_ BitVec 32))

(assert (=> b!250986 (= lt!389941 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!5994 (buf!6490 (_2!11686 lt!389465))) (currentByte!11930 thiss!1005) (currentBit!11925 thiss!1005))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!389943 () (_ BitVec 32))

(assert (=> b!250986 (= lt!389943 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!294)

(assert (=> b!250986 (= lt!389942 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!5994 (buf!6490 (_2!11686 lt!389465))) (currentByte!11930 thiss!1005) (currentBit!11925 thiss!1005)))))))

(declare-fun b!250987 () Bool)

(declare-fun e!173929 () Bool)

(declare-fun call!3966 () Bool)

(assert (=> b!250987 (= e!173929 call!3966)))

(declare-fun b!250988 () Bool)

(declare-fun e!173934 () Bool)

(assert (=> b!250988 (= e!173931 e!173934)))

(declare-fun res!210152 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!250988 (= res!210152 (byteRangesEq!0 (select (arr!6981 (buf!6490 (_2!11686 lt!389465))) (_3!927 lt!389942)) (select (arr!6981 (buf!6490 (_2!11686 lt!389472))) (_3!927 lt!389942)) lt!389943 #b00000000000000000000000000001000))))

(assert (=> b!250988 (=> (not res!210152) (not e!173934))))

(declare-fun b!250989 () Bool)

(declare-fun res!210151 () Bool)

(assert (=> b!250989 (= res!210151 (= lt!389941 #b00000000000000000000000000000000))))

(assert (=> b!250989 (=> res!210151 e!173929)))

(assert (=> b!250989 (= e!173934 e!173929)))

(declare-fun bm!3963 () Bool)

(assert (=> bm!3963 (= call!3966 (byteRangesEq!0 (ite c!11614 (select (arr!6981 (buf!6490 (_2!11686 lt!389465))) (_3!927 lt!389942)) (select (arr!6981 (buf!6490 (_2!11686 lt!389465))) (_4!147 lt!389942))) (ite c!11614 (select (arr!6981 (buf!6490 (_2!11686 lt!389472))) (_3!927 lt!389942)) (select (arr!6981 (buf!6490 (_2!11686 lt!389472))) (_4!147 lt!389942))) (ite c!11614 lt!389943 #b00000000000000000000000000000000) lt!389941))))

(declare-fun d!84040 () Bool)

(declare-fun res!210149 () Bool)

(assert (=> d!84040 (=> res!210149 e!173933)))

(assert (=> d!84040 (= res!210149 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!5994 (buf!6490 (_2!11686 lt!389465))) (currentByte!11930 thiss!1005) (currentBit!11925 thiss!1005)))))))

(assert (=> d!84040 (= (arrayBitRangesEq!0 (buf!6490 (_2!11686 lt!389465)) (buf!6490 (_2!11686 lt!389472)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!5994 (buf!6490 (_2!11686 lt!389465))) (currentByte!11930 thiss!1005) (currentBit!11925 thiss!1005)))) e!173933)))

(declare-fun b!250990 () Bool)

(assert (=> b!250990 (= e!173931 call!3966)))

(declare-fun b!250991 () Bool)

(declare-fun arrayRangesEq!924 (array!13664 array!13664 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!250991 (= e!173930 (arrayRangesEq!924 (buf!6490 (_2!11686 lt!389465)) (buf!6490 (_2!11686 lt!389472)) (_1!11694 lt!389942) (_2!11694 lt!389942)))))

(assert (= (and d!84040 (not res!210149)) b!250986))

(assert (= (and b!250986 (not res!210153)) b!250991))

(assert (= (and b!250986 res!210150) b!250985))

(assert (= (and b!250985 c!11614) b!250990))

(assert (= (and b!250985 (not c!11614)) b!250988))

(assert (= (and b!250988 res!210152) b!250989))

(assert (= (and b!250989 (not res!210151)) b!250987))

(assert (= (or b!250990 b!250987) bm!3963))

(declare-fun m!377633 () Bool)

(assert (=> b!250986 m!377633))

(declare-fun m!377635 () Bool)

(assert (=> b!250988 m!377635))

(declare-fun m!377637 () Bool)

(assert (=> b!250988 m!377637))

(assert (=> b!250988 m!377635))

(assert (=> b!250988 m!377637))

(declare-fun m!377643 () Bool)

(assert (=> b!250988 m!377643))

(declare-fun m!377645 () Bool)

(assert (=> bm!3963 m!377645))

(assert (=> bm!3963 m!377635))

(declare-fun m!377647 () Bool)

(assert (=> bm!3963 m!377647))

(assert (=> bm!3963 m!377637))

(declare-fun m!377649 () Bool)

(assert (=> bm!3963 m!377649))

(declare-fun m!377651 () Bool)

(assert (=> b!250991 m!377651))

(assert (=> b!250708 d!84040))

(declare-fun d!84046 () Bool)

(declare-fun e!173938 () Bool)

(assert (=> d!84046 e!173938))

(declare-fun res!210159 () Bool)

(assert (=> d!84046 (=> (not res!210159) (not e!173938))))

(declare-fun lt!389952 () (_ BitVec 64))

(declare-fun lt!389950 () (_ BitVec 64))

(declare-fun lt!389954 () (_ BitVec 64))

(assert (=> d!84046 (= res!210159 (= lt!389954 (bvsub lt!389950 lt!389952)))))

(assert (=> d!84046 (or (= (bvand lt!389950 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389952 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!389950 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!389950 lt!389952) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84046 (= lt!389952 (remainingBits!0 ((_ sign_extend 32) (size!5994 (buf!6490 (_2!11686 lt!389465)))) ((_ sign_extend 32) (currentByte!11930 thiss!1005)) ((_ sign_extend 32) (currentBit!11925 thiss!1005))))))

(declare-fun lt!389955 () (_ BitVec 64))

(declare-fun lt!389951 () (_ BitVec 64))

(assert (=> d!84046 (= lt!389950 (bvmul lt!389955 lt!389951))))

(assert (=> d!84046 (or (= lt!389955 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!389951 (bvsdiv (bvmul lt!389955 lt!389951) lt!389955)))))

(assert (=> d!84046 (= lt!389951 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84046 (= lt!389955 ((_ sign_extend 32) (size!5994 (buf!6490 (_2!11686 lt!389465)))))))

(assert (=> d!84046 (= lt!389954 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11930 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11925 thiss!1005))))))

(assert (=> d!84046 (invariant!0 (currentBit!11925 thiss!1005) (currentByte!11930 thiss!1005) (size!5994 (buf!6490 (_2!11686 lt!389465))))))

(assert (=> d!84046 (= (bitIndex!0 (size!5994 (buf!6490 (_2!11686 lt!389465))) (currentByte!11930 thiss!1005) (currentBit!11925 thiss!1005)) lt!389954)))

(declare-fun b!250997 () Bool)

(declare-fun res!210160 () Bool)

(assert (=> b!250997 (=> (not res!210160) (not e!173938))))

(assert (=> b!250997 (= res!210160 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!389954))))

(declare-fun b!250998 () Bool)

(declare-fun lt!389953 () (_ BitVec 64))

(assert (=> b!250998 (= e!173938 (bvsle lt!389954 (bvmul lt!389953 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!250998 (or (= lt!389953 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!389953 #b0000000000000000000000000000000000000000000000000000000000001000) lt!389953)))))

(assert (=> b!250998 (= lt!389953 ((_ sign_extend 32) (size!5994 (buf!6490 (_2!11686 lt!389465)))))))

(assert (= (and d!84046 res!210159) b!250997))

(assert (= (and b!250997 res!210160) b!250998))

(assert (=> d!84046 m!377533))

(assert (=> d!84046 m!377317))

(assert (=> b!250708 d!84046))

(push 1)

(assert (not b!250807))

(assert (not b!250928))

(assert (not b!250950))

(assert (not d!83964))

(assert (not d!83952))

(assert (not b!250935))

(assert (not b!250991))

(assert (not d!84022))

(assert (not b!250947))

(assert (not b!250929))

(assert (not b!250953))

(assert (not b!250773))

(assert (not d!83946))

(assert (not d!83940))

(assert (not d!83942))

(assert (not b!250986))

(assert (not d!83978))

(assert (not b!250948))

(assert (not d!83988))

(assert (not d!84036))

(assert (not b!250775))

(assert (not d!83958))

(assert (not b!250809))

(assert (not b!250828))

(assert (not bm!3963))

(assert (not d!84038))

(assert (not b!250900))

(assert (not b!250930))

(assert (not b!250901))

(assert (not d!84046))

(assert (not d!84006))

(assert (not d!84016))

(assert (not d!83956))

(assert (not d!84008))

(assert (not d!84026))

(assert (not b!250937))

(assert (not b!250904))

(assert (not d!83948))

(assert (not b!250949))

(assert (not b!250927))

(assert (not d!83976))

(assert (not b!250902))

(assert (not b!250988))

(check-sat)

(pop 1)

(push 1)

(check-sat)

