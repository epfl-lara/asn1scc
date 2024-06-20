; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44568 () Bool)

(assert start!44568)

(declare-fun b!212957 () Bool)

(declare-fun res!178959 () Bool)

(declare-fun e!145100 () Bool)

(assert (=> b!212957 (=> res!178959 e!145100)))

(declare-datatypes ((array!10541 0))(
  ( (array!10542 (arr!5560 (Array (_ BitVec 32) (_ BitVec 8))) (size!4630 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8368 0))(
  ( (BitStream!8369 (buf!5159 array!10541) (currentByte!9725 (_ BitVec 32)) (currentBit!9720 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!15166 0))(
  ( (Unit!15167) )
))
(declare-datatypes ((tuple2!18242 0))(
  ( (tuple2!18243 (_1!9776 Unit!15166) (_2!9776 BitStream!8368)) )
))
(declare-fun lt!335733 () tuple2!18242)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!212957 (= res!178959 (not (invariant!0 (currentBit!9720 (_2!9776 lt!335733)) (currentByte!9725 (_2!9776 lt!335733)) (size!4630 (buf!5159 (_2!9776 lt!335733))))))))

(declare-fun b!212958 () Bool)

(declare-fun e!145106 () Bool)

(declare-fun thiss!1204 () BitStream!8368)

(assert (=> b!212958 (= e!145106 (invariant!0 (currentBit!9720 thiss!1204) (currentByte!9725 thiss!1204) (size!4630 (buf!5159 (_2!9776 lt!335733)))))))

(declare-fun b!212959 () Bool)

(declare-fun e!145110 () Bool)

(declare-fun e!145099 () Bool)

(assert (=> b!212959 (= e!145110 e!145099)))

(declare-fun res!178953 () Bool)

(assert (=> b!212959 (=> res!178953 e!145099)))

(declare-datatypes ((tuple2!18244 0))(
  ( (tuple2!18245 (_1!9777 BitStream!8368) (_2!9777 (_ BitVec 64))) )
))
(declare-fun lt!335742 () tuple2!18244)

(declare-datatypes ((tuple2!18246 0))(
  ( (tuple2!18247 (_1!9778 BitStream!8368) (_2!9778 BitStream!8368)) )
))
(declare-fun lt!335741 () tuple2!18246)

(assert (=> b!212959 (= res!178953 (not (= (_1!9777 lt!335742) (_2!9778 lt!335741))))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!335757 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8368 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18244)

(assert (=> b!212959 (= lt!335742 (readNBitsLSBFirstsLoopPure!0 (_1!9778 lt!335741) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!335757))))

(declare-fun lt!335754 () tuple2!18242)

(declare-fun lt!335735 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!212959 (validate_offset_bits!1 ((_ sign_extend 32) (size!4630 (buf!5159 (_2!9776 lt!335733)))) ((_ sign_extend 32) (currentByte!9725 (_2!9776 lt!335754))) ((_ sign_extend 32) (currentBit!9720 (_2!9776 lt!335754))) lt!335735)))

(declare-fun lt!335744 () Unit!15166)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8368 array!10541 (_ BitVec 64)) Unit!15166)

(assert (=> b!212959 (= lt!335744 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9776 lt!335754) (buf!5159 (_2!9776 lt!335733)) lt!335735))))

(assert (=> b!212959 (= lt!335735 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!335731 () (_ BitVec 64))

(declare-datatypes ((tuple2!18248 0))(
  ( (tuple2!18249 (_1!9779 BitStream!8368) (_2!9779 Bool)) )
))
(declare-fun lt!335737 () tuple2!18248)

(declare-fun lt!335734 () (_ BitVec 64))

(assert (=> b!212959 (= lt!335757 (bvor lt!335734 (ite (_2!9779 lt!335737) lt!335731 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!335738 () tuple2!18246)

(declare-fun lt!335753 () tuple2!18244)

(assert (=> b!212959 (= lt!335753 (readNBitsLSBFirstsLoopPure!0 (_1!9778 lt!335738) nBits!348 i!590 lt!335734))))

(declare-fun lt!335751 () (_ BitVec 64))

(assert (=> b!212959 (validate_offset_bits!1 ((_ sign_extend 32) (size!4630 (buf!5159 (_2!9776 lt!335733)))) ((_ sign_extend 32) (currentByte!9725 thiss!1204)) ((_ sign_extend 32) (currentBit!9720 thiss!1204)) lt!335751)))

(declare-fun lt!335729 () Unit!15166)

(assert (=> b!212959 (= lt!335729 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5159 (_2!9776 lt!335733)) lt!335751))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!212959 (= lt!335734 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!335748 () Bool)

(assert (=> b!212959 (= (_2!9779 lt!335737) lt!335748)))

(declare-fun readBitPure!0 (BitStream!8368) tuple2!18248)

(assert (=> b!212959 (= lt!335737 (readBitPure!0 (_1!9778 lt!335738)))))

(declare-fun reader!0 (BitStream!8368 BitStream!8368) tuple2!18246)

(assert (=> b!212959 (= lt!335741 (reader!0 (_2!9776 lt!335754) (_2!9776 lt!335733)))))

(assert (=> b!212959 (= lt!335738 (reader!0 thiss!1204 (_2!9776 lt!335733)))))

(declare-fun e!145104 () Bool)

(assert (=> b!212959 e!145104))

(declare-fun res!178960 () Bool)

(assert (=> b!212959 (=> (not res!178960) (not e!145104))))

(declare-fun lt!335746 () tuple2!18248)

(declare-fun lt!335749 () tuple2!18248)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!212959 (= res!178960 (= (bitIndex!0 (size!4630 (buf!5159 (_1!9779 lt!335746))) (currentByte!9725 (_1!9779 lt!335746)) (currentBit!9720 (_1!9779 lt!335746))) (bitIndex!0 (size!4630 (buf!5159 (_1!9779 lt!335749))) (currentByte!9725 (_1!9779 lt!335749)) (currentBit!9720 (_1!9779 lt!335749)))))))

(declare-fun lt!335756 () Unit!15166)

(declare-fun lt!335736 () BitStream!8368)

(declare-fun readBitPrefixLemma!0 (BitStream!8368 BitStream!8368) Unit!15166)

(assert (=> b!212959 (= lt!335756 (readBitPrefixLemma!0 lt!335736 (_2!9776 lt!335733)))))

(assert (=> b!212959 (= lt!335749 (readBitPure!0 (BitStream!8369 (buf!5159 (_2!9776 lt!335733)) (currentByte!9725 thiss!1204) (currentBit!9720 thiss!1204))))))

(assert (=> b!212959 (= lt!335746 (readBitPure!0 lt!335736))))

(assert (=> b!212959 e!145106))

(declare-fun res!178956 () Bool)

(assert (=> b!212959 (=> (not res!178956) (not e!145106))))

(assert (=> b!212959 (= res!178956 (invariant!0 (currentBit!9720 thiss!1204) (currentByte!9725 thiss!1204) (size!4630 (buf!5159 (_2!9776 lt!335754)))))))

(assert (=> b!212959 (= lt!335736 (BitStream!8369 (buf!5159 (_2!9776 lt!335754)) (currentByte!9725 thiss!1204) (currentBit!9720 thiss!1204)))))

(declare-fun e!145108 () Bool)

(declare-fun lt!335743 () (_ BitVec 64))

(declare-fun lt!335752 () (_ BitVec 64))

(declare-fun b!212960 () Bool)

(assert (=> b!212960 (= e!145108 (or (not (= lt!335743 (bvand ((_ sign_extend 32) nBits!348) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!335743 (bvand lt!335752 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!335759 () (_ BitVec 64))

(assert (=> b!212960 (= lt!335743 (bvand lt!335759 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!212960 (= (size!4630 (buf!5159 thiss!1204)) (size!4630 (buf!5159 (_2!9776 lt!335733))))))

(declare-fun b!212961 () Bool)

(declare-fun res!178942 () Bool)

(declare-fun e!145109 () Bool)

(assert (=> b!212961 (=> (not res!178942) (not e!145109))))

(declare-fun lt!335750 () (_ BitVec 64))

(declare-fun lt!335745 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!8368 (_ BitVec 64)) BitStream!8368)

(assert (=> b!212961 (= res!178942 (= (_1!9778 lt!335741) (withMovedBitIndex!0 (_2!9778 lt!335741) (bvsub lt!335750 lt!335745))))))

(declare-fun b!212962 () Bool)

(declare-fun res!178954 () Bool)

(assert (=> b!212962 (=> res!178954 e!145108)))

(assert (=> b!212962 (= res!178954 (not (= (bitIndex!0 (size!4630 (buf!5159 (_1!9777 lt!335753))) (currentByte!9725 (_1!9777 lt!335753)) (currentBit!9720 (_1!9777 lt!335753))) (bitIndex!0 (size!4630 (buf!5159 (_2!9778 lt!335738))) (currentByte!9725 (_2!9778 lt!335738)) (currentBit!9720 (_2!9778 lt!335738))))))))

(declare-fun b!212963 () Bool)

(declare-fun e!145103 () Bool)

(declare-fun e!145097 () Bool)

(assert (=> b!212963 (= e!145103 e!145097)))

(declare-fun res!178948 () Bool)

(assert (=> b!212963 (=> (not res!178948) (not e!145097))))

(declare-fun lt!335747 () (_ BitVec 64))

(declare-fun lt!335740 () (_ BitVec 64))

(assert (=> b!212963 (= res!178948 (= lt!335747 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!335740)))))

(assert (=> b!212963 (= lt!335747 (bitIndex!0 (size!4630 (buf!5159 (_2!9776 lt!335754))) (currentByte!9725 (_2!9776 lt!335754)) (currentBit!9720 (_2!9776 lt!335754))))))

(assert (=> b!212963 (= lt!335740 (bitIndex!0 (size!4630 (buf!5159 thiss!1204)) (currentByte!9725 thiss!1204) (currentBit!9720 thiss!1204)))))

(declare-fun b!212964 () Bool)

(declare-fun res!178944 () Bool)

(assert (=> b!212964 (=> res!178944 e!145100)))

(assert (=> b!212964 (= res!178944 (not (= (size!4630 (buf!5159 (_2!9776 lt!335733))) (size!4630 (buf!5159 thiss!1204)))))))

(declare-fun b!212965 () Bool)

(declare-fun e!145101 () Bool)

(assert (=> b!212965 (= e!145101 e!145100)))

(declare-fun res!178951 () Bool)

(assert (=> b!212965 (=> res!178951 e!145100)))

(assert (=> b!212965 (= res!178951 (not (= lt!335745 (bvsub (bvsub (bvadd lt!335750 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!212965 (= lt!335745 (bitIndex!0 (size!4630 (buf!5159 (_2!9776 lt!335733))) (currentByte!9725 (_2!9776 lt!335733)) (currentBit!9720 (_2!9776 lt!335733))))))

(declare-fun isPrefixOf!0 (BitStream!8368 BitStream!8368) Bool)

(assert (=> b!212965 (isPrefixOf!0 thiss!1204 (_2!9776 lt!335733))))

(declare-fun lt!335732 () Unit!15166)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8368 BitStream!8368 BitStream!8368) Unit!15166)

(assert (=> b!212965 (= lt!335732 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9776 lt!335754) (_2!9776 lt!335733)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8368 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18242)

(assert (=> b!212965 (= lt!335733 (appendBitsLSBFirstLoopTR!0 (_2!9776 lt!335754) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!212966 () Bool)

(declare-fun res!178945 () Bool)

(declare-fun e!145096 () Bool)

(assert (=> b!212966 (=> (not res!178945) (not e!145096))))

(assert (=> b!212966 (= res!178945 (not (= i!590 nBits!348)))))

(declare-fun b!212967 () Bool)

(declare-fun res!178957 () Bool)

(assert (=> b!212967 (=> res!178957 e!145110)))

(assert (=> b!212967 (= res!178957 (not (isPrefixOf!0 thiss!1204 (_2!9776 lt!335754))))))

(declare-fun b!212968 () Bool)

(declare-fun e!145102 () Bool)

(declare-fun lt!335758 () tuple2!18248)

(assert (=> b!212968 (= e!145102 (= (bitIndex!0 (size!4630 (buf!5159 (_1!9779 lt!335758))) (currentByte!9725 (_1!9779 lt!335758)) (currentBit!9720 (_1!9779 lt!335758))) lt!335747))))

(declare-fun b!212969 () Bool)

(declare-fun e!145107 () Bool)

(declare-fun array_inv!4371 (array!10541) Bool)

(assert (=> b!212969 (= e!145107 (array_inv!4371 (buf!5159 thiss!1204)))))

(declare-fun res!178961 () Bool)

(declare-fun e!145105 () Bool)

(assert (=> start!44568 (=> (not res!178961) (not e!145105))))

(assert (=> start!44568 (= res!178961 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!44568 e!145105))

(assert (=> start!44568 true))

(declare-fun inv!12 (BitStream!8368) Bool)

(assert (=> start!44568 (and (inv!12 thiss!1204) e!145107)))

(declare-fun b!212956 () Bool)

(assert (=> b!212956 (= e!145100 e!145110)))

(declare-fun res!178963 () Bool)

(assert (=> b!212956 (=> res!178963 e!145110)))

(assert (=> b!212956 (= res!178963 (not (= lt!335745 (bvsub lt!335752 ((_ sign_extend 32) i!590)))))))

(assert (=> b!212956 (= lt!335752 (bvadd lt!335759 ((_ sign_extend 32) nBits!348)))))

(declare-fun b!212970 () Bool)

(assert (=> b!212970 (= e!145105 e!145096)))

(declare-fun res!178958 () Bool)

(assert (=> b!212970 (=> (not res!178958) (not e!145096))))

(assert (=> b!212970 (= res!178958 (validate_offset_bits!1 ((_ sign_extend 32) (size!4630 (buf!5159 thiss!1204))) ((_ sign_extend 32) (currentByte!9725 thiss!1204)) ((_ sign_extend 32) (currentBit!9720 thiss!1204)) lt!335751))))

(assert (=> b!212970 (= lt!335751 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!212971 () Bool)

(declare-fun res!178947 () Bool)

(assert (=> b!212971 (=> (not res!178947) (not e!145097))))

(assert (=> b!212971 (= res!178947 (isPrefixOf!0 thiss!1204 (_2!9776 lt!335754)))))

(declare-fun b!212972 () Bool)

(assert (=> b!212972 (= e!145099 e!145108)))

(declare-fun res!178950 () Bool)

(assert (=> b!212972 (=> res!178950 e!145108)))

(declare-fun lt!335730 () BitStream!8368)

(assert (=> b!212972 (= res!178950 (not (= (_1!9778 lt!335741) lt!335730)))))

(assert (=> b!212972 e!145109))

(declare-fun res!178964 () Bool)

(assert (=> b!212972 (=> (not res!178964) (not e!145109))))

(declare-fun lt!335755 () tuple2!18244)

(assert (=> b!212972 (= res!178964 (and (= (_2!9777 lt!335753) (_2!9777 lt!335755)) (= (_1!9777 lt!335753) (_1!9777 lt!335755))))))

(declare-fun lt!335739 () Unit!15166)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8368 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15166)

(assert (=> b!212972 (= lt!335739 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9778 lt!335738) nBits!348 i!590 lt!335734))))

(assert (=> b!212972 (= lt!335755 (readNBitsLSBFirstsLoopPure!0 lt!335730 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!335757))))

(assert (=> b!212972 (= lt!335730 (withMovedBitIndex!0 (_1!9778 lt!335738) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!212973 () Bool)

(declare-fun res!178955 () Bool)

(assert (=> b!212973 (=> (not res!178955) (not e!145109))))

(assert (=> b!212973 (= res!178955 (= (_1!9778 lt!335738) (withMovedBitIndex!0 (_2!9778 lt!335738) (bvsub lt!335759 lt!335745))))))

(declare-fun b!212974 () Bool)

(declare-fun res!178946 () Bool)

(assert (=> b!212974 (=> res!178946 e!145110)))

(assert (=> b!212974 (= res!178946 (not (isPrefixOf!0 (_2!9776 lt!335754) (_2!9776 lt!335733))))))

(declare-fun b!212975 () Bool)

(assert (=> b!212975 (= e!145096 (not e!145101))))

(declare-fun res!178962 () Bool)

(assert (=> b!212975 (=> res!178962 e!145101)))

(assert (=> b!212975 (= res!178962 (not (= lt!335750 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!335759))))))

(assert (=> b!212975 (= lt!335750 (bitIndex!0 (size!4630 (buf!5159 (_2!9776 lt!335754))) (currentByte!9725 (_2!9776 lt!335754)) (currentBit!9720 (_2!9776 lt!335754))))))

(assert (=> b!212975 (= lt!335759 (bitIndex!0 (size!4630 (buf!5159 thiss!1204)) (currentByte!9725 thiss!1204) (currentBit!9720 thiss!1204)))))

(assert (=> b!212975 e!145103))

(declare-fun res!178952 () Bool)

(assert (=> b!212975 (=> (not res!178952) (not e!145103))))

(assert (=> b!212975 (= res!178952 (= (size!4630 (buf!5159 thiss!1204)) (size!4630 (buf!5159 (_2!9776 lt!335754)))))))

(declare-fun appendBit!0 (BitStream!8368 Bool) tuple2!18242)

(assert (=> b!212975 (= lt!335754 (appendBit!0 thiss!1204 lt!335748))))

(assert (=> b!212975 (= lt!335748 (not (= (bvand v!189 lt!335731) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!212975 (= lt!335731 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!212976 () Bool)

(assert (=> b!212976 (= e!145097 e!145102)))

(declare-fun res!178943 () Bool)

(assert (=> b!212976 (=> (not res!178943) (not e!145102))))

(assert (=> b!212976 (= res!178943 (and (= (_2!9779 lt!335758) lt!335748) (= (_1!9779 lt!335758) (_2!9776 lt!335754))))))

(declare-fun readerFrom!0 (BitStream!8368 (_ BitVec 32) (_ BitVec 32)) BitStream!8368)

(assert (=> b!212976 (= lt!335758 (readBitPure!0 (readerFrom!0 (_2!9776 lt!335754) (currentBit!9720 thiss!1204) (currentByte!9725 thiss!1204))))))

(declare-fun b!212977 () Bool)

(declare-fun res!178949 () Bool)

(assert (=> b!212977 (=> (not res!178949) (not e!145096))))

(assert (=> b!212977 (= res!178949 (invariant!0 (currentBit!9720 thiss!1204) (currentByte!9725 thiss!1204) (size!4630 (buf!5159 thiss!1204))))))

(declare-fun b!212978 () Bool)

(assert (=> b!212978 (= e!145109 (and (= lt!335759 (bvsub lt!335750 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9778 lt!335741) lt!335730)) (= (_2!9777 lt!335753) (_2!9777 lt!335742)))))))

(declare-fun b!212979 () Bool)

(assert (=> b!212979 (= e!145104 (= (_2!9779 lt!335746) (_2!9779 lt!335749)))))

(assert (= (and start!44568 res!178961) b!212970))

(assert (= (and b!212970 res!178958) b!212977))

(assert (= (and b!212977 res!178949) b!212966))

(assert (= (and b!212966 res!178945) b!212975))

(assert (= (and b!212975 res!178952) b!212963))

(assert (= (and b!212963 res!178948) b!212971))

(assert (= (and b!212971 res!178947) b!212976))

(assert (= (and b!212976 res!178943) b!212968))

(assert (= (and b!212975 (not res!178962)) b!212965))

(assert (= (and b!212965 (not res!178951)) b!212957))

(assert (= (and b!212957 (not res!178959)) b!212964))

(assert (= (and b!212964 (not res!178944)) b!212956))

(assert (= (and b!212956 (not res!178963)) b!212974))

(assert (= (and b!212974 (not res!178946)) b!212967))

(assert (= (and b!212967 (not res!178957)) b!212959))

(assert (= (and b!212959 res!178956) b!212958))

(assert (= (and b!212959 res!178960) b!212979))

(assert (= (and b!212959 (not res!178953)) b!212972))

(assert (= (and b!212972 res!178964) b!212973))

(assert (= (and b!212973 res!178955) b!212961))

(assert (= (and b!212961 res!178942) b!212978))

(assert (= (and b!212972 (not res!178950)) b!212962))

(assert (= (and b!212962 (not res!178954)) b!212960))

(assert (= start!44568 b!212969))

(declare-fun m!328119 () Bool)

(assert (=> b!212977 m!328119))

(declare-fun m!328121 () Bool)

(assert (=> b!212976 m!328121))

(assert (=> b!212976 m!328121))

(declare-fun m!328123 () Bool)

(assert (=> b!212976 m!328123))

(declare-fun m!328125 () Bool)

(assert (=> b!212965 m!328125))

(declare-fun m!328127 () Bool)

(assert (=> b!212965 m!328127))

(declare-fun m!328129 () Bool)

(assert (=> b!212965 m!328129))

(declare-fun m!328131 () Bool)

(assert (=> b!212965 m!328131))

(declare-fun m!328133 () Bool)

(assert (=> b!212963 m!328133))

(declare-fun m!328135 () Bool)

(assert (=> b!212963 m!328135))

(declare-fun m!328137 () Bool)

(assert (=> b!212957 m!328137))

(declare-fun m!328139 () Bool)

(assert (=> b!212958 m!328139))

(declare-fun m!328141 () Bool)

(assert (=> b!212959 m!328141))

(declare-fun m!328143 () Bool)

(assert (=> b!212959 m!328143))

(declare-fun m!328145 () Bool)

(assert (=> b!212959 m!328145))

(declare-fun m!328147 () Bool)

(assert (=> b!212959 m!328147))

(declare-fun m!328149 () Bool)

(assert (=> b!212959 m!328149))

(declare-fun m!328151 () Bool)

(assert (=> b!212959 m!328151))

(declare-fun m!328153 () Bool)

(assert (=> b!212959 m!328153))

(declare-fun m!328155 () Bool)

(assert (=> b!212959 m!328155))

(declare-fun m!328157 () Bool)

(assert (=> b!212959 m!328157))

(declare-fun m!328159 () Bool)

(assert (=> b!212959 m!328159))

(declare-fun m!328161 () Bool)

(assert (=> b!212959 m!328161))

(declare-fun m!328163 () Bool)

(assert (=> b!212959 m!328163))

(declare-fun m!328165 () Bool)

(assert (=> b!212959 m!328165))

(declare-fun m!328167 () Bool)

(assert (=> b!212959 m!328167))

(declare-fun m!328169 () Bool)

(assert (=> b!212959 m!328169))

(declare-fun m!328171 () Bool)

(assert (=> b!212959 m!328171))

(assert (=> b!212975 m!328133))

(assert (=> b!212975 m!328135))

(declare-fun m!328173 () Bool)

(assert (=> b!212975 m!328173))

(declare-fun m!328175 () Bool)

(assert (=> start!44568 m!328175))

(declare-fun m!328177 () Bool)

(assert (=> b!212961 m!328177))

(declare-fun m!328179 () Bool)

(assert (=> b!212962 m!328179))

(declare-fun m!328181 () Bool)

(assert (=> b!212962 m!328181))

(declare-fun m!328183 () Bool)

(assert (=> b!212971 m!328183))

(assert (=> b!212967 m!328183))

(declare-fun m!328185 () Bool)

(assert (=> b!212970 m!328185))

(declare-fun m!328187 () Bool)

(assert (=> b!212974 m!328187))

(declare-fun m!328189 () Bool)

(assert (=> b!212968 m!328189))

(declare-fun m!328191 () Bool)

(assert (=> b!212972 m!328191))

(declare-fun m!328193 () Bool)

(assert (=> b!212972 m!328193))

(declare-fun m!328195 () Bool)

(assert (=> b!212972 m!328195))

(declare-fun m!328197 () Bool)

(assert (=> b!212969 m!328197))

(declare-fun m!328199 () Bool)

(assert (=> b!212973 m!328199))

(push 1)

(assert (not b!212965))

(assert (not b!212970))

(assert (not b!212967))

(assert (not start!44568))

(assert (not b!212973))

(assert (not b!212958))

(assert (not b!212977))

(assert (not b!212961))

(assert (not b!212959))

(assert (not b!212957))

(assert (not b!212972))

(assert (not b!212969))

(assert (not b!212968))

(assert (not b!212963))

(assert (not b!212976))

(assert (not b!212975))

(assert (not b!212974))

(assert (not b!212971))

(assert (not b!212962))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!72033 () Bool)

(declare-fun res!179156 () Bool)

(declare-fun e!145237 () Bool)

(assert (=> d!72033 (=> (not res!179156) (not e!145237))))

(assert (=> d!72033 (= res!179156 (= (size!4630 (buf!5159 thiss!1204)) (size!4630 (buf!5159 (_2!9776 lt!335754)))))))

(assert (=> d!72033 (= (isPrefixOf!0 thiss!1204 (_2!9776 lt!335754)) e!145237)))

(declare-fun b!213185 () Bool)

(declare-fun res!179158 () Bool)

(assert (=> b!213185 (=> (not res!179158) (not e!145237))))

(assert (=> b!213185 (= res!179158 (bvsle (bitIndex!0 (size!4630 (buf!5159 thiss!1204)) (currentByte!9725 thiss!1204) (currentBit!9720 thiss!1204)) (bitIndex!0 (size!4630 (buf!5159 (_2!9776 lt!335754))) (currentByte!9725 (_2!9776 lt!335754)) (currentBit!9720 (_2!9776 lt!335754)))))))

(declare-fun b!213186 () Bool)

(declare-fun e!145236 () Bool)

(assert (=> b!213186 (= e!145237 e!145236)))

(declare-fun res!179157 () Bool)

(assert (=> b!213186 (=> res!179157 e!145236)))

(assert (=> b!213186 (= res!179157 (= (size!4630 (buf!5159 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!213187 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10541 array!10541 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!213187 (= e!145236 (arrayBitRangesEq!0 (buf!5159 thiss!1204) (buf!5159 (_2!9776 lt!335754)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4630 (buf!5159 thiss!1204)) (currentByte!9725 thiss!1204) (currentBit!9720 thiss!1204))))))

(assert (= (and d!72033 res!179156) b!213185))

(assert (= (and b!213185 res!179158) b!213186))

(assert (= (and b!213186 (not res!179157)) b!213187))

(assert (=> b!213185 m!328135))

(assert (=> b!213185 m!328133))

(assert (=> b!213187 m!328135))

(assert (=> b!213187 m!328135))

(declare-fun m!328505 () Bool)

(assert (=> b!213187 m!328505))

(assert (=> b!212971 d!72033))

(declare-fun d!72035 () Bool)

(declare-fun e!145240 () Bool)

(assert (=> d!72035 e!145240))

(declare-fun res!179161 () Bool)

(assert (=> d!72035 (=> (not res!179161) (not e!145240))))

(declare-fun lt!336141 () BitStream!8368)

(declare-fun lt!336142 () (_ BitVec 64))

(assert (=> d!72035 (= res!179161 (= (bvadd lt!336142 (bvsub lt!335750 lt!335745)) (bitIndex!0 (size!4630 (buf!5159 lt!336141)) (currentByte!9725 lt!336141) (currentBit!9720 lt!336141))))))

(assert (=> d!72035 (or (not (= (bvand lt!336142 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!335750 lt!335745) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!336142 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!336142 (bvsub lt!335750 lt!335745)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72035 (= lt!336142 (bitIndex!0 (size!4630 (buf!5159 (_2!9778 lt!335741))) (currentByte!9725 (_2!9778 lt!335741)) (currentBit!9720 (_2!9778 lt!335741))))))

(declare-fun moveBitIndex!0 (BitStream!8368 (_ BitVec 64)) tuple2!18242)

(assert (=> d!72035 (= lt!336141 (_2!9776 (moveBitIndex!0 (_2!9778 lt!335741) (bvsub lt!335750 lt!335745))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8368 (_ BitVec 64)) Bool)

(assert (=> d!72035 (moveBitIndexPrecond!0 (_2!9778 lt!335741) (bvsub lt!335750 lt!335745))))

(assert (=> d!72035 (= (withMovedBitIndex!0 (_2!9778 lt!335741) (bvsub lt!335750 lt!335745)) lt!336141)))

(declare-fun b!213190 () Bool)

(assert (=> b!213190 (= e!145240 (= (size!4630 (buf!5159 (_2!9778 lt!335741))) (size!4630 (buf!5159 lt!336141))))))

(assert (= (and d!72035 res!179161) b!213190))

(declare-fun m!328507 () Bool)

(assert (=> d!72035 m!328507))

(declare-fun m!328509 () Bool)

(assert (=> d!72035 m!328509))

(declare-fun m!328511 () Bool)

(assert (=> d!72035 m!328511))

(declare-fun m!328513 () Bool)

(assert (=> d!72035 m!328513))

(assert (=> b!212961 d!72035))

(declare-fun d!72037 () Bool)

(declare-fun lt!336157 () tuple2!18244)

(declare-fun lt!336155 () tuple2!18244)

(assert (=> d!72037 (and (= (_2!9777 lt!336157) (_2!9777 lt!336155)) (= (_1!9777 lt!336157) (_1!9777 lt!336155)))))

(declare-fun lt!336158 () Bool)

(declare-fun lt!336160 () BitStream!8368)

(declare-fun lt!336159 () Unit!15166)

(declare-fun lt!336156 () (_ BitVec 64))

(declare-fun choose!56 (BitStream!8368 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!18244 tuple2!18244 BitStream!8368 (_ BitVec 64) Bool BitStream!8368 (_ BitVec 64) tuple2!18244 tuple2!18244 BitStream!8368 (_ BitVec 64)) Unit!15166)

(assert (=> d!72037 (= lt!336159 (choose!56 (_1!9778 lt!335738) nBits!348 i!590 lt!335734 lt!336157 (tuple2!18245 (_1!9777 lt!336157) (_2!9777 lt!336157)) (_1!9777 lt!336157) (_2!9777 lt!336157) lt!336158 lt!336160 lt!336156 lt!336155 (tuple2!18245 (_1!9777 lt!336155) (_2!9777 lt!336155)) (_1!9777 lt!336155) (_2!9777 lt!336155)))))

(assert (=> d!72037 (= lt!336155 (readNBitsLSBFirstsLoopPure!0 lt!336160 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!336156))))

(assert (=> d!72037 (= lt!336156 (bvor lt!335734 (ite lt!336158 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72037 (= lt!336160 (withMovedBitIndex!0 (_1!9778 lt!335738) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!72037 (= lt!336158 (_2!9779 (readBitPure!0 (_1!9778 lt!335738))))))

(assert (=> d!72037 (= lt!336157 (readNBitsLSBFirstsLoopPure!0 (_1!9778 lt!335738) nBits!348 i!590 lt!335734))))

(assert (=> d!72037 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9778 lt!335738) nBits!348 i!590 lt!335734) lt!336159)))

(declare-fun bs!17679 () Bool)

(assert (= bs!17679 d!72037))

(assert (=> bs!17679 m!328163))

(declare-fun m!328515 () Bool)

(assert (=> bs!17679 m!328515))

(assert (=> bs!17679 m!328195))

(declare-fun m!328517 () Bool)

(assert (=> bs!17679 m!328517))

(assert (=> bs!17679 m!328141))

(assert (=> b!212972 d!72037))

(declare-datatypes ((tuple2!18266 0))(
  ( (tuple2!18267 (_1!9788 (_ BitVec 64)) (_2!9788 BitStream!8368)) )
))
(declare-fun lt!336163 () tuple2!18266)

(declare-fun d!72039 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8368 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18266)

(assert (=> d!72039 (= lt!336163 (readNBitsLSBFirstsLoop!0 lt!335730 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!335757))))

(assert (=> d!72039 (= (readNBitsLSBFirstsLoopPure!0 lt!335730 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!335757) (tuple2!18245 (_2!9788 lt!336163) (_1!9788 lt!336163)))))

(declare-fun bs!17680 () Bool)

(assert (= bs!17680 d!72039))

(declare-fun m!328519 () Bool)

(assert (=> bs!17680 m!328519))

(assert (=> b!212972 d!72039))

(declare-fun d!72041 () Bool)

(declare-fun e!145241 () Bool)

(assert (=> d!72041 e!145241))

(declare-fun res!179162 () Bool)

(assert (=> d!72041 (=> (not res!179162) (not e!145241))))

(declare-fun lt!336165 () (_ BitVec 64))

(declare-fun lt!336164 () BitStream!8368)

(assert (=> d!72041 (= res!179162 (= (bvadd lt!336165 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4630 (buf!5159 lt!336164)) (currentByte!9725 lt!336164) (currentBit!9720 lt!336164))))))

(assert (=> d!72041 (or (not (= (bvand lt!336165 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!336165 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!336165 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72041 (= lt!336165 (bitIndex!0 (size!4630 (buf!5159 (_1!9778 lt!335738))) (currentByte!9725 (_1!9778 lt!335738)) (currentBit!9720 (_1!9778 lt!335738))))))

(assert (=> d!72041 (= lt!336164 (_2!9776 (moveBitIndex!0 (_1!9778 lt!335738) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!72041 (moveBitIndexPrecond!0 (_1!9778 lt!335738) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!72041 (= (withMovedBitIndex!0 (_1!9778 lt!335738) #b0000000000000000000000000000000000000000000000000000000000000001) lt!336164)))

(declare-fun b!213191 () Bool)

(assert (=> b!213191 (= e!145241 (= (size!4630 (buf!5159 (_1!9778 lt!335738))) (size!4630 (buf!5159 lt!336164))))))

(assert (= (and d!72041 res!179162) b!213191))

(declare-fun m!328521 () Bool)

(assert (=> d!72041 m!328521))

(declare-fun m!328523 () Bool)

(assert (=> d!72041 m!328523))

(declare-fun m!328525 () Bool)

(assert (=> d!72041 m!328525))

(declare-fun m!328527 () Bool)

(assert (=> d!72041 m!328527))

(assert (=> b!212972 d!72041))

(declare-fun d!72043 () Bool)

(declare-fun e!145244 () Bool)

(assert (=> d!72043 e!145244))

(declare-fun res!179167 () Bool)

(assert (=> d!72043 (=> (not res!179167) (not e!145244))))

(declare-fun lt!336179 () (_ BitVec 64))

(declare-fun lt!336180 () (_ BitVec 64))

(declare-fun lt!336181 () (_ BitVec 64))

(assert (=> d!72043 (= res!179167 (= lt!336179 (bvsub lt!336180 lt!336181)))))

(assert (=> d!72043 (or (= (bvand lt!336180 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!336181 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!336180 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!336180 lt!336181) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!72043 (= lt!336181 (remainingBits!0 ((_ sign_extend 32) (size!4630 (buf!5159 (_1!9777 lt!335753)))) ((_ sign_extend 32) (currentByte!9725 (_1!9777 lt!335753))) ((_ sign_extend 32) (currentBit!9720 (_1!9777 lt!335753)))))))

(declare-fun lt!336183 () (_ BitVec 64))

(declare-fun lt!336178 () (_ BitVec 64))

(assert (=> d!72043 (= lt!336180 (bvmul lt!336183 lt!336178))))

(assert (=> d!72043 (or (= lt!336183 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!336178 (bvsdiv (bvmul lt!336183 lt!336178) lt!336183)))))

(assert (=> d!72043 (= lt!336178 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72043 (= lt!336183 ((_ sign_extend 32) (size!4630 (buf!5159 (_1!9777 lt!335753)))))))

(assert (=> d!72043 (= lt!336179 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9725 (_1!9777 lt!335753))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9720 (_1!9777 lt!335753)))))))

(assert (=> d!72043 (invariant!0 (currentBit!9720 (_1!9777 lt!335753)) (currentByte!9725 (_1!9777 lt!335753)) (size!4630 (buf!5159 (_1!9777 lt!335753))))))

(assert (=> d!72043 (= (bitIndex!0 (size!4630 (buf!5159 (_1!9777 lt!335753))) (currentByte!9725 (_1!9777 lt!335753)) (currentBit!9720 (_1!9777 lt!335753))) lt!336179)))

(declare-fun b!213196 () Bool)

(declare-fun res!179168 () Bool)

(assert (=> b!213196 (=> (not res!179168) (not e!145244))))

(assert (=> b!213196 (= res!179168 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!336179))))

(declare-fun b!213197 () Bool)

(declare-fun lt!336182 () (_ BitVec 64))

(assert (=> b!213197 (= e!145244 (bvsle lt!336179 (bvmul lt!336182 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213197 (or (= lt!336182 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!336182 #b0000000000000000000000000000000000000000000000000000000000001000) lt!336182)))))

(assert (=> b!213197 (= lt!336182 ((_ sign_extend 32) (size!4630 (buf!5159 (_1!9777 lt!335753)))))))

(assert (= (and d!72043 res!179167) b!213196))

(assert (= (and b!213196 res!179168) b!213197))

(declare-fun m!328529 () Bool)

(assert (=> d!72043 m!328529))

(declare-fun m!328531 () Bool)

(assert (=> d!72043 m!328531))

(assert (=> b!212962 d!72043))

(declare-fun d!72045 () Bool)

(declare-fun e!145245 () Bool)

(assert (=> d!72045 e!145245))

(declare-fun res!179169 () Bool)

(assert (=> d!72045 (=> (not res!179169) (not e!145245))))

(declare-fun lt!336187 () (_ BitVec 64))

(declare-fun lt!336185 () (_ BitVec 64))

(declare-fun lt!336186 () (_ BitVec 64))

(assert (=> d!72045 (= res!179169 (= lt!336185 (bvsub lt!336186 lt!336187)))))

(assert (=> d!72045 (or (= (bvand lt!336186 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!336187 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!336186 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!336186 lt!336187) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72045 (= lt!336187 (remainingBits!0 ((_ sign_extend 32) (size!4630 (buf!5159 (_2!9778 lt!335738)))) ((_ sign_extend 32) (currentByte!9725 (_2!9778 lt!335738))) ((_ sign_extend 32) (currentBit!9720 (_2!9778 lt!335738)))))))

(declare-fun lt!336189 () (_ BitVec 64))

(declare-fun lt!336184 () (_ BitVec 64))

(assert (=> d!72045 (= lt!336186 (bvmul lt!336189 lt!336184))))

(assert (=> d!72045 (or (= lt!336189 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!336184 (bvsdiv (bvmul lt!336189 lt!336184) lt!336189)))))

(assert (=> d!72045 (= lt!336184 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72045 (= lt!336189 ((_ sign_extend 32) (size!4630 (buf!5159 (_2!9778 lt!335738)))))))

(assert (=> d!72045 (= lt!336185 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9725 (_2!9778 lt!335738))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9720 (_2!9778 lt!335738)))))))

(assert (=> d!72045 (invariant!0 (currentBit!9720 (_2!9778 lt!335738)) (currentByte!9725 (_2!9778 lt!335738)) (size!4630 (buf!5159 (_2!9778 lt!335738))))))

(assert (=> d!72045 (= (bitIndex!0 (size!4630 (buf!5159 (_2!9778 lt!335738))) (currentByte!9725 (_2!9778 lt!335738)) (currentBit!9720 (_2!9778 lt!335738))) lt!336185)))

(declare-fun b!213198 () Bool)

(declare-fun res!179170 () Bool)

(assert (=> b!213198 (=> (not res!179170) (not e!145245))))

(assert (=> b!213198 (= res!179170 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!336185))))

(declare-fun b!213199 () Bool)

(declare-fun lt!336188 () (_ BitVec 64))

(assert (=> b!213199 (= e!145245 (bvsle lt!336185 (bvmul lt!336188 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213199 (or (= lt!336188 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!336188 #b0000000000000000000000000000000000000000000000000000000000001000) lt!336188)))))

(assert (=> b!213199 (= lt!336188 ((_ sign_extend 32) (size!4630 (buf!5159 (_2!9778 lt!335738)))))))

(assert (= (and d!72045 res!179169) b!213198))

(assert (= (and b!213198 res!179170) b!213199))

(declare-fun m!328533 () Bool)

(assert (=> d!72045 m!328533))

(declare-fun m!328535 () Bool)

(assert (=> d!72045 m!328535))

(assert (=> b!212962 d!72045))

(declare-fun d!72047 () Bool)

(declare-fun e!145246 () Bool)

(assert (=> d!72047 e!145246))

(declare-fun res!179171 () Bool)

(assert (=> d!72047 (=> (not res!179171) (not e!145246))))

(declare-fun lt!336191 () (_ BitVec 64))

(declare-fun lt!336190 () BitStream!8368)

(assert (=> d!72047 (= res!179171 (= (bvadd lt!336191 (bvsub lt!335759 lt!335745)) (bitIndex!0 (size!4630 (buf!5159 lt!336190)) (currentByte!9725 lt!336190) (currentBit!9720 lt!336190))))))

(assert (=> d!72047 (or (not (= (bvand lt!336191 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!335759 lt!335745) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!336191 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!336191 (bvsub lt!335759 lt!335745)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72047 (= lt!336191 (bitIndex!0 (size!4630 (buf!5159 (_2!9778 lt!335738))) (currentByte!9725 (_2!9778 lt!335738)) (currentBit!9720 (_2!9778 lt!335738))))))

(assert (=> d!72047 (= lt!336190 (_2!9776 (moveBitIndex!0 (_2!9778 lt!335738) (bvsub lt!335759 lt!335745))))))

(assert (=> d!72047 (moveBitIndexPrecond!0 (_2!9778 lt!335738) (bvsub lt!335759 lt!335745))))

(assert (=> d!72047 (= (withMovedBitIndex!0 (_2!9778 lt!335738) (bvsub lt!335759 lt!335745)) lt!336190)))

(declare-fun b!213200 () Bool)

(assert (=> b!213200 (= e!145246 (= (size!4630 (buf!5159 (_2!9778 lt!335738))) (size!4630 (buf!5159 lt!336190))))))

(assert (= (and d!72047 res!179171) b!213200))

(declare-fun m!328537 () Bool)

(assert (=> d!72047 m!328537))

(assert (=> d!72047 m!328181))

(declare-fun m!328539 () Bool)

(assert (=> d!72047 m!328539))

(declare-fun m!328541 () Bool)

(assert (=> d!72047 m!328541))

(assert (=> b!212973 d!72047))

(declare-fun d!72049 () Bool)

(declare-fun e!145247 () Bool)

(assert (=> d!72049 e!145247))

(declare-fun res!179172 () Bool)

(assert (=> d!72049 (=> (not res!179172) (not e!145247))))

(declare-fun lt!336195 () (_ BitVec 64))

(declare-fun lt!336194 () (_ BitVec 64))

(declare-fun lt!336193 () (_ BitVec 64))

(assert (=> d!72049 (= res!179172 (= lt!336193 (bvsub lt!336194 lt!336195)))))

(assert (=> d!72049 (or (= (bvand lt!336194 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!336195 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!336194 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!336194 lt!336195) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72049 (= lt!336195 (remainingBits!0 ((_ sign_extend 32) (size!4630 (buf!5159 (_2!9776 lt!335754)))) ((_ sign_extend 32) (currentByte!9725 (_2!9776 lt!335754))) ((_ sign_extend 32) (currentBit!9720 (_2!9776 lt!335754)))))))

(declare-fun lt!336197 () (_ BitVec 64))

(declare-fun lt!336192 () (_ BitVec 64))

(assert (=> d!72049 (= lt!336194 (bvmul lt!336197 lt!336192))))

(assert (=> d!72049 (or (= lt!336197 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!336192 (bvsdiv (bvmul lt!336197 lt!336192) lt!336197)))))

(assert (=> d!72049 (= lt!336192 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72049 (= lt!336197 ((_ sign_extend 32) (size!4630 (buf!5159 (_2!9776 lt!335754)))))))

(assert (=> d!72049 (= lt!336193 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9725 (_2!9776 lt!335754))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9720 (_2!9776 lt!335754)))))))

(assert (=> d!72049 (invariant!0 (currentBit!9720 (_2!9776 lt!335754)) (currentByte!9725 (_2!9776 lt!335754)) (size!4630 (buf!5159 (_2!9776 lt!335754))))))

(assert (=> d!72049 (= (bitIndex!0 (size!4630 (buf!5159 (_2!9776 lt!335754))) (currentByte!9725 (_2!9776 lt!335754)) (currentBit!9720 (_2!9776 lt!335754))) lt!336193)))

(declare-fun b!213201 () Bool)

(declare-fun res!179173 () Bool)

(assert (=> b!213201 (=> (not res!179173) (not e!145247))))

(assert (=> b!213201 (= res!179173 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!336193))))

(declare-fun b!213202 () Bool)

(declare-fun lt!336196 () (_ BitVec 64))

(assert (=> b!213202 (= e!145247 (bvsle lt!336193 (bvmul lt!336196 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213202 (or (= lt!336196 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!336196 #b0000000000000000000000000000000000000000000000000000000000001000) lt!336196)))))

(assert (=> b!213202 (= lt!336196 ((_ sign_extend 32) (size!4630 (buf!5159 (_2!9776 lt!335754)))))))

(assert (= (and d!72049 res!179172) b!213201))

(assert (= (and b!213201 res!179173) b!213202))

(declare-fun m!328543 () Bool)

(assert (=> d!72049 m!328543))

(declare-fun m!328545 () Bool)

(assert (=> d!72049 m!328545))

(assert (=> b!212963 d!72049))

(declare-fun d!72051 () Bool)

(declare-fun e!145248 () Bool)

(assert (=> d!72051 e!145248))

(declare-fun res!179174 () Bool)

(assert (=> d!72051 (=> (not res!179174) (not e!145248))))

(declare-fun lt!336200 () (_ BitVec 64))

(declare-fun lt!336201 () (_ BitVec 64))

(declare-fun lt!336199 () (_ BitVec 64))

(assert (=> d!72051 (= res!179174 (= lt!336199 (bvsub lt!336200 lt!336201)))))

(assert (=> d!72051 (or (= (bvand lt!336200 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!336201 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!336200 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!336200 lt!336201) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72051 (= lt!336201 (remainingBits!0 ((_ sign_extend 32) (size!4630 (buf!5159 thiss!1204))) ((_ sign_extend 32) (currentByte!9725 thiss!1204)) ((_ sign_extend 32) (currentBit!9720 thiss!1204))))))

(declare-fun lt!336203 () (_ BitVec 64))

(declare-fun lt!336198 () (_ BitVec 64))

(assert (=> d!72051 (= lt!336200 (bvmul lt!336203 lt!336198))))

(assert (=> d!72051 (or (= lt!336203 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!336198 (bvsdiv (bvmul lt!336203 lt!336198) lt!336203)))))

(assert (=> d!72051 (= lt!336198 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72051 (= lt!336203 ((_ sign_extend 32) (size!4630 (buf!5159 thiss!1204))))))

(assert (=> d!72051 (= lt!336199 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9725 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9720 thiss!1204))))))

(assert (=> d!72051 (invariant!0 (currentBit!9720 thiss!1204) (currentByte!9725 thiss!1204) (size!4630 (buf!5159 thiss!1204)))))

(assert (=> d!72051 (= (bitIndex!0 (size!4630 (buf!5159 thiss!1204)) (currentByte!9725 thiss!1204) (currentBit!9720 thiss!1204)) lt!336199)))

(declare-fun b!213203 () Bool)

(declare-fun res!179175 () Bool)

(assert (=> b!213203 (=> (not res!179175) (not e!145248))))

(assert (=> b!213203 (= res!179175 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!336199))))

(declare-fun b!213204 () Bool)

(declare-fun lt!336202 () (_ BitVec 64))

(assert (=> b!213204 (= e!145248 (bvsle lt!336199 (bvmul lt!336202 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213204 (or (= lt!336202 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!336202 #b0000000000000000000000000000000000000000000000000000000000001000) lt!336202)))))

(assert (=> b!213204 (= lt!336202 ((_ sign_extend 32) (size!4630 (buf!5159 thiss!1204))))))

(assert (= (and d!72051 res!179174) b!213203))

(assert (= (and b!213203 res!179175) b!213204))

(declare-fun m!328547 () Bool)

(assert (=> d!72051 m!328547))

(assert (=> d!72051 m!328119))

(assert (=> b!212963 d!72051))

(declare-fun d!72053 () Bool)

(declare-fun res!179176 () Bool)

(declare-fun e!145250 () Bool)

(assert (=> d!72053 (=> (not res!179176) (not e!145250))))

(assert (=> d!72053 (= res!179176 (= (size!4630 (buf!5159 (_2!9776 lt!335754))) (size!4630 (buf!5159 (_2!9776 lt!335733)))))))

(assert (=> d!72053 (= (isPrefixOf!0 (_2!9776 lt!335754) (_2!9776 lt!335733)) e!145250)))

(declare-fun b!213205 () Bool)

(declare-fun res!179178 () Bool)

(assert (=> b!213205 (=> (not res!179178) (not e!145250))))

(assert (=> b!213205 (= res!179178 (bvsle (bitIndex!0 (size!4630 (buf!5159 (_2!9776 lt!335754))) (currentByte!9725 (_2!9776 lt!335754)) (currentBit!9720 (_2!9776 lt!335754))) (bitIndex!0 (size!4630 (buf!5159 (_2!9776 lt!335733))) (currentByte!9725 (_2!9776 lt!335733)) (currentBit!9720 (_2!9776 lt!335733)))))))

(declare-fun b!213206 () Bool)

(declare-fun e!145249 () Bool)

(assert (=> b!213206 (= e!145250 e!145249)))

(declare-fun res!179177 () Bool)

(assert (=> b!213206 (=> res!179177 e!145249)))

(assert (=> b!213206 (= res!179177 (= (size!4630 (buf!5159 (_2!9776 lt!335754))) #b00000000000000000000000000000000))))

(declare-fun b!213207 () Bool)

(assert (=> b!213207 (= e!145249 (arrayBitRangesEq!0 (buf!5159 (_2!9776 lt!335754)) (buf!5159 (_2!9776 lt!335733)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4630 (buf!5159 (_2!9776 lt!335754))) (currentByte!9725 (_2!9776 lt!335754)) (currentBit!9720 (_2!9776 lt!335754)))))))

(assert (= (and d!72053 res!179176) b!213205))

(assert (= (and b!213205 res!179178) b!213206))

(assert (= (and b!213206 (not res!179177)) b!213207))

(assert (=> b!213205 m!328133))

(assert (=> b!213205 m!328125))

(assert (=> b!213207 m!328133))

(assert (=> b!213207 m!328133))

(declare-fun m!328549 () Bool)

(assert (=> b!213207 m!328549))

(assert (=> b!212974 d!72053))

(assert (=> b!212975 d!72049))

(assert (=> b!212975 d!72051))

(declare-fun b!213230 () Bool)

(declare-fun res!179200 () Bool)

(declare-fun e!145265 () Bool)

(assert (=> b!213230 (=> (not res!179200) (not e!145265))))

(declare-fun lt!336218 () tuple2!18242)

(assert (=> b!213230 (= res!179200 (isPrefixOf!0 thiss!1204 (_2!9776 lt!336218)))))

(declare-fun d!72055 () Bool)

(assert (=> d!72055 e!145265))

(declare-fun res!179202 () Bool)

(assert (=> d!72055 (=> (not res!179202) (not e!145265))))

(assert (=> d!72055 (= res!179202 (= (size!4630 (buf!5159 thiss!1204)) (size!4630 (buf!5159 (_2!9776 lt!336218)))))))

(declare-fun choose!16 (BitStream!8368 Bool) tuple2!18242)

(assert (=> d!72055 (= lt!336218 (choose!16 thiss!1204 lt!335748))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!72055 (validate_offset_bit!0 ((_ sign_extend 32) (size!4630 (buf!5159 thiss!1204))) ((_ sign_extend 32) (currentByte!9725 thiss!1204)) ((_ sign_extend 32) (currentBit!9720 thiss!1204)))))

(assert (=> d!72055 (= (appendBit!0 thiss!1204 lt!335748) lt!336218)))

(declare-fun b!213231 () Bool)

(declare-fun e!145264 () Bool)

(assert (=> b!213231 (= e!145265 e!145264)))

(declare-fun res!179201 () Bool)

(assert (=> b!213231 (=> (not res!179201) (not e!145264))))

(declare-fun lt!336220 () tuple2!18248)

(assert (=> b!213231 (= res!179201 (and (= (_2!9779 lt!336220) lt!335748) (= (_1!9779 lt!336220) (_2!9776 lt!336218))))))

(assert (=> b!213231 (= lt!336220 (readBitPure!0 (readerFrom!0 (_2!9776 lt!336218) (currentBit!9720 thiss!1204) (currentByte!9725 thiss!1204))))))

(declare-fun b!213229 () Bool)

(declare-fun res!179199 () Bool)

(assert (=> b!213229 (=> (not res!179199) (not e!145265))))

(declare-fun lt!336221 () (_ BitVec 64))

(declare-fun lt!336219 () (_ BitVec 64))

(assert (=> b!213229 (= res!179199 (= (bitIndex!0 (size!4630 (buf!5159 (_2!9776 lt!336218))) (currentByte!9725 (_2!9776 lt!336218)) (currentBit!9720 (_2!9776 lt!336218))) (bvadd lt!336221 lt!336219)))))

(assert (=> b!213229 (or (not (= (bvand lt!336221 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!336219 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!336221 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!336221 lt!336219) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213229 (= lt!336219 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!213229 (= lt!336221 (bitIndex!0 (size!4630 (buf!5159 thiss!1204)) (currentByte!9725 thiss!1204) (currentBit!9720 thiss!1204)))))

(declare-fun b!213232 () Bool)

(assert (=> b!213232 (= e!145264 (= (bitIndex!0 (size!4630 (buf!5159 (_1!9779 lt!336220))) (currentByte!9725 (_1!9779 lt!336220)) (currentBit!9720 (_1!9779 lt!336220))) (bitIndex!0 (size!4630 (buf!5159 (_2!9776 lt!336218))) (currentByte!9725 (_2!9776 lt!336218)) (currentBit!9720 (_2!9776 lt!336218)))))))

(assert (= (and d!72055 res!179202) b!213229))

(assert (= (and b!213229 res!179199) b!213230))

(assert (= (and b!213230 res!179200) b!213231))

(assert (= (and b!213231 res!179201) b!213232))

(declare-fun m!328559 () Bool)

(assert (=> b!213231 m!328559))

(assert (=> b!213231 m!328559))

(declare-fun m!328561 () Bool)

(assert (=> b!213231 m!328561))

(declare-fun m!328563 () Bool)

(assert (=> d!72055 m!328563))

(declare-fun m!328565 () Bool)

(assert (=> d!72055 m!328565))

(declare-fun m!328567 () Bool)

(assert (=> b!213232 m!328567))

(declare-fun m!328569 () Bool)

(assert (=> b!213232 m!328569))

(declare-fun m!328571 () Bool)

(assert (=> b!213230 m!328571))

(assert (=> b!213229 m!328569))

(assert (=> b!213229 m!328135))

(assert (=> b!212975 d!72055))

(declare-fun d!72063 () Bool)

(declare-fun e!145266 () Bool)

(assert (=> d!72063 e!145266))

(declare-fun res!179203 () Bool)

(assert (=> d!72063 (=> (not res!179203) (not e!145266))))

(declare-fun lt!336224 () (_ BitVec 64))

(declare-fun lt!336223 () (_ BitVec 64))

(declare-fun lt!336225 () (_ BitVec 64))

(assert (=> d!72063 (= res!179203 (= lt!336223 (bvsub lt!336224 lt!336225)))))

(assert (=> d!72063 (or (= (bvand lt!336224 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!336225 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!336224 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!336224 lt!336225) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72063 (= lt!336225 (remainingBits!0 ((_ sign_extend 32) (size!4630 (buf!5159 (_2!9776 lt!335733)))) ((_ sign_extend 32) (currentByte!9725 (_2!9776 lt!335733))) ((_ sign_extend 32) (currentBit!9720 (_2!9776 lt!335733)))))))

(declare-fun lt!336227 () (_ BitVec 64))

(declare-fun lt!336222 () (_ BitVec 64))

(assert (=> d!72063 (= lt!336224 (bvmul lt!336227 lt!336222))))

(assert (=> d!72063 (or (= lt!336227 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!336222 (bvsdiv (bvmul lt!336227 lt!336222) lt!336227)))))

(assert (=> d!72063 (= lt!336222 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72063 (= lt!336227 ((_ sign_extend 32) (size!4630 (buf!5159 (_2!9776 lt!335733)))))))

(assert (=> d!72063 (= lt!336223 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9725 (_2!9776 lt!335733))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9720 (_2!9776 lt!335733)))))))

(assert (=> d!72063 (invariant!0 (currentBit!9720 (_2!9776 lt!335733)) (currentByte!9725 (_2!9776 lt!335733)) (size!4630 (buf!5159 (_2!9776 lt!335733))))))

(assert (=> d!72063 (= (bitIndex!0 (size!4630 (buf!5159 (_2!9776 lt!335733))) (currentByte!9725 (_2!9776 lt!335733)) (currentBit!9720 (_2!9776 lt!335733))) lt!336223)))

(declare-fun b!213233 () Bool)

(declare-fun res!179204 () Bool)

(assert (=> b!213233 (=> (not res!179204) (not e!145266))))

(assert (=> b!213233 (= res!179204 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!336223))))

(declare-fun b!213234 () Bool)

(declare-fun lt!336226 () (_ BitVec 64))

(assert (=> b!213234 (= e!145266 (bvsle lt!336223 (bvmul lt!336226 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213234 (or (= lt!336226 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!336226 #b0000000000000000000000000000000000000000000000000000000000001000) lt!336226)))))

(assert (=> b!213234 (= lt!336226 ((_ sign_extend 32) (size!4630 (buf!5159 (_2!9776 lt!335733)))))))

(assert (= (and d!72063 res!179203) b!213233))

(assert (= (and b!213233 res!179204) b!213234))

(declare-fun m!328573 () Bool)

(assert (=> d!72063 m!328573))

(assert (=> d!72063 m!328137))

(assert (=> b!212965 d!72063))

(declare-fun d!72065 () Bool)

(declare-fun res!179205 () Bool)

(declare-fun e!145268 () Bool)

(assert (=> d!72065 (=> (not res!179205) (not e!145268))))

(assert (=> d!72065 (= res!179205 (= (size!4630 (buf!5159 thiss!1204)) (size!4630 (buf!5159 (_2!9776 lt!335733)))))))

(assert (=> d!72065 (= (isPrefixOf!0 thiss!1204 (_2!9776 lt!335733)) e!145268)))

(declare-fun b!213235 () Bool)

(declare-fun res!179207 () Bool)

(assert (=> b!213235 (=> (not res!179207) (not e!145268))))

(assert (=> b!213235 (= res!179207 (bvsle (bitIndex!0 (size!4630 (buf!5159 thiss!1204)) (currentByte!9725 thiss!1204) (currentBit!9720 thiss!1204)) (bitIndex!0 (size!4630 (buf!5159 (_2!9776 lt!335733))) (currentByte!9725 (_2!9776 lt!335733)) (currentBit!9720 (_2!9776 lt!335733)))))))

(declare-fun b!213236 () Bool)

(declare-fun e!145267 () Bool)

(assert (=> b!213236 (= e!145268 e!145267)))

(declare-fun res!179206 () Bool)

(assert (=> b!213236 (=> res!179206 e!145267)))

(assert (=> b!213236 (= res!179206 (= (size!4630 (buf!5159 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!213237 () Bool)

(assert (=> b!213237 (= e!145267 (arrayBitRangesEq!0 (buf!5159 thiss!1204) (buf!5159 (_2!9776 lt!335733)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4630 (buf!5159 thiss!1204)) (currentByte!9725 thiss!1204) (currentBit!9720 thiss!1204))))))

(assert (= (and d!72065 res!179205) b!213235))

(assert (= (and b!213235 res!179207) b!213236))

(assert (= (and b!213236 (not res!179206)) b!213237))

(assert (=> b!213235 m!328135))

(assert (=> b!213235 m!328125))

(assert (=> b!213237 m!328135))

(assert (=> b!213237 m!328135))

(declare-fun m!328575 () Bool)

(assert (=> b!213237 m!328575))

(assert (=> b!212965 d!72065))

(declare-fun d!72067 () Bool)

(assert (=> d!72067 (isPrefixOf!0 thiss!1204 (_2!9776 lt!335733))))

(declare-fun lt!336242 () Unit!15166)

(declare-fun choose!30 (BitStream!8368 BitStream!8368 BitStream!8368) Unit!15166)

(assert (=> d!72067 (= lt!336242 (choose!30 thiss!1204 (_2!9776 lt!335754) (_2!9776 lt!335733)))))

(assert (=> d!72067 (isPrefixOf!0 thiss!1204 (_2!9776 lt!335754))))

(assert (=> d!72067 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9776 lt!335754) (_2!9776 lt!335733)) lt!336242)))

(declare-fun bs!17681 () Bool)

(assert (= bs!17681 d!72067))

(assert (=> bs!17681 m!328127))

(declare-fun m!328577 () Bool)

(assert (=> bs!17681 m!328577))

(assert (=> bs!17681 m!328183))

(assert (=> b!212965 d!72067))

(declare-fun b!213345 () Bool)

(declare-fun e!145330 () Bool)

(declare-fun lt!336640 () tuple2!18244)

(declare-fun lt!336621 () tuple2!18246)

(assert (=> b!213345 (= e!145330 (= (_1!9777 lt!336640) (_2!9778 lt!336621)))))

(declare-fun b!213346 () Bool)

(declare-fun lt!336627 () tuple2!18248)

(declare-fun lt!336608 () tuple2!18242)

(assert (=> b!213346 (= lt!336627 (readBitPure!0 (readerFrom!0 (_2!9776 lt!336608) (currentBit!9720 (_2!9776 lt!335754)) (currentByte!9725 (_2!9776 lt!335754)))))))

(declare-fun lt!336638 () Bool)

(declare-fun res!179297 () Bool)

(assert (=> b!213346 (= res!179297 (and (= (_2!9779 lt!336627) lt!336638) (= (_1!9779 lt!336627) (_2!9776 lt!336608))))))

(declare-fun e!145334 () Bool)

(assert (=> b!213346 (=> (not res!179297) (not e!145334))))

(declare-fun e!145329 () Bool)

(assert (=> b!213346 (= e!145329 e!145334)))

(declare-fun b!213347 () Bool)

(declare-fun res!179296 () Bool)

(declare-fun call!3349 () Bool)

(assert (=> b!213347 (= res!179296 call!3349)))

(assert (=> b!213347 (=> (not res!179296) (not e!145329))))

(declare-fun b!213348 () Bool)

(declare-fun res!179298 () Bool)

(declare-fun e!145332 () Bool)

(assert (=> b!213348 (=> (not res!179298) (not e!145332))))

(declare-fun lt!336594 () tuple2!18242)

(assert (=> b!213348 (= res!179298 (= (size!4630 (buf!5159 (_2!9776 lt!335754))) (size!4630 (buf!5159 (_2!9776 lt!336594)))))))

(declare-fun b!213349 () Bool)

(declare-fun e!145336 () tuple2!18242)

(declare-fun lt!336642 () tuple2!18242)

(assert (=> b!213349 (= e!145336 (tuple2!18243 (_1!9776 lt!336642) (_2!9776 lt!336642)))))

(assert (=> b!213349 (= lt!336638 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213349 (= lt!336608 (appendBit!0 (_2!9776 lt!335754) lt!336638))))

(declare-fun res!179302 () Bool)

(assert (=> b!213349 (= res!179302 (= (size!4630 (buf!5159 (_2!9776 lt!335754))) (size!4630 (buf!5159 (_2!9776 lt!336608)))))))

(assert (=> b!213349 (=> (not res!179302) (not e!145329))))

(assert (=> b!213349 e!145329))

(declare-fun lt!336616 () tuple2!18242)

(assert (=> b!213349 (= lt!336616 lt!336608)))

(assert (=> b!213349 (= lt!336642 (appendBitsLSBFirstLoopTR!0 (_2!9776 lt!336616) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!336641 () Unit!15166)

(assert (=> b!213349 (= lt!336641 (lemmaIsPrefixTransitive!0 (_2!9776 lt!335754) (_2!9776 lt!336616) (_2!9776 lt!336642)))))

(assert (=> b!213349 (isPrefixOf!0 (_2!9776 lt!335754) (_2!9776 lt!336642))))

(declare-fun lt!336606 () Unit!15166)

(assert (=> b!213349 (= lt!336606 lt!336641)))

(assert (=> b!213349 (invariant!0 (currentBit!9720 (_2!9776 lt!335754)) (currentByte!9725 (_2!9776 lt!335754)) (size!4630 (buf!5159 (_2!9776 lt!336616))))))

(declare-fun lt!336625 () BitStream!8368)

(assert (=> b!213349 (= lt!336625 (BitStream!8369 (buf!5159 (_2!9776 lt!336616)) (currentByte!9725 (_2!9776 lt!335754)) (currentBit!9720 (_2!9776 lt!335754))))))

(assert (=> b!213349 (invariant!0 (currentBit!9720 lt!336625) (currentByte!9725 lt!336625) (size!4630 (buf!5159 (_2!9776 lt!336642))))))

(declare-fun lt!336639 () BitStream!8368)

(assert (=> b!213349 (= lt!336639 (BitStream!8369 (buf!5159 (_2!9776 lt!336642)) (currentByte!9725 lt!336625) (currentBit!9720 lt!336625)))))

(declare-fun lt!336619 () tuple2!18248)

(assert (=> b!213349 (= lt!336619 (readBitPure!0 lt!336625))))

(declare-fun lt!336647 () tuple2!18248)

(assert (=> b!213349 (= lt!336647 (readBitPure!0 lt!336639))))

(declare-fun lt!336643 () Unit!15166)

(assert (=> b!213349 (= lt!336643 (readBitPrefixLemma!0 lt!336625 (_2!9776 lt!336642)))))

(declare-fun res!179293 () Bool)

(assert (=> b!213349 (= res!179293 (= (bitIndex!0 (size!4630 (buf!5159 (_1!9779 lt!336619))) (currentByte!9725 (_1!9779 lt!336619)) (currentBit!9720 (_1!9779 lt!336619))) (bitIndex!0 (size!4630 (buf!5159 (_1!9779 lt!336647))) (currentByte!9725 (_1!9779 lt!336647)) (currentBit!9720 (_1!9779 lt!336647)))))))

(declare-fun e!145333 () Bool)

(assert (=> b!213349 (=> (not res!179293) (not e!145333))))

(assert (=> b!213349 e!145333))

(declare-fun lt!336630 () Unit!15166)

(assert (=> b!213349 (= lt!336630 lt!336643)))

(declare-fun lt!336628 () tuple2!18246)

(assert (=> b!213349 (= lt!336628 (reader!0 (_2!9776 lt!335754) (_2!9776 lt!336642)))))

(declare-fun lt!336649 () tuple2!18246)

(assert (=> b!213349 (= lt!336649 (reader!0 (_2!9776 lt!336616) (_2!9776 lt!336642)))))

(declare-fun lt!336626 () tuple2!18248)

(assert (=> b!213349 (= lt!336626 (readBitPure!0 (_1!9778 lt!336628)))))

(assert (=> b!213349 (= (_2!9779 lt!336626) lt!336638)))

(declare-fun lt!336633 () Unit!15166)

(declare-fun Unit!15173 () Unit!15166)

(assert (=> b!213349 (= lt!336633 Unit!15173)))

(declare-fun lt!336622 () (_ BitVec 64))

(assert (=> b!213349 (= lt!336622 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!336632 () (_ BitVec 64))

(assert (=> b!213349 (= lt!336632 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!336648 () Unit!15166)

(assert (=> b!213349 (= lt!336648 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9776 lt!335754) (buf!5159 (_2!9776 lt!336642)) lt!336632))))

(assert (=> b!213349 (validate_offset_bits!1 ((_ sign_extend 32) (size!4630 (buf!5159 (_2!9776 lt!336642)))) ((_ sign_extend 32) (currentByte!9725 (_2!9776 lt!335754))) ((_ sign_extend 32) (currentBit!9720 (_2!9776 lt!335754))) lt!336632)))

(declare-fun lt!336597 () Unit!15166)

(assert (=> b!213349 (= lt!336597 lt!336648)))

(declare-fun lt!336634 () tuple2!18244)

(assert (=> b!213349 (= lt!336634 (readNBitsLSBFirstsLoopPure!0 (_1!9778 lt!336628) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!336622))))

(declare-fun lt!336644 () (_ BitVec 64))

(assert (=> b!213349 (= lt!336644 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!336611 () Unit!15166)

(assert (=> b!213349 (= lt!336611 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9776 lt!336616) (buf!5159 (_2!9776 lt!336642)) lt!336644))))

(assert (=> b!213349 (validate_offset_bits!1 ((_ sign_extend 32) (size!4630 (buf!5159 (_2!9776 lt!336642)))) ((_ sign_extend 32) (currentByte!9725 (_2!9776 lt!336616))) ((_ sign_extend 32) (currentBit!9720 (_2!9776 lt!336616))) lt!336644)))

(declare-fun lt!336601 () Unit!15166)

(assert (=> b!213349 (= lt!336601 lt!336611)))

(declare-fun lt!336624 () tuple2!18244)

(assert (=> b!213349 (= lt!336624 (readNBitsLSBFirstsLoopPure!0 (_1!9778 lt!336649) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!336622 (ite (_2!9779 lt!336626) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!336623 () tuple2!18244)

(assert (=> b!213349 (= lt!336623 (readNBitsLSBFirstsLoopPure!0 (_1!9778 lt!336628) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!336622))))

(declare-fun c!10466 () Bool)

(assert (=> b!213349 (= c!10466 (_2!9779 (readBitPure!0 (_1!9778 lt!336628))))))

(declare-fun lt!336612 () tuple2!18244)

(declare-fun e!145337 () (_ BitVec 64))

(assert (=> b!213349 (= lt!336612 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9778 lt!336628) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!336622 e!145337)))))

(declare-fun lt!336595 () Unit!15166)

(assert (=> b!213349 (= lt!336595 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9778 lt!336628) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!336622))))

(assert (=> b!213349 (and (= (_2!9777 lt!336623) (_2!9777 lt!336612)) (= (_1!9777 lt!336623) (_1!9777 lt!336612)))))

(declare-fun lt!336617 () Unit!15166)

(assert (=> b!213349 (= lt!336617 lt!336595)))

(assert (=> b!213349 (= (_1!9778 lt!336628) (withMovedBitIndex!0 (_2!9778 lt!336628) (bvsub (bitIndex!0 (size!4630 (buf!5159 (_2!9776 lt!335754))) (currentByte!9725 (_2!9776 lt!335754)) (currentBit!9720 (_2!9776 lt!335754))) (bitIndex!0 (size!4630 (buf!5159 (_2!9776 lt!336642))) (currentByte!9725 (_2!9776 lt!336642)) (currentBit!9720 (_2!9776 lt!336642))))))))

(declare-fun lt!336631 () Unit!15166)

(declare-fun Unit!15174 () Unit!15166)

(assert (=> b!213349 (= lt!336631 Unit!15174)))

(assert (=> b!213349 (= (_1!9778 lt!336649) (withMovedBitIndex!0 (_2!9778 lt!336649) (bvsub (bitIndex!0 (size!4630 (buf!5159 (_2!9776 lt!336616))) (currentByte!9725 (_2!9776 lt!336616)) (currentBit!9720 (_2!9776 lt!336616))) (bitIndex!0 (size!4630 (buf!5159 (_2!9776 lt!336642))) (currentByte!9725 (_2!9776 lt!336642)) (currentBit!9720 (_2!9776 lt!336642))))))))

(declare-fun lt!336618 () Unit!15166)

(declare-fun Unit!15176 () Unit!15166)

(assert (=> b!213349 (= lt!336618 Unit!15176)))

(assert (=> b!213349 (= (bitIndex!0 (size!4630 (buf!5159 (_2!9776 lt!335754))) (currentByte!9725 (_2!9776 lt!335754)) (currentBit!9720 (_2!9776 lt!335754))) (bvsub (bitIndex!0 (size!4630 (buf!5159 (_2!9776 lt!336616))) (currentByte!9725 (_2!9776 lt!336616)) (currentBit!9720 (_2!9776 lt!336616))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!336635 () Unit!15166)

(declare-fun Unit!15177 () Unit!15166)

(assert (=> b!213349 (= lt!336635 Unit!15177)))

(assert (=> b!213349 (= (_2!9777 lt!336634) (_2!9777 lt!336624))))

(declare-fun lt!336610 () Unit!15166)

(declare-fun Unit!15178 () Unit!15166)

(assert (=> b!213349 (= lt!336610 Unit!15178)))

(assert (=> b!213349 (invariant!0 (currentBit!9720 (_2!9776 lt!336642)) (currentByte!9725 (_2!9776 lt!336642)) (size!4630 (buf!5159 (_2!9776 lt!336642))))))

(declare-fun lt!336604 () Unit!15166)

(declare-fun Unit!15179 () Unit!15166)

(assert (=> b!213349 (= lt!336604 Unit!15179)))

(assert (=> b!213349 (= (size!4630 (buf!5159 (_2!9776 lt!335754))) (size!4630 (buf!5159 (_2!9776 lt!336642))))))

(declare-fun lt!336605 () Unit!15166)

(declare-fun Unit!15180 () Unit!15166)

(assert (=> b!213349 (= lt!336605 Unit!15180)))

(assert (=> b!213349 (= (bitIndex!0 (size!4630 (buf!5159 (_2!9776 lt!336642))) (currentByte!9725 (_2!9776 lt!336642)) (currentBit!9720 (_2!9776 lt!336642))) (bvsub (bvadd (bitIndex!0 (size!4630 (buf!5159 (_2!9776 lt!335754))) (currentByte!9725 (_2!9776 lt!335754)) (currentBit!9720 (_2!9776 lt!335754))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!336615 () Unit!15166)

(declare-fun Unit!15181 () Unit!15166)

(assert (=> b!213349 (= lt!336615 Unit!15181)))

(declare-fun lt!336607 () Unit!15166)

(declare-fun Unit!15182 () Unit!15166)

(assert (=> b!213349 (= lt!336607 Unit!15182)))

(assert (=> b!213349 (= lt!336621 (reader!0 (_2!9776 lt!335754) (_2!9776 lt!336642)))))

(declare-fun lt!336596 () (_ BitVec 64))

(assert (=> b!213349 (= lt!336596 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!336603 () Unit!15166)

(assert (=> b!213349 (= lt!336603 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9776 lt!335754) (buf!5159 (_2!9776 lt!336642)) lt!336596))))

(assert (=> b!213349 (validate_offset_bits!1 ((_ sign_extend 32) (size!4630 (buf!5159 (_2!9776 lt!336642)))) ((_ sign_extend 32) (currentByte!9725 (_2!9776 lt!335754))) ((_ sign_extend 32) (currentBit!9720 (_2!9776 lt!335754))) lt!336596)))

(declare-fun lt!336614 () Unit!15166)

(assert (=> b!213349 (= lt!336614 lt!336603)))

(assert (=> b!213349 (= lt!336640 (readNBitsLSBFirstsLoopPure!0 (_1!9778 lt!336621) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!179295 () Bool)

(assert (=> b!213349 (= res!179295 (= (_2!9777 lt!336640) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!213349 (=> (not res!179295) (not e!145330))))

(assert (=> b!213349 e!145330))

(declare-fun lt!336645 () Unit!15166)

(declare-fun Unit!15183 () Unit!15166)

(assert (=> b!213349 (= lt!336645 Unit!15183)))

(declare-fun b!213350 () Bool)

(declare-fun res!179294 () Bool)

(assert (=> b!213350 (=> (not res!179294) (not e!145332))))

(declare-fun lt!336609 () (_ BitVec 64))

(declare-fun lt!336598 () (_ BitVec 64))

(assert (=> b!213350 (= res!179294 (= (bitIndex!0 (size!4630 (buf!5159 (_2!9776 lt!336594))) (currentByte!9725 (_2!9776 lt!336594)) (currentBit!9720 (_2!9776 lt!336594))) (bvsub lt!336609 lt!336598)))))

(assert (=> b!213350 (or (= (bvand lt!336609 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!336598 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!336609 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!336609 lt!336598) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213350 (= lt!336598 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!336637 () (_ BitVec 64))

(declare-fun lt!336613 () (_ BitVec 64))

(assert (=> b!213350 (= lt!336609 (bvadd lt!336637 lt!336613))))

(assert (=> b!213350 (or (not (= (bvand lt!336637 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!336613 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!336637 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!336637 lt!336613) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213350 (= lt!336613 ((_ sign_extend 32) nBits!348))))

(assert (=> b!213350 (= lt!336637 (bitIndex!0 (size!4630 (buf!5159 (_2!9776 lt!335754))) (currentByte!9725 (_2!9776 lt!335754)) (currentBit!9720 (_2!9776 lt!335754))))))

(declare-fun b!213351 () Bool)

(assert (=> b!213351 (= e!145337 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!213352 () Bool)

(declare-fun Unit!15184 () Unit!15166)

(assert (=> b!213352 (= e!145336 (tuple2!18243 Unit!15184 (_2!9776 lt!335754)))))

(declare-fun lt!336646 () Unit!15166)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8368) Unit!15166)

(assert (=> b!213352 (= lt!336646 (lemmaIsPrefixRefl!0 (_2!9776 lt!335754)))))

(assert (=> b!213352 call!3349))

(declare-fun lt!336600 () Unit!15166)

(assert (=> b!213352 (= lt!336600 lt!336646)))

(declare-fun b!213353 () Bool)

(declare-fun e!145331 () Bool)

(declare-fun lt!336629 () tuple2!18244)

(declare-fun lt!336602 () tuple2!18246)

(assert (=> b!213353 (= e!145331 (= (_1!9777 lt!336629) (_2!9778 lt!336602)))))

(declare-fun b!213354 () Bool)

(declare-fun e!145335 () Bool)

(declare-fun lt!336620 () (_ BitVec 64))

(assert (=> b!213354 (= e!145335 (validate_offset_bits!1 ((_ sign_extend 32) (size!4630 (buf!5159 (_2!9776 lt!335754)))) ((_ sign_extend 32) (currentByte!9725 (_2!9776 lt!335754))) ((_ sign_extend 32) (currentBit!9720 (_2!9776 lt!335754))) lt!336620))))

(declare-fun b!213355 () Bool)

(declare-fun res!179301 () Bool)

(assert (=> b!213355 (= res!179301 (= (bitIndex!0 (size!4630 (buf!5159 (_2!9776 lt!336608))) (currentByte!9725 (_2!9776 lt!336608)) (currentBit!9720 (_2!9776 lt!336608))) (bvadd (bitIndex!0 (size!4630 (buf!5159 (_2!9776 lt!335754))) (currentByte!9725 (_2!9776 lt!335754)) (currentBit!9720 (_2!9776 lt!335754))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!213355 (=> (not res!179301) (not e!145329))))

(declare-fun b!213356 () Bool)

(assert (=> b!213356 (= e!145333 (= (_2!9779 lt!336619) (_2!9779 lt!336647)))))

(declare-fun b!213357 () Bool)

(assert (=> b!213357 (= e!145334 (= (bitIndex!0 (size!4630 (buf!5159 (_1!9779 lt!336627))) (currentByte!9725 (_1!9779 lt!336627)) (currentBit!9720 (_1!9779 lt!336627))) (bitIndex!0 (size!4630 (buf!5159 (_2!9776 lt!336608))) (currentByte!9725 (_2!9776 lt!336608)) (currentBit!9720 (_2!9776 lt!336608)))))))

(declare-fun b!213358 () Bool)

(declare-fun res!179292 () Bool)

(assert (=> b!213358 (=> (not res!179292) (not e!145332))))

(assert (=> b!213358 (= res!179292 (isPrefixOf!0 (_2!9776 lt!335754) (_2!9776 lt!336594)))))

(declare-fun b!213359 () Bool)

(assert (=> b!213359 (= e!145332 e!145331)))

(declare-fun res!179291 () Bool)

(assert (=> b!213359 (=> (not res!179291) (not e!145331))))

(assert (=> b!213359 (= res!179291 (= (_2!9777 lt!336629) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!213359 (= lt!336629 (readNBitsLSBFirstsLoopPure!0 (_1!9778 lt!336602) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!336599 () Unit!15166)

(declare-fun lt!336636 () Unit!15166)

(assert (=> b!213359 (= lt!336599 lt!336636)))

(assert (=> b!213359 (validate_offset_bits!1 ((_ sign_extend 32) (size!4630 (buf!5159 (_2!9776 lt!336594)))) ((_ sign_extend 32) (currentByte!9725 (_2!9776 lt!335754))) ((_ sign_extend 32) (currentBit!9720 (_2!9776 lt!335754))) lt!336620)))

(assert (=> b!213359 (= lt!336636 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9776 lt!335754) (buf!5159 (_2!9776 lt!336594)) lt!336620))))

(assert (=> b!213359 e!145335))

(declare-fun res!179300 () Bool)

(assert (=> b!213359 (=> (not res!179300) (not e!145335))))

(assert (=> b!213359 (= res!179300 (and (= (size!4630 (buf!5159 (_2!9776 lt!335754))) (size!4630 (buf!5159 (_2!9776 lt!336594)))) (bvsge lt!336620 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213359 (= lt!336620 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!213359 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!213359 (= lt!336602 (reader!0 (_2!9776 lt!335754) (_2!9776 lt!336594)))))

(declare-fun b!213360 () Bool)

(assert (=> b!213360 (= e!145337 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun d!72069 () Bool)

(assert (=> d!72069 e!145332))

(declare-fun res!179299 () Bool)

(assert (=> d!72069 (=> (not res!179299) (not e!145332))))

(assert (=> d!72069 (= res!179299 (invariant!0 (currentBit!9720 (_2!9776 lt!336594)) (currentByte!9725 (_2!9776 lt!336594)) (size!4630 (buf!5159 (_2!9776 lt!336594)))))))

(assert (=> d!72069 (= lt!336594 e!145336)))

(declare-fun c!10465 () Bool)

(assert (=> d!72069 (= c!10465 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!72069 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!72069 (= (appendBitsLSBFirstLoopTR!0 (_2!9776 lt!335754) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!336594)))

(declare-fun bm!3346 () Bool)

(assert (=> bm!3346 (= call!3349 (isPrefixOf!0 (_2!9776 lt!335754) (ite c!10465 (_2!9776 lt!335754) (_2!9776 lt!336608))))))

(assert (= (and d!72069 c!10465) b!213352))

(assert (= (and d!72069 (not c!10465)) b!213349))

(assert (= (and b!213349 res!179302) b!213355))

(assert (= (and b!213355 res!179301) b!213347))

(assert (= (and b!213347 res!179296) b!213346))

(assert (= (and b!213346 res!179297) b!213357))

(assert (= (and b!213349 res!179293) b!213356))

(assert (= (and b!213349 c!10466) b!213351))

(assert (= (and b!213349 (not c!10466)) b!213360))

(assert (= (and b!213349 res!179295) b!213345))

(assert (= (or b!213352 b!213347) bm!3346))

(assert (= (and d!72069 res!179299) b!213348))

(assert (= (and b!213348 res!179298) b!213350))

(assert (= (and b!213350 res!179294) b!213358))

(assert (= (and b!213358 res!179292) b!213359))

(assert (= (and b!213359 res!179300) b!213354))

(assert (= (and b!213359 res!179291) b!213353))

(declare-fun m!328589 () Bool)

(assert (=> b!213357 m!328589))

(declare-fun m!328591 () Bool)

(assert (=> b!213357 m!328591))

(declare-fun m!328593 () Bool)

(assert (=> b!213352 m!328593))

(declare-fun m!328595 () Bool)

(assert (=> b!213350 m!328595))

(assert (=> b!213350 m!328133))

(declare-fun m!328597 () Bool)

(assert (=> b!213346 m!328597))

(assert (=> b!213346 m!328597))

(declare-fun m!328599 () Bool)

(assert (=> b!213346 m!328599))

(declare-fun m!328601 () Bool)

(assert (=> b!213354 m!328601))

(declare-fun m!328603 () Bool)

(assert (=> b!213358 m!328603))

(declare-fun m!328605 () Bool)

(assert (=> b!213349 m!328605))

(declare-fun m!328607 () Bool)

(assert (=> b!213349 m!328607))

(declare-fun m!328609 () Bool)

(assert (=> b!213349 m!328609))

(declare-fun m!328611 () Bool)

(assert (=> b!213349 m!328611))

(declare-fun m!328613 () Bool)

(assert (=> b!213349 m!328613))

(declare-fun m!328615 () Bool)

(assert (=> b!213349 m!328615))

(declare-fun m!328617 () Bool)

(assert (=> b!213349 m!328617))

(declare-fun m!328619 () Bool)

(assert (=> b!213349 m!328619))

(assert (=> b!213349 m!328133))

(assert (=> b!213349 m!328617))

(declare-fun m!328621 () Bool)

(assert (=> b!213349 m!328621))

(declare-fun m!328623 () Bool)

(assert (=> b!213349 m!328623))

(declare-fun m!328625 () Bool)

(assert (=> b!213349 m!328625))

(declare-fun m!328627 () Bool)

(assert (=> b!213349 m!328627))

(declare-fun m!328629 () Bool)

(assert (=> b!213349 m!328629))

(declare-fun m!328631 () Bool)

(assert (=> b!213349 m!328631))

(declare-fun m!328633 () Bool)

(assert (=> b!213349 m!328633))

(declare-fun m!328635 () Bool)

(assert (=> b!213349 m!328635))

(declare-fun m!328637 () Bool)

(assert (=> b!213349 m!328637))

(declare-fun m!328639 () Bool)

(assert (=> b!213349 m!328639))

(declare-fun m!328641 () Bool)

(assert (=> b!213349 m!328641))

(declare-fun m!328643 () Bool)

(assert (=> b!213349 m!328643))

(declare-fun m!328645 () Bool)

(assert (=> b!213349 m!328645))

(declare-fun m!328647 () Bool)

(assert (=> b!213349 m!328647))

(declare-fun m!328649 () Bool)

(assert (=> b!213349 m!328649))

(declare-fun m!328651 () Bool)

(assert (=> b!213349 m!328651))

(declare-fun m!328653 () Bool)

(assert (=> b!213349 m!328653))

(declare-fun m!328655 () Bool)

(assert (=> b!213349 m!328655))

(declare-fun m!328657 () Bool)

(assert (=> b!213349 m!328657))

(declare-fun m!328659 () Bool)

(assert (=> b!213349 m!328659))

(declare-fun m!328661 () Bool)

(assert (=> b!213349 m!328661))

(declare-fun m!328663 () Bool)

(assert (=> b!213349 m!328663))

(declare-fun m!328665 () Bool)

(assert (=> b!213349 m!328665))

(declare-fun m!328667 () Bool)

(assert (=> b!213349 m!328667))

(declare-fun m!328669 () Bool)

(assert (=> b!213349 m!328669))

(declare-fun m!328671 () Bool)

(assert (=> bm!3346 m!328671))

(declare-fun m!328673 () Bool)

(assert (=> b!213359 m!328673))

(declare-fun m!328675 () Bool)

(assert (=> b!213359 m!328675))

(declare-fun m!328677 () Bool)

(assert (=> b!213359 m!328677))

(assert (=> b!213359 m!328619))

(declare-fun m!328679 () Bool)

(assert (=> b!213359 m!328679))

(assert (=> b!213359 m!328667))

(declare-fun m!328681 () Bool)

(assert (=> d!72069 m!328681))

(assert (=> b!213355 m!328591))

(assert (=> b!213355 m!328133))

(assert (=> b!212965 d!72069))

(declare-fun d!72079 () Bool)

(declare-datatypes ((tuple2!18272 0))(
  ( (tuple2!18273 (_1!9791 Bool) (_2!9791 BitStream!8368)) )
))
(declare-fun lt!336708 () tuple2!18272)

(declare-fun readBit!0 (BitStream!8368) tuple2!18272)

(assert (=> d!72079 (= lt!336708 (readBit!0 (readerFrom!0 (_2!9776 lt!335754) (currentBit!9720 thiss!1204) (currentByte!9725 thiss!1204))))))

(assert (=> d!72079 (= (readBitPure!0 (readerFrom!0 (_2!9776 lt!335754) (currentBit!9720 thiss!1204) (currentByte!9725 thiss!1204))) (tuple2!18249 (_2!9791 lt!336708) (_1!9791 lt!336708)))))

(declare-fun bs!17683 () Bool)

(assert (= bs!17683 d!72079))

(assert (=> bs!17683 m!328121))

(declare-fun m!328683 () Bool)

(assert (=> bs!17683 m!328683))

(assert (=> b!212976 d!72079))

(declare-fun d!72081 () Bool)

(declare-fun e!145358 () Bool)

(assert (=> d!72081 e!145358))

(declare-fun res!179330 () Bool)

(assert (=> d!72081 (=> (not res!179330) (not e!145358))))

(assert (=> d!72081 (= res!179330 (invariant!0 (currentBit!9720 (_2!9776 lt!335754)) (currentByte!9725 (_2!9776 lt!335754)) (size!4630 (buf!5159 (_2!9776 lt!335754)))))))

(assert (=> d!72081 (= (readerFrom!0 (_2!9776 lt!335754) (currentBit!9720 thiss!1204) (currentByte!9725 thiss!1204)) (BitStream!8369 (buf!5159 (_2!9776 lt!335754)) (currentByte!9725 thiss!1204) (currentBit!9720 thiss!1204)))))

(declare-fun b!213395 () Bool)

(assert (=> b!213395 (= e!145358 (invariant!0 (currentBit!9720 thiss!1204) (currentByte!9725 thiss!1204) (size!4630 (buf!5159 (_2!9776 lt!335754)))))))

(assert (= (and d!72081 res!179330) b!213395))

(assert (=> d!72081 m!328545))

(assert (=> b!213395 m!328157))

(assert (=> b!212976 d!72081))

(declare-fun d!72083 () Bool)

(assert (=> d!72083 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9720 thiss!1204) (currentByte!9725 thiss!1204) (size!4630 (buf!5159 thiss!1204))))))

(declare-fun bs!17684 () Bool)

(assert (= bs!17684 d!72083))

(assert (=> bs!17684 m!328119))

(assert (=> start!44568 d!72083))

(declare-fun d!72085 () Bool)

(assert (=> d!72085 (= (invariant!0 (currentBit!9720 thiss!1204) (currentByte!9725 thiss!1204) (size!4630 (buf!5159 thiss!1204))) (and (bvsge (currentBit!9720 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9720 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9725 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9725 thiss!1204) (size!4630 (buf!5159 thiss!1204))) (and (= (currentBit!9720 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9725 thiss!1204) (size!4630 (buf!5159 thiss!1204)))))))))

(assert (=> b!212977 d!72085))

(assert (=> b!212967 d!72033))

(declare-fun d!72087 () Bool)

(assert (=> d!72087 (= (invariant!0 (currentBit!9720 (_2!9776 lt!335733)) (currentByte!9725 (_2!9776 lt!335733)) (size!4630 (buf!5159 (_2!9776 lt!335733)))) (and (bvsge (currentBit!9720 (_2!9776 lt!335733)) #b00000000000000000000000000000000) (bvslt (currentBit!9720 (_2!9776 lt!335733)) #b00000000000000000000000000001000) (bvsge (currentByte!9725 (_2!9776 lt!335733)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9725 (_2!9776 lt!335733)) (size!4630 (buf!5159 (_2!9776 lt!335733)))) (and (= (currentBit!9720 (_2!9776 lt!335733)) #b00000000000000000000000000000000) (= (currentByte!9725 (_2!9776 lt!335733)) (size!4630 (buf!5159 (_2!9776 lt!335733))))))))))

(assert (=> b!212957 d!72087))

(declare-fun d!72089 () Bool)

(declare-fun e!145359 () Bool)

(assert (=> d!72089 e!145359))

(declare-fun res!179331 () Bool)

(assert (=> d!72089 (=> (not res!179331) (not e!145359))))

(declare-fun lt!336766 () (_ BitVec 64))

(declare-fun lt!336767 () (_ BitVec 64))

(declare-fun lt!336768 () (_ BitVec 64))

(assert (=> d!72089 (= res!179331 (= lt!336766 (bvsub lt!336767 lt!336768)))))

(assert (=> d!72089 (or (= (bvand lt!336767 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!336768 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!336767 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!336767 lt!336768) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72089 (= lt!336768 (remainingBits!0 ((_ sign_extend 32) (size!4630 (buf!5159 (_1!9779 lt!335758)))) ((_ sign_extend 32) (currentByte!9725 (_1!9779 lt!335758))) ((_ sign_extend 32) (currentBit!9720 (_1!9779 lt!335758)))))))

(declare-fun lt!336770 () (_ BitVec 64))

(declare-fun lt!336765 () (_ BitVec 64))

(assert (=> d!72089 (= lt!336767 (bvmul lt!336770 lt!336765))))

(assert (=> d!72089 (or (= lt!336770 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!336765 (bvsdiv (bvmul lt!336770 lt!336765) lt!336770)))))

(assert (=> d!72089 (= lt!336765 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72089 (= lt!336770 ((_ sign_extend 32) (size!4630 (buf!5159 (_1!9779 lt!335758)))))))

(assert (=> d!72089 (= lt!336766 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9725 (_1!9779 lt!335758))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9720 (_1!9779 lt!335758)))))))

(assert (=> d!72089 (invariant!0 (currentBit!9720 (_1!9779 lt!335758)) (currentByte!9725 (_1!9779 lt!335758)) (size!4630 (buf!5159 (_1!9779 lt!335758))))))

(assert (=> d!72089 (= (bitIndex!0 (size!4630 (buf!5159 (_1!9779 lt!335758))) (currentByte!9725 (_1!9779 lt!335758)) (currentBit!9720 (_1!9779 lt!335758))) lt!336766)))

(declare-fun b!213396 () Bool)

(declare-fun res!179332 () Bool)

(assert (=> b!213396 (=> (not res!179332) (not e!145359))))

(assert (=> b!213396 (= res!179332 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!336766))))

(declare-fun b!213397 () Bool)

(declare-fun lt!336769 () (_ BitVec 64))

(assert (=> b!213397 (= e!145359 (bvsle lt!336766 (bvmul lt!336769 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213397 (or (= lt!336769 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!336769 #b0000000000000000000000000000000000000000000000000000000000001000) lt!336769)))))

(assert (=> b!213397 (= lt!336769 ((_ sign_extend 32) (size!4630 (buf!5159 (_1!9779 lt!335758)))))))

(assert (= (and d!72089 res!179331) b!213396))

(assert (= (and b!213396 res!179332) b!213397))

(declare-fun m!328787 () Bool)

(assert (=> d!72089 m!328787))

(declare-fun m!328791 () Bool)

(assert (=> d!72089 m!328791))

(assert (=> b!212968 d!72089))

(declare-fun d!72093 () Bool)

(assert (=> d!72093 (= (invariant!0 (currentBit!9720 thiss!1204) (currentByte!9725 thiss!1204) (size!4630 (buf!5159 (_2!9776 lt!335733)))) (and (bvsge (currentBit!9720 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9720 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9725 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9725 thiss!1204) (size!4630 (buf!5159 (_2!9776 lt!335733)))) (and (= (currentBit!9720 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9725 thiss!1204) (size!4630 (buf!5159 (_2!9776 lt!335733))))))))))

(assert (=> b!212958 d!72093))

(declare-fun d!72097 () Bool)

(assert (=> d!72097 (= (array_inv!4371 (buf!5159 thiss!1204)) (bvsge (size!4630 (buf!5159 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!212969 d!72097))

(declare-fun d!72099 () Bool)

(declare-fun e!145372 () Bool)

(assert (=> d!72099 e!145372))

(declare-fun res!179350 () Bool)

(assert (=> d!72099 (=> (not res!179350) (not e!145372))))

(declare-fun lt!336800 () tuple2!18248)

(declare-fun lt!336797 () tuple2!18248)

(assert (=> d!72099 (= res!179350 (= (bitIndex!0 (size!4630 (buf!5159 (_1!9779 lt!336800))) (currentByte!9725 (_1!9779 lt!336800)) (currentBit!9720 (_1!9779 lt!336800))) (bitIndex!0 (size!4630 (buf!5159 (_1!9779 lt!336797))) (currentByte!9725 (_1!9779 lt!336797)) (currentBit!9720 (_1!9779 lt!336797)))))))

(declare-fun lt!336798 () Unit!15166)

(declare-fun lt!336799 () BitStream!8368)

(declare-fun choose!50 (BitStream!8368 BitStream!8368 BitStream!8368 tuple2!18248 tuple2!18248 BitStream!8368 Bool tuple2!18248 tuple2!18248 BitStream!8368 Bool) Unit!15166)

(assert (=> d!72099 (= lt!336798 (choose!50 lt!335736 (_2!9776 lt!335733) lt!336799 lt!336800 (tuple2!18249 (_1!9779 lt!336800) (_2!9779 lt!336800)) (_1!9779 lt!336800) (_2!9779 lt!336800) lt!336797 (tuple2!18249 (_1!9779 lt!336797) (_2!9779 lt!336797)) (_1!9779 lt!336797) (_2!9779 lt!336797)))))

(assert (=> d!72099 (= lt!336797 (readBitPure!0 lt!336799))))

(assert (=> d!72099 (= lt!336800 (readBitPure!0 lt!335736))))

(assert (=> d!72099 (= lt!336799 (BitStream!8369 (buf!5159 (_2!9776 lt!335733)) (currentByte!9725 lt!335736) (currentBit!9720 lt!335736)))))

(assert (=> d!72099 (invariant!0 (currentBit!9720 lt!335736) (currentByte!9725 lt!335736) (size!4630 (buf!5159 (_2!9776 lt!335733))))))

(assert (=> d!72099 (= (readBitPrefixLemma!0 lt!335736 (_2!9776 lt!335733)) lt!336798)))

(declare-fun b!213414 () Bool)

(assert (=> b!213414 (= e!145372 (= (_2!9779 lt!336800) (_2!9779 lt!336797)))))

(assert (= (and d!72099 res!179350) b!213414))

(declare-fun m!328899 () Bool)

(assert (=> d!72099 m!328899))

(declare-fun m!328901 () Bool)

(assert (=> d!72099 m!328901))

(declare-fun m!328903 () Bool)

(assert (=> d!72099 m!328903))

(assert (=> d!72099 m!328155))

(declare-fun m!328905 () Bool)

(assert (=> d!72099 m!328905))

(declare-fun m!328907 () Bool)

(assert (=> d!72099 m!328907))

(assert (=> b!212959 d!72099))

(declare-fun d!72119 () Bool)

(assert (=> d!72119 (validate_offset_bits!1 ((_ sign_extend 32) (size!4630 (buf!5159 (_2!9776 lt!335733)))) ((_ sign_extend 32) (currentByte!9725 (_2!9776 lt!335754))) ((_ sign_extend 32) (currentBit!9720 (_2!9776 lt!335754))) lt!335735)))

(declare-fun lt!336803 () Unit!15166)

(declare-fun choose!9 (BitStream!8368 array!10541 (_ BitVec 64) BitStream!8368) Unit!15166)

(assert (=> d!72119 (= lt!336803 (choose!9 (_2!9776 lt!335754) (buf!5159 (_2!9776 lt!335733)) lt!335735 (BitStream!8369 (buf!5159 (_2!9776 lt!335733)) (currentByte!9725 (_2!9776 lt!335754)) (currentBit!9720 (_2!9776 lt!335754)))))))

(assert (=> d!72119 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9776 lt!335754) (buf!5159 (_2!9776 lt!335733)) lt!335735) lt!336803)))

(declare-fun bs!17687 () Bool)

(assert (= bs!17687 d!72119))

(assert (=> bs!17687 m!328145))

(declare-fun m!328909 () Bool)

(assert (=> bs!17687 m!328909))

(assert (=> b!212959 d!72119))

(declare-fun d!72121 () Bool)

(assert (=> d!72121 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!212959 d!72121))

(declare-fun b!213446 () Bool)

(declare-fun e!145389 () Unit!15166)

(declare-fun Unit!15207 () Unit!15166)

(assert (=> b!213446 (= e!145389 Unit!15207)))

(declare-fun b!213447 () Bool)

(declare-fun lt!336908 () Unit!15166)

(assert (=> b!213447 (= e!145389 lt!336908)))

(declare-fun lt!336899 () (_ BitVec 64))

(assert (=> b!213447 (= lt!336899 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!336913 () (_ BitVec 64))

(assert (=> b!213447 (= lt!336913 (bitIndex!0 (size!4630 (buf!5159 (_2!9776 lt!335754))) (currentByte!9725 (_2!9776 lt!335754)) (currentBit!9720 (_2!9776 lt!335754))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10541 array!10541 (_ BitVec 64) (_ BitVec 64)) Unit!15166)

(assert (=> b!213447 (= lt!336908 (arrayBitRangesEqSymmetric!0 (buf!5159 (_2!9776 lt!335754)) (buf!5159 (_2!9776 lt!335733)) lt!336899 lt!336913))))

(assert (=> b!213447 (arrayBitRangesEq!0 (buf!5159 (_2!9776 lt!335733)) (buf!5159 (_2!9776 lt!335754)) lt!336899 lt!336913)))

(declare-fun b!213448 () Bool)

(declare-fun res!179378 () Bool)

(declare-fun e!145390 () Bool)

(assert (=> b!213448 (=> (not res!179378) (not e!145390))))

(declare-fun lt!336898 () tuple2!18246)

(assert (=> b!213448 (= res!179378 (isPrefixOf!0 (_1!9778 lt!336898) (_2!9776 lt!335754)))))

(declare-fun d!72123 () Bool)

(assert (=> d!72123 e!145390))

(declare-fun res!179377 () Bool)

(assert (=> d!72123 (=> (not res!179377) (not e!145390))))

(assert (=> d!72123 (= res!179377 (isPrefixOf!0 (_1!9778 lt!336898) (_2!9778 lt!336898)))))

(declare-fun lt!336895 () BitStream!8368)

(assert (=> d!72123 (= lt!336898 (tuple2!18247 lt!336895 (_2!9776 lt!335733)))))

(declare-fun lt!336894 () Unit!15166)

(declare-fun lt!336904 () Unit!15166)

(assert (=> d!72123 (= lt!336894 lt!336904)))

(assert (=> d!72123 (isPrefixOf!0 lt!336895 (_2!9776 lt!335733))))

(assert (=> d!72123 (= lt!336904 (lemmaIsPrefixTransitive!0 lt!336895 (_2!9776 lt!335733) (_2!9776 lt!335733)))))

(declare-fun lt!336897 () Unit!15166)

(declare-fun lt!336900 () Unit!15166)

(assert (=> d!72123 (= lt!336897 lt!336900)))

(assert (=> d!72123 (isPrefixOf!0 lt!336895 (_2!9776 lt!335733))))

(assert (=> d!72123 (= lt!336900 (lemmaIsPrefixTransitive!0 lt!336895 (_2!9776 lt!335754) (_2!9776 lt!335733)))))

(declare-fun lt!336911 () Unit!15166)

(assert (=> d!72123 (= lt!336911 e!145389)))

(declare-fun c!10473 () Bool)

(assert (=> d!72123 (= c!10473 (not (= (size!4630 (buf!5159 (_2!9776 lt!335754))) #b00000000000000000000000000000000)))))

(declare-fun lt!336901 () Unit!15166)

(declare-fun lt!336907 () Unit!15166)

(assert (=> d!72123 (= lt!336901 lt!336907)))

(assert (=> d!72123 (isPrefixOf!0 (_2!9776 lt!335733) (_2!9776 lt!335733))))

(assert (=> d!72123 (= lt!336907 (lemmaIsPrefixRefl!0 (_2!9776 lt!335733)))))

(declare-fun lt!336910 () Unit!15166)

(declare-fun lt!336903 () Unit!15166)

(assert (=> d!72123 (= lt!336910 lt!336903)))

(assert (=> d!72123 (= lt!336903 (lemmaIsPrefixRefl!0 (_2!9776 lt!335733)))))

(declare-fun lt!336912 () Unit!15166)

(declare-fun lt!336905 () Unit!15166)

(assert (=> d!72123 (= lt!336912 lt!336905)))

(assert (=> d!72123 (isPrefixOf!0 lt!336895 lt!336895)))

(assert (=> d!72123 (= lt!336905 (lemmaIsPrefixRefl!0 lt!336895))))

(declare-fun lt!336906 () Unit!15166)

(declare-fun lt!336909 () Unit!15166)

(assert (=> d!72123 (= lt!336906 lt!336909)))

(assert (=> d!72123 (isPrefixOf!0 (_2!9776 lt!335754) (_2!9776 lt!335754))))

(assert (=> d!72123 (= lt!336909 (lemmaIsPrefixRefl!0 (_2!9776 lt!335754)))))

(assert (=> d!72123 (= lt!336895 (BitStream!8369 (buf!5159 (_2!9776 lt!335733)) (currentByte!9725 (_2!9776 lt!335754)) (currentBit!9720 (_2!9776 lt!335754))))))

(assert (=> d!72123 (isPrefixOf!0 (_2!9776 lt!335754) (_2!9776 lt!335733))))

(assert (=> d!72123 (= (reader!0 (_2!9776 lt!335754) (_2!9776 lt!335733)) lt!336898)))

(declare-fun lt!336902 () (_ BitVec 64))

(declare-fun lt!336896 () (_ BitVec 64))

(declare-fun b!213449 () Bool)

(assert (=> b!213449 (= e!145390 (= (_1!9778 lt!336898) (withMovedBitIndex!0 (_2!9778 lt!336898) (bvsub lt!336896 lt!336902))))))

(assert (=> b!213449 (or (= (bvand lt!336896 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!336902 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!336896 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!336896 lt!336902) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213449 (= lt!336902 (bitIndex!0 (size!4630 (buf!5159 (_2!9776 lt!335733))) (currentByte!9725 (_2!9776 lt!335733)) (currentBit!9720 (_2!9776 lt!335733))))))

(assert (=> b!213449 (= lt!336896 (bitIndex!0 (size!4630 (buf!5159 (_2!9776 lt!335754))) (currentByte!9725 (_2!9776 lt!335754)) (currentBit!9720 (_2!9776 lt!335754))))))

(declare-fun b!213450 () Bool)

(declare-fun res!179379 () Bool)

(assert (=> b!213450 (=> (not res!179379) (not e!145390))))

(assert (=> b!213450 (= res!179379 (isPrefixOf!0 (_2!9778 lt!336898) (_2!9776 lt!335733)))))

(assert (= (and d!72123 c!10473) b!213447))

(assert (= (and d!72123 (not c!10473)) b!213446))

(assert (= (and d!72123 res!179377) b!213448))

(assert (= (and b!213448 res!179378) b!213450))

(assert (= (and b!213450 res!179379) b!213449))

(assert (=> b!213447 m!328133))

(declare-fun m!328941 () Bool)

(assert (=> b!213447 m!328941))

(declare-fun m!328943 () Bool)

(assert (=> b!213447 m!328943))

(declare-fun m!328945 () Bool)

(assert (=> b!213450 m!328945))

(declare-fun m!328947 () Bool)

(assert (=> b!213448 m!328947))

(declare-fun m!328949 () Bool)

(assert (=> b!213449 m!328949))

(assert (=> b!213449 m!328125))

(assert (=> b!213449 m!328133))

(declare-fun m!328951 () Bool)

(assert (=> d!72123 m!328951))

(declare-fun m!328953 () Bool)

(assert (=> d!72123 m!328953))

(declare-fun m!328955 () Bool)

(assert (=> d!72123 m!328955))

(declare-fun m!328957 () Bool)

(assert (=> d!72123 m!328957))

(declare-fun m!328959 () Bool)

(assert (=> d!72123 m!328959))

(assert (=> d!72123 m!328187))

(declare-fun m!328961 () Bool)

(assert (=> d!72123 m!328961))

(assert (=> d!72123 m!328593))

(declare-fun m!328963 () Bool)

(assert (=> d!72123 m!328963))

(declare-fun m!328965 () Bool)

(assert (=> d!72123 m!328965))

(declare-fun m!328967 () Bool)

(assert (=> d!72123 m!328967))

(assert (=> b!212959 d!72123))

(declare-fun d!72135 () Bool)

(declare-fun lt!336934 () tuple2!18272)

(assert (=> d!72135 (= lt!336934 (readBit!0 (_1!9778 lt!335738)))))

(assert (=> d!72135 (= (readBitPure!0 (_1!9778 lt!335738)) (tuple2!18249 (_2!9791 lt!336934) (_1!9791 lt!336934)))))

(declare-fun bs!17689 () Bool)

(assert (= bs!17689 d!72135))

(declare-fun m!328969 () Bool)

(assert (=> bs!17689 m!328969))

(assert (=> b!212959 d!72135))

(declare-fun d!72137 () Bool)

(declare-fun lt!336935 () tuple2!18266)

(assert (=> d!72137 (= lt!336935 (readNBitsLSBFirstsLoop!0 (_1!9778 lt!335741) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!335757))))

(assert (=> d!72137 (= (readNBitsLSBFirstsLoopPure!0 (_1!9778 lt!335741) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!335757) (tuple2!18245 (_2!9788 lt!336935) (_1!9788 lt!336935)))))

(declare-fun bs!17690 () Bool)

(assert (= bs!17690 d!72137))

(declare-fun m!328971 () Bool)

(assert (=> bs!17690 m!328971))

(assert (=> b!212959 d!72137))

(declare-fun d!72139 () Bool)

(assert (=> d!72139 (validate_offset_bits!1 ((_ sign_extend 32) (size!4630 (buf!5159 (_2!9776 lt!335733)))) ((_ sign_extend 32) (currentByte!9725 thiss!1204)) ((_ sign_extend 32) (currentBit!9720 thiss!1204)) lt!335751)))

(declare-fun lt!336936 () Unit!15166)

(assert (=> d!72139 (= lt!336936 (choose!9 thiss!1204 (buf!5159 (_2!9776 lt!335733)) lt!335751 (BitStream!8369 (buf!5159 (_2!9776 lt!335733)) (currentByte!9725 thiss!1204) (currentBit!9720 thiss!1204))))))

(assert (=> d!72139 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5159 (_2!9776 lt!335733)) lt!335751) lt!336936)))

(declare-fun bs!17691 () Bool)

(assert (= bs!17691 d!72139))

(assert (=> bs!17691 m!328171))

(declare-fun m!328973 () Bool)

(assert (=> bs!17691 m!328973))

(assert (=> b!212959 d!72139))

(declare-fun lt!336937 () tuple2!18266)

(declare-fun d!72141 () Bool)

(assert (=> d!72141 (= lt!336937 (readNBitsLSBFirstsLoop!0 (_1!9778 lt!335738) nBits!348 i!590 lt!335734))))

(assert (=> d!72141 (= (readNBitsLSBFirstsLoopPure!0 (_1!9778 lt!335738) nBits!348 i!590 lt!335734) (tuple2!18245 (_2!9788 lt!336937) (_1!9788 lt!336937)))))

(declare-fun bs!17692 () Bool)

(assert (= bs!17692 d!72141))

(declare-fun m!328975 () Bool)

(assert (=> bs!17692 m!328975))

(assert (=> b!212959 d!72141))

(declare-fun d!72143 () Bool)

(declare-fun lt!336938 () tuple2!18272)

(assert (=> d!72143 (= lt!336938 (readBit!0 (BitStream!8369 (buf!5159 (_2!9776 lt!335733)) (currentByte!9725 thiss!1204) (currentBit!9720 thiss!1204))))))

(assert (=> d!72143 (= (readBitPure!0 (BitStream!8369 (buf!5159 (_2!9776 lt!335733)) (currentByte!9725 thiss!1204) (currentBit!9720 thiss!1204))) (tuple2!18249 (_2!9791 lt!336938) (_1!9791 lt!336938)))))

(declare-fun bs!17693 () Bool)

(assert (= bs!17693 d!72143))

(declare-fun m!328977 () Bool)

(assert (=> bs!17693 m!328977))

(assert (=> b!212959 d!72143))

(declare-fun b!213461 () Bool)

(declare-fun e!145395 () Unit!15166)

(declare-fun Unit!15208 () Unit!15166)

(assert (=> b!213461 (= e!145395 Unit!15208)))

(declare-fun b!213462 () Bool)

(declare-fun lt!336953 () Unit!15166)

(assert (=> b!213462 (= e!145395 lt!336953)))

(declare-fun lt!336944 () (_ BitVec 64))

(assert (=> b!213462 (= lt!336944 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!336958 () (_ BitVec 64))

(assert (=> b!213462 (= lt!336958 (bitIndex!0 (size!4630 (buf!5159 thiss!1204)) (currentByte!9725 thiss!1204) (currentBit!9720 thiss!1204)))))

(assert (=> b!213462 (= lt!336953 (arrayBitRangesEqSymmetric!0 (buf!5159 thiss!1204) (buf!5159 (_2!9776 lt!335733)) lt!336944 lt!336958))))

(assert (=> b!213462 (arrayBitRangesEq!0 (buf!5159 (_2!9776 lt!335733)) (buf!5159 thiss!1204) lt!336944 lt!336958)))

(declare-fun b!213463 () Bool)

(declare-fun res!179387 () Bool)

(declare-fun e!145396 () Bool)

(assert (=> b!213463 (=> (not res!179387) (not e!145396))))

(declare-fun lt!336943 () tuple2!18246)

(assert (=> b!213463 (= res!179387 (isPrefixOf!0 (_1!9778 lt!336943) thiss!1204))))

(declare-fun d!72145 () Bool)

(assert (=> d!72145 e!145396))

(declare-fun res!179386 () Bool)

(assert (=> d!72145 (=> (not res!179386) (not e!145396))))

(assert (=> d!72145 (= res!179386 (isPrefixOf!0 (_1!9778 lt!336943) (_2!9778 lt!336943)))))

(declare-fun lt!336940 () BitStream!8368)

(assert (=> d!72145 (= lt!336943 (tuple2!18247 lt!336940 (_2!9776 lt!335733)))))

(declare-fun lt!336939 () Unit!15166)

(declare-fun lt!336949 () Unit!15166)

(assert (=> d!72145 (= lt!336939 lt!336949)))

(assert (=> d!72145 (isPrefixOf!0 lt!336940 (_2!9776 lt!335733))))

(assert (=> d!72145 (= lt!336949 (lemmaIsPrefixTransitive!0 lt!336940 (_2!9776 lt!335733) (_2!9776 lt!335733)))))

(declare-fun lt!336942 () Unit!15166)

(declare-fun lt!336945 () Unit!15166)

(assert (=> d!72145 (= lt!336942 lt!336945)))

(assert (=> d!72145 (isPrefixOf!0 lt!336940 (_2!9776 lt!335733))))

(assert (=> d!72145 (= lt!336945 (lemmaIsPrefixTransitive!0 lt!336940 thiss!1204 (_2!9776 lt!335733)))))

(declare-fun lt!336956 () Unit!15166)

(assert (=> d!72145 (= lt!336956 e!145395)))

(declare-fun c!10476 () Bool)

(assert (=> d!72145 (= c!10476 (not (= (size!4630 (buf!5159 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!336946 () Unit!15166)

(declare-fun lt!336952 () Unit!15166)

(assert (=> d!72145 (= lt!336946 lt!336952)))

(assert (=> d!72145 (isPrefixOf!0 (_2!9776 lt!335733) (_2!9776 lt!335733))))

(assert (=> d!72145 (= lt!336952 (lemmaIsPrefixRefl!0 (_2!9776 lt!335733)))))

(declare-fun lt!336955 () Unit!15166)

(declare-fun lt!336948 () Unit!15166)

(assert (=> d!72145 (= lt!336955 lt!336948)))

(assert (=> d!72145 (= lt!336948 (lemmaIsPrefixRefl!0 (_2!9776 lt!335733)))))

(declare-fun lt!336957 () Unit!15166)

(declare-fun lt!336950 () Unit!15166)

(assert (=> d!72145 (= lt!336957 lt!336950)))

(assert (=> d!72145 (isPrefixOf!0 lt!336940 lt!336940)))

(assert (=> d!72145 (= lt!336950 (lemmaIsPrefixRefl!0 lt!336940))))

(declare-fun lt!336951 () Unit!15166)

(declare-fun lt!336954 () Unit!15166)

(assert (=> d!72145 (= lt!336951 lt!336954)))

(assert (=> d!72145 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!72145 (= lt!336954 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!72145 (= lt!336940 (BitStream!8369 (buf!5159 (_2!9776 lt!335733)) (currentByte!9725 thiss!1204) (currentBit!9720 thiss!1204)))))

(assert (=> d!72145 (isPrefixOf!0 thiss!1204 (_2!9776 lt!335733))))

(assert (=> d!72145 (= (reader!0 thiss!1204 (_2!9776 lt!335733)) lt!336943)))

(declare-fun b!213464 () Bool)

(declare-fun lt!336947 () (_ BitVec 64))

(declare-fun lt!336941 () (_ BitVec 64))

(assert (=> b!213464 (= e!145396 (= (_1!9778 lt!336943) (withMovedBitIndex!0 (_2!9778 lt!336943) (bvsub lt!336941 lt!336947))))))

(assert (=> b!213464 (or (= (bvand lt!336941 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!336947 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!336941 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!336941 lt!336947) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213464 (= lt!336947 (bitIndex!0 (size!4630 (buf!5159 (_2!9776 lt!335733))) (currentByte!9725 (_2!9776 lt!335733)) (currentBit!9720 (_2!9776 lt!335733))))))

(assert (=> b!213464 (= lt!336941 (bitIndex!0 (size!4630 (buf!5159 thiss!1204)) (currentByte!9725 thiss!1204) (currentBit!9720 thiss!1204)))))

(declare-fun b!213465 () Bool)

(declare-fun res!179388 () Bool)

(assert (=> b!213465 (=> (not res!179388) (not e!145396))))

(assert (=> b!213465 (= res!179388 (isPrefixOf!0 (_2!9778 lt!336943) (_2!9776 lt!335733)))))

(assert (= (and d!72145 c!10476) b!213462))

(assert (= (and d!72145 (not c!10476)) b!213461))

(assert (= (and d!72145 res!179386) b!213463))

(assert (= (and b!213463 res!179387) b!213465))

(assert (= (and b!213465 res!179388) b!213464))

(assert (=> b!213462 m!328135))

(declare-fun m!328979 () Bool)

(assert (=> b!213462 m!328979))

(declare-fun m!328981 () Bool)

(assert (=> b!213462 m!328981))

(declare-fun m!328983 () Bool)

(assert (=> b!213465 m!328983))

(declare-fun m!328985 () Bool)

(assert (=> b!213463 m!328985))

(declare-fun m!328987 () Bool)

(assert (=> b!213464 m!328987))

(assert (=> b!213464 m!328125))

(assert (=> b!213464 m!328135))

(declare-fun m!328989 () Bool)

(assert (=> d!72145 m!328989))

(declare-fun m!328991 () Bool)

(assert (=> d!72145 m!328991))

(declare-fun m!328993 () Bool)

(assert (=> d!72145 m!328993))

(declare-fun m!328995 () Bool)

(assert (=> d!72145 m!328995))

(assert (=> d!72145 m!328959))

(assert (=> d!72145 m!328127))

(declare-fun m!328997 () Bool)

(assert (=> d!72145 m!328997))

(declare-fun m!328999 () Bool)

(assert (=> d!72145 m!328999))

(assert (=> d!72145 m!328963))

(declare-fun m!329001 () Bool)

(assert (=> d!72145 m!329001))

(declare-fun m!329003 () Bool)

(assert (=> d!72145 m!329003))

(assert (=> b!212959 d!72145))

(declare-fun d!72147 () Bool)

(assert (=> d!72147 (= (invariant!0 (currentBit!9720 thiss!1204) (currentByte!9725 thiss!1204) (size!4630 (buf!5159 (_2!9776 lt!335754)))) (and (bvsge (currentBit!9720 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9720 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9725 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9725 thiss!1204) (size!4630 (buf!5159 (_2!9776 lt!335754)))) (and (= (currentBit!9720 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9725 thiss!1204) (size!4630 (buf!5159 (_2!9776 lt!335754))))))))))

(assert (=> b!212959 d!72147))

(declare-fun d!72149 () Bool)

(declare-fun lt!336959 () tuple2!18272)

(assert (=> d!72149 (= lt!336959 (readBit!0 lt!335736))))

(assert (=> d!72149 (= (readBitPure!0 lt!335736) (tuple2!18249 (_2!9791 lt!336959) (_1!9791 lt!336959)))))

(declare-fun bs!17694 () Bool)

(assert (= bs!17694 d!72149))

(declare-fun m!329005 () Bool)

(assert (=> bs!17694 m!329005))

(assert (=> b!212959 d!72149))

(declare-fun d!72151 () Bool)

(declare-fun e!145397 () Bool)

(assert (=> d!72151 e!145397))

(declare-fun res!179389 () Bool)

(assert (=> d!72151 (=> (not res!179389) (not e!145397))))

(declare-fun lt!336962 () (_ BitVec 64))

(declare-fun lt!336963 () (_ BitVec 64))

(declare-fun lt!336961 () (_ BitVec 64))

(assert (=> d!72151 (= res!179389 (= lt!336961 (bvsub lt!336962 lt!336963)))))

(assert (=> d!72151 (or (= (bvand lt!336962 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!336963 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!336962 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!336962 lt!336963) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72151 (= lt!336963 (remainingBits!0 ((_ sign_extend 32) (size!4630 (buf!5159 (_1!9779 lt!335746)))) ((_ sign_extend 32) (currentByte!9725 (_1!9779 lt!335746))) ((_ sign_extend 32) (currentBit!9720 (_1!9779 lt!335746)))))))

(declare-fun lt!336965 () (_ BitVec 64))

(declare-fun lt!336960 () (_ BitVec 64))

(assert (=> d!72151 (= lt!336962 (bvmul lt!336965 lt!336960))))

(assert (=> d!72151 (or (= lt!336965 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!336960 (bvsdiv (bvmul lt!336965 lt!336960) lt!336965)))))

(assert (=> d!72151 (= lt!336960 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72151 (= lt!336965 ((_ sign_extend 32) (size!4630 (buf!5159 (_1!9779 lt!335746)))))))

(assert (=> d!72151 (= lt!336961 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9725 (_1!9779 lt!335746))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9720 (_1!9779 lt!335746)))))))

(assert (=> d!72151 (invariant!0 (currentBit!9720 (_1!9779 lt!335746)) (currentByte!9725 (_1!9779 lt!335746)) (size!4630 (buf!5159 (_1!9779 lt!335746))))))

(assert (=> d!72151 (= (bitIndex!0 (size!4630 (buf!5159 (_1!9779 lt!335746))) (currentByte!9725 (_1!9779 lt!335746)) (currentBit!9720 (_1!9779 lt!335746))) lt!336961)))

(declare-fun b!213466 () Bool)

(declare-fun res!179390 () Bool)

(assert (=> b!213466 (=> (not res!179390) (not e!145397))))

(assert (=> b!213466 (= res!179390 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!336961))))

(declare-fun b!213467 () Bool)

(declare-fun lt!336964 () (_ BitVec 64))

(assert (=> b!213467 (= e!145397 (bvsle lt!336961 (bvmul lt!336964 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213467 (or (= lt!336964 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!336964 #b0000000000000000000000000000000000000000000000000000000000001000) lt!336964)))))

(assert (=> b!213467 (= lt!336964 ((_ sign_extend 32) (size!4630 (buf!5159 (_1!9779 lt!335746)))))))

(assert (= (and d!72151 res!179389) b!213466))

(assert (= (and b!213466 res!179390) b!213467))

(declare-fun m!329007 () Bool)

(assert (=> d!72151 m!329007))

(declare-fun m!329009 () Bool)

(assert (=> d!72151 m!329009))

(assert (=> b!212959 d!72151))

(declare-fun d!72153 () Bool)

(declare-fun e!145400 () Bool)

(assert (=> d!72153 e!145400))

(declare-fun res!179394 () Bool)

(assert (=> d!72153 (=> (not res!179394) (not e!145400))))

(declare-fun lt!336987 () (_ BitVec 64))

(declare-fun lt!336989 () (_ BitVec 64))

(declare-fun lt!336988 () (_ BitVec 64))

(assert (=> d!72153 (= res!179394 (= lt!336987 (bvsub lt!336988 lt!336989)))))

(assert (=> d!72153 (or (= (bvand lt!336988 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!336989 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!336988 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!336988 lt!336989) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72153 (= lt!336989 (remainingBits!0 ((_ sign_extend 32) (size!4630 (buf!5159 (_1!9779 lt!335749)))) ((_ sign_extend 32) (currentByte!9725 (_1!9779 lt!335749))) ((_ sign_extend 32) (currentBit!9720 (_1!9779 lt!335749)))))))

(declare-fun lt!336991 () (_ BitVec 64))

(declare-fun lt!336986 () (_ BitVec 64))

(assert (=> d!72153 (= lt!336988 (bvmul lt!336991 lt!336986))))

(assert (=> d!72153 (or (= lt!336991 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!336986 (bvsdiv (bvmul lt!336991 lt!336986) lt!336991)))))

(assert (=> d!72153 (= lt!336986 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!72153 (= lt!336991 ((_ sign_extend 32) (size!4630 (buf!5159 (_1!9779 lt!335749)))))))

(assert (=> d!72153 (= lt!336987 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9725 (_1!9779 lt!335749))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9720 (_1!9779 lt!335749)))))))

(assert (=> d!72153 (invariant!0 (currentBit!9720 (_1!9779 lt!335749)) (currentByte!9725 (_1!9779 lt!335749)) (size!4630 (buf!5159 (_1!9779 lt!335749))))))

(assert (=> d!72153 (= (bitIndex!0 (size!4630 (buf!5159 (_1!9779 lt!335749))) (currentByte!9725 (_1!9779 lt!335749)) (currentBit!9720 (_1!9779 lt!335749))) lt!336987)))

(declare-fun b!213473 () Bool)

(declare-fun res!179395 () Bool)

(assert (=> b!213473 (=> (not res!179395) (not e!145400))))

(assert (=> b!213473 (= res!179395 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!336987))))

(declare-fun b!213474 () Bool)

(declare-fun lt!336990 () (_ BitVec 64))

(assert (=> b!213474 (= e!145400 (bvsle lt!336987 (bvmul lt!336990 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!213474 (or (= lt!336990 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!336990 #b0000000000000000000000000000000000000000000000000000000000001000) lt!336990)))))

(assert (=> b!213474 (= lt!336990 ((_ sign_extend 32) (size!4630 (buf!5159 (_1!9779 lt!335749)))))))

(assert (= (and d!72153 res!179394) b!213473))

(assert (= (and b!213473 res!179395) b!213474))

(declare-fun m!329011 () Bool)

(assert (=> d!72153 m!329011))

(declare-fun m!329013 () Bool)

(assert (=> d!72153 m!329013))

(assert (=> b!212959 d!72153))

(declare-fun d!72155 () Bool)

(assert (=> d!72155 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4630 (buf!5159 (_2!9776 lt!335733)))) ((_ sign_extend 32) (currentByte!9725 (_2!9776 lt!335754))) ((_ sign_extend 32) (currentBit!9720 (_2!9776 lt!335754))) lt!335735) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4630 (buf!5159 (_2!9776 lt!335733)))) ((_ sign_extend 32) (currentByte!9725 (_2!9776 lt!335754))) ((_ sign_extend 32) (currentBit!9720 (_2!9776 lt!335754)))) lt!335735))))

(declare-fun bs!17695 () Bool)

(assert (= bs!17695 d!72155))

(declare-fun m!329027 () Bool)

(assert (=> bs!17695 m!329027))

(assert (=> b!212959 d!72155))

(declare-fun d!72157 () Bool)

(assert (=> d!72157 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4630 (buf!5159 (_2!9776 lt!335733)))) ((_ sign_extend 32) (currentByte!9725 thiss!1204)) ((_ sign_extend 32) (currentBit!9720 thiss!1204)) lt!335751) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4630 (buf!5159 (_2!9776 lt!335733)))) ((_ sign_extend 32) (currentByte!9725 thiss!1204)) ((_ sign_extend 32) (currentBit!9720 thiss!1204))) lt!335751))))

(declare-fun bs!17696 () Bool)

(assert (= bs!17696 d!72157))

(declare-fun m!329045 () Bool)

(assert (=> bs!17696 m!329045))

(assert (=> b!212959 d!72157))

(declare-fun d!72161 () Bool)

(assert (=> d!72161 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4630 (buf!5159 thiss!1204))) ((_ sign_extend 32) (currentByte!9725 thiss!1204)) ((_ sign_extend 32) (currentBit!9720 thiss!1204)) lt!335751) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4630 (buf!5159 thiss!1204))) ((_ sign_extend 32) (currentByte!9725 thiss!1204)) ((_ sign_extend 32) (currentBit!9720 thiss!1204))) lt!335751))))

(declare-fun bs!17697 () Bool)

(assert (= bs!17697 d!72161))

(assert (=> bs!17697 m!328547))

(assert (=> b!212970 d!72161))

(push 1)

(assert (not bm!3346))

(assert (not d!72139))

(assert (not d!72039))

(assert (not d!72037))

(assert (not b!213358))

(assert (not b!213359))

(assert (not d!72137))

(assert (not b!213464))

(assert (not b!213185))

(assert (not d!72043))

(assert (not b!213349))

(assert (not b!213346))

(assert (not d!72051))

(assert (not b!213357))

(assert (not d!72153))

(assert (not b!213355))

(assert (not d!72155))

(assert (not d!72099))

(assert (not d!72041))

(assert (not b!213232))

(assert (not d!72135))

(assert (not d!72067))

(assert (not b!213235))

(assert (not d!72145))

(assert (not d!72089))

(assert (not d!72069))

(assert (not d!72081))

(assert (not d!72083))

(assert (not d!72063))

(assert (not b!213187))

(assert (not d!72055))

(assert (not d!72045))

(assert (not d!72079))

(assert (not b!213237))

(assert (not b!213462))

(assert (not b!213448))

(assert (not b!213465))

(assert (not d!72119))

(assert (not b!213205))

(assert (not b!213231))

(assert (not b!213350))

(assert (not b!213463))

(assert (not d!72151))

(assert (not d!72141))

(assert (not b!213450))

(assert (not d!72047))

(assert (not b!213449))

(assert (not d!72161))

(assert (not b!213229))

(assert (not b!213352))

(assert (not d!72035))

(assert (not d!72143))

(assert (not b!213207))

(assert (not b!213230))

(assert (not d!72149))

(assert (not b!213447))

(assert (not d!72123))

(assert (not d!72157))

(assert (not d!72049))

(assert (not b!213354))

(assert (not b!213395))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

