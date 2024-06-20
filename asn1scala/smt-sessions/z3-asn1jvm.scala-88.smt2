; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2014 () Bool)

(assert start!2014)

(declare-fun res!9805 () Bool)

(declare-fun e!5923 () Bool)

(assert (=> start!2014 (=> (not res!9805) (not e!5923))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!581 0))(
  ( (array!582 (arr!662 (Array (_ BitVec 32) (_ BitVec 8))) (size!251 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!581)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!2014 (= res!9805 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!251 srcBuffer!6))))))))

(assert (=> start!2014 e!5923))

(assert (=> start!2014 true))

(declare-fun array_inv!243 (array!581) Bool)

(assert (=> start!2014 (array_inv!243 srcBuffer!6)))

(declare-datatypes ((BitStream!474 0))(
  ( (BitStream!475 (buf!590 array!581) (currentByte!1635 (_ BitVec 32)) (currentBit!1630 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!474)

(declare-fun e!5920 () Bool)

(declare-fun inv!12 (BitStream!474) Bool)

(assert (=> start!2014 (and (inv!12 thiss!1486) e!5920)))

(declare-fun e!5919 () Bool)

(declare-datatypes ((List!145 0))(
  ( (Nil!142) (Cons!141 (h!260 Bool) (t!895 List!145)) )
))
(declare-fun lt!14509 () List!145)

(declare-fun b!9587 () Bool)

(declare-datatypes ((Unit!819 0))(
  ( (Unit!820) )
))
(declare-datatypes ((tuple2!1198 0))(
  ( (tuple2!1199 (_1!636 Unit!819) (_2!636 BitStream!474)) )
))
(declare-fun lt!14508 () tuple2!1198)

(declare-fun byteArrayBitContentToList!0 (BitStream!474 array!581 (_ BitVec 64) (_ BitVec 64)) List!145)

(assert (=> b!9587 (= e!5919 (= lt!14509 (byteArrayBitContentToList!0 (_2!636 lt!14508) srcBuffer!6 from!367 nBits!460)))))

(declare-fun b!9588 () Bool)

(declare-fun e!5921 () Bool)

(assert (=> b!9588 (= e!5923 e!5921)))

(declare-fun res!9806 () Bool)

(assert (=> b!9588 (=> (not res!9806) (not e!5921))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!9588 (= res!9806 (invariant!0 (currentBit!1630 (_2!636 lt!14508)) (currentByte!1635 (_2!636 lt!14508)) (size!251 (buf!590 (_2!636 lt!14508)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!474 array!581 (_ BitVec 64) (_ BitVec 64)) tuple2!1198)

(assert (=> b!9588 (= lt!14508 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!9589 () Bool)

(declare-fun res!9810 () Bool)

(assert (=> b!9589 (=> (not res!9810) (not e!5921))))

(assert (=> b!9589 (= res!9810 (= (size!251 (buf!590 thiss!1486)) (size!251 (buf!590 (_2!636 lt!14508)))))))

(declare-fun b!9590 () Bool)

(assert (=> b!9590 (= e!5921 (not e!5919))))

(declare-fun res!9808 () Bool)

(assert (=> b!9590 (=> res!9808 e!5919)))

(declare-datatypes ((tuple2!1200 0))(
  ( (tuple2!1201 (_1!637 array!581) (_2!637 BitStream!474)) )
))
(declare-fun lt!14510 () tuple2!1200)

(assert (=> b!9590 (= res!9808 (not (= (byteArrayBitContentToList!0 (_2!636 lt!14508) (_1!637 lt!14510) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!14509)))))

(declare-datatypes ((tuple2!1202 0))(
  ( (tuple2!1203 (_1!638 BitStream!474) (_2!638 BitStream!474)) )
))
(declare-fun lt!14506 () tuple2!1202)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!474 BitStream!474 (_ BitVec 64)) List!145)

(assert (=> b!9590 (= lt!14509 (bitStreamReadBitsIntoList!0 (_2!636 lt!14508) (_1!638 lt!14506) nBits!460))))

(declare-fun readBits!0 (BitStream!474 (_ BitVec 64)) tuple2!1200)

(assert (=> b!9590 (= lt!14510 (readBits!0 (_1!638 lt!14506) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!9590 (validate_offset_bits!1 ((_ sign_extend 32) (size!251 (buf!590 (_2!636 lt!14508)))) ((_ sign_extend 32) (currentByte!1635 thiss!1486)) ((_ sign_extend 32) (currentBit!1630 thiss!1486)) nBits!460)))

(declare-fun lt!14507 () Unit!819)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!474 array!581 (_ BitVec 64)) Unit!819)

(assert (=> b!9590 (= lt!14507 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!590 (_2!636 lt!14508)) nBits!460))))

(declare-fun reader!0 (BitStream!474 BitStream!474) tuple2!1202)

(assert (=> b!9590 (= lt!14506 (reader!0 thiss!1486 (_2!636 lt!14508)))))

(declare-fun b!9591 () Bool)

(declare-fun res!9807 () Bool)

(assert (=> b!9591 (=> (not res!9807) (not e!5921))))

(declare-fun isPrefixOf!0 (BitStream!474 BitStream!474) Bool)

(assert (=> b!9591 (= res!9807 (isPrefixOf!0 thiss!1486 (_2!636 lt!14508)))))

(declare-fun b!9592 () Bool)

(declare-fun res!9809 () Bool)

(assert (=> b!9592 (=> (not res!9809) (not e!5923))))

(assert (=> b!9592 (= res!9809 (validate_offset_bits!1 ((_ sign_extend 32) (size!251 (buf!590 thiss!1486))) ((_ sign_extend 32) (currentByte!1635 thiss!1486)) ((_ sign_extend 32) (currentBit!1630 thiss!1486)) nBits!460))))

(declare-fun b!9593 () Bool)

(declare-fun res!9811 () Bool)

(assert (=> b!9593 (=> (not res!9811) (not e!5921))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!9593 (= res!9811 (= (bitIndex!0 (size!251 (buf!590 (_2!636 lt!14508))) (currentByte!1635 (_2!636 lt!14508)) (currentBit!1630 (_2!636 lt!14508))) (bvadd (bitIndex!0 (size!251 (buf!590 thiss!1486)) (currentByte!1635 thiss!1486) (currentBit!1630 thiss!1486)) nBits!460)))))

(declare-fun b!9594 () Bool)

(assert (=> b!9594 (= e!5920 (array_inv!243 (buf!590 thiss!1486)))))

(assert (= (and start!2014 res!9805) b!9592))

(assert (= (and b!9592 res!9809) b!9588))

(assert (= (and b!9588 res!9806) b!9589))

(assert (= (and b!9589 res!9810) b!9593))

(assert (= (and b!9593 res!9811) b!9591))

(assert (= (and b!9591 res!9807) b!9590))

(assert (= (and b!9590 (not res!9808)) b!9587))

(assert (= start!2014 b!9594))

(declare-fun m!13867 () Bool)

(assert (=> b!9587 m!13867))

(declare-fun m!13869 () Bool)

(assert (=> b!9593 m!13869))

(declare-fun m!13871 () Bool)

(assert (=> b!9593 m!13871))

(declare-fun m!13873 () Bool)

(assert (=> b!9594 m!13873))

(declare-fun m!13875 () Bool)

(assert (=> b!9588 m!13875))

(declare-fun m!13877 () Bool)

(assert (=> b!9588 m!13877))

(declare-fun m!13879 () Bool)

(assert (=> b!9591 m!13879))

(declare-fun m!13881 () Bool)

(assert (=> b!9592 m!13881))

(declare-fun m!13883 () Bool)

(assert (=> b!9590 m!13883))

(declare-fun m!13885 () Bool)

(assert (=> b!9590 m!13885))

(declare-fun m!13887 () Bool)

(assert (=> b!9590 m!13887))

(declare-fun m!13889 () Bool)

(assert (=> b!9590 m!13889))

(declare-fun m!13891 () Bool)

(assert (=> b!9590 m!13891))

(declare-fun m!13893 () Bool)

(assert (=> b!9590 m!13893))

(declare-fun m!13895 () Bool)

(assert (=> start!2014 m!13895))

(declare-fun m!13897 () Bool)

(assert (=> start!2014 m!13897))

(check-sat (not b!9592) (not b!9594) (not b!9591) (not b!9588) (not b!9593) (not b!9590) (not start!2014) (not b!9587))
(check-sat)
(get-model)

(declare-fun d!3078 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!3078 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!251 (buf!590 thiss!1486))) ((_ sign_extend 32) (currentByte!1635 thiss!1486)) ((_ sign_extend 32) (currentBit!1630 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!251 (buf!590 thiss!1486))) ((_ sign_extend 32) (currentByte!1635 thiss!1486)) ((_ sign_extend 32) (currentBit!1630 thiss!1486))) nBits!460))))

(declare-fun bs!932 () Bool)

(assert (= bs!932 d!3078))

(declare-fun m!13931 () Bool)

(assert (=> bs!932 m!13931))

(assert (=> b!9592 d!3078))

(declare-fun d!3080 () Bool)

(declare-fun res!9840 () Bool)

(declare-fun e!5948 () Bool)

(assert (=> d!3080 (=> (not res!9840) (not e!5948))))

(assert (=> d!3080 (= res!9840 (= (size!251 (buf!590 thiss!1486)) (size!251 (buf!590 (_2!636 lt!14508)))))))

(assert (=> d!3080 (= (isPrefixOf!0 thiss!1486 (_2!636 lt!14508)) e!5948)))

(declare-fun b!9625 () Bool)

(declare-fun res!9839 () Bool)

(assert (=> b!9625 (=> (not res!9839) (not e!5948))))

(assert (=> b!9625 (= res!9839 (bvsle (bitIndex!0 (size!251 (buf!590 thiss!1486)) (currentByte!1635 thiss!1486) (currentBit!1630 thiss!1486)) (bitIndex!0 (size!251 (buf!590 (_2!636 lt!14508))) (currentByte!1635 (_2!636 lt!14508)) (currentBit!1630 (_2!636 lt!14508)))))))

(declare-fun b!9626 () Bool)

(declare-fun e!5947 () Bool)

(assert (=> b!9626 (= e!5948 e!5947)))

(declare-fun res!9841 () Bool)

(assert (=> b!9626 (=> res!9841 e!5947)))

(assert (=> b!9626 (= res!9841 (= (size!251 (buf!590 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!9627 () Bool)

(declare-fun arrayBitRangesEq!0 (array!581 array!581 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!9627 (= e!5947 (arrayBitRangesEq!0 (buf!590 thiss!1486) (buf!590 (_2!636 lt!14508)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!251 (buf!590 thiss!1486)) (currentByte!1635 thiss!1486) (currentBit!1630 thiss!1486))))))

(assert (= (and d!3080 res!9840) b!9625))

(assert (= (and b!9625 res!9839) b!9626))

(assert (= (and b!9626 (not res!9841)) b!9627))

(assert (=> b!9625 m!13871))

(assert (=> b!9625 m!13869))

(assert (=> b!9627 m!13871))

(assert (=> b!9627 m!13871))

(declare-fun m!13933 () Bool)

(assert (=> b!9627 m!13933))

(assert (=> b!9591 d!3080))

(declare-fun d!3086 () Bool)

(assert (=> d!3086 (= (array_inv!243 srcBuffer!6) (bvsge (size!251 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!2014 d!3086))

(declare-fun d!3088 () Bool)

(assert (=> d!3088 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1630 thiss!1486) (currentByte!1635 thiss!1486) (size!251 (buf!590 thiss!1486))))))

(declare-fun bs!933 () Bool)

(assert (= bs!933 d!3088))

(declare-fun m!13935 () Bool)

(assert (=> bs!933 m!13935))

(assert (=> start!2014 d!3088))

(declare-fun d!3090 () Bool)

(declare-fun e!5973 () Bool)

(assert (=> d!3090 e!5973))

(declare-fun res!9873 () Bool)

(assert (=> d!3090 (=> (not res!9873) (not e!5973))))

(declare-fun lt!14627 () tuple2!1202)

(assert (=> d!3090 (= res!9873 (isPrefixOf!0 (_1!638 lt!14627) (_2!638 lt!14627)))))

(declare-fun lt!14625 () BitStream!474)

(assert (=> d!3090 (= lt!14627 (tuple2!1203 lt!14625 (_2!636 lt!14508)))))

(declare-fun lt!14623 () Unit!819)

(declare-fun lt!14618 () Unit!819)

(assert (=> d!3090 (= lt!14623 lt!14618)))

(assert (=> d!3090 (isPrefixOf!0 lt!14625 (_2!636 lt!14508))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!474 BitStream!474 BitStream!474) Unit!819)

(assert (=> d!3090 (= lt!14618 (lemmaIsPrefixTransitive!0 lt!14625 (_2!636 lt!14508) (_2!636 lt!14508)))))

(declare-fun lt!14630 () Unit!819)

(declare-fun lt!14624 () Unit!819)

(assert (=> d!3090 (= lt!14630 lt!14624)))

(assert (=> d!3090 (isPrefixOf!0 lt!14625 (_2!636 lt!14508))))

(assert (=> d!3090 (= lt!14624 (lemmaIsPrefixTransitive!0 lt!14625 thiss!1486 (_2!636 lt!14508)))))

(declare-fun lt!14628 () Unit!819)

(declare-fun e!5974 () Unit!819)

(assert (=> d!3090 (= lt!14628 e!5974)))

(declare-fun c!623 () Bool)

(assert (=> d!3090 (= c!623 (not (= (size!251 (buf!590 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!14632 () Unit!819)

(declare-fun lt!14634 () Unit!819)

(assert (=> d!3090 (= lt!14632 lt!14634)))

(assert (=> d!3090 (isPrefixOf!0 (_2!636 lt!14508) (_2!636 lt!14508))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!474) Unit!819)

(assert (=> d!3090 (= lt!14634 (lemmaIsPrefixRefl!0 (_2!636 lt!14508)))))

(declare-fun lt!14620 () Unit!819)

(declare-fun lt!14631 () Unit!819)

(assert (=> d!3090 (= lt!14620 lt!14631)))

(assert (=> d!3090 (= lt!14631 (lemmaIsPrefixRefl!0 (_2!636 lt!14508)))))

(declare-fun lt!14617 () Unit!819)

(declare-fun lt!14629 () Unit!819)

(assert (=> d!3090 (= lt!14617 lt!14629)))

(assert (=> d!3090 (isPrefixOf!0 lt!14625 lt!14625)))

(assert (=> d!3090 (= lt!14629 (lemmaIsPrefixRefl!0 lt!14625))))

(declare-fun lt!14635 () Unit!819)

(declare-fun lt!14626 () Unit!819)

(assert (=> d!3090 (= lt!14635 lt!14626)))

(assert (=> d!3090 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!3090 (= lt!14626 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!3090 (= lt!14625 (BitStream!475 (buf!590 (_2!636 lt!14508)) (currentByte!1635 thiss!1486) (currentBit!1630 thiss!1486)))))

(assert (=> d!3090 (isPrefixOf!0 thiss!1486 (_2!636 lt!14508))))

(assert (=> d!3090 (= (reader!0 thiss!1486 (_2!636 lt!14508)) lt!14627)))

(declare-fun b!9675 () Bool)

(declare-fun res!9875 () Bool)

(assert (=> b!9675 (=> (not res!9875) (not e!5973))))

(assert (=> b!9675 (= res!9875 (isPrefixOf!0 (_1!638 lt!14627) thiss!1486))))

(declare-fun b!9676 () Bool)

(declare-fun lt!14636 () (_ BitVec 64))

(declare-fun lt!14621 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!474 (_ BitVec 64)) BitStream!474)

(assert (=> b!9676 (= e!5973 (= (_1!638 lt!14627) (withMovedBitIndex!0 (_2!638 lt!14627) (bvsub lt!14636 lt!14621))))))

(assert (=> b!9676 (or (= (bvand lt!14636 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!14621 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!14636 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!14636 lt!14621) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9676 (= lt!14621 (bitIndex!0 (size!251 (buf!590 (_2!636 lt!14508))) (currentByte!1635 (_2!636 lt!14508)) (currentBit!1630 (_2!636 lt!14508))))))

(assert (=> b!9676 (= lt!14636 (bitIndex!0 (size!251 (buf!590 thiss!1486)) (currentByte!1635 thiss!1486) (currentBit!1630 thiss!1486)))))

(declare-fun b!9677 () Bool)

(declare-fun Unit!828 () Unit!819)

(assert (=> b!9677 (= e!5974 Unit!828)))

(declare-fun b!9678 () Bool)

(declare-fun res!9874 () Bool)

(assert (=> b!9678 (=> (not res!9874) (not e!5973))))

(assert (=> b!9678 (= res!9874 (isPrefixOf!0 (_2!638 lt!14627) (_2!636 lt!14508)))))

(declare-fun b!9679 () Bool)

(declare-fun lt!14622 () Unit!819)

(assert (=> b!9679 (= e!5974 lt!14622)))

(declare-fun lt!14619 () (_ BitVec 64))

(assert (=> b!9679 (= lt!14619 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!14633 () (_ BitVec 64))

(assert (=> b!9679 (= lt!14633 (bitIndex!0 (size!251 (buf!590 thiss!1486)) (currentByte!1635 thiss!1486) (currentBit!1630 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!581 array!581 (_ BitVec 64) (_ BitVec 64)) Unit!819)

(assert (=> b!9679 (= lt!14622 (arrayBitRangesEqSymmetric!0 (buf!590 thiss!1486) (buf!590 (_2!636 lt!14508)) lt!14619 lt!14633))))

(assert (=> b!9679 (arrayBitRangesEq!0 (buf!590 (_2!636 lt!14508)) (buf!590 thiss!1486) lt!14619 lt!14633)))

(assert (= (and d!3090 c!623) b!9679))

(assert (= (and d!3090 (not c!623)) b!9677))

(assert (= (and d!3090 res!9873) b!9675))

(assert (= (and b!9675 res!9875) b!9678))

(assert (= (and b!9678 res!9874) b!9676))

(assert (=> d!3090 m!13879))

(declare-fun m!13965 () Bool)

(assert (=> d!3090 m!13965))

(declare-fun m!13967 () Bool)

(assert (=> d!3090 m!13967))

(declare-fun m!13969 () Bool)

(assert (=> d!3090 m!13969))

(declare-fun m!13971 () Bool)

(assert (=> d!3090 m!13971))

(declare-fun m!13973 () Bool)

(assert (=> d!3090 m!13973))

(declare-fun m!13975 () Bool)

(assert (=> d!3090 m!13975))

(declare-fun m!13977 () Bool)

(assert (=> d!3090 m!13977))

(declare-fun m!13979 () Bool)

(assert (=> d!3090 m!13979))

(declare-fun m!13981 () Bool)

(assert (=> d!3090 m!13981))

(declare-fun m!13983 () Bool)

(assert (=> d!3090 m!13983))

(declare-fun m!13985 () Bool)

(assert (=> b!9676 m!13985))

(assert (=> b!9676 m!13869))

(assert (=> b!9676 m!13871))

(declare-fun m!13987 () Bool)

(assert (=> b!9678 m!13987))

(declare-fun m!13989 () Bool)

(assert (=> b!9675 m!13989))

(assert (=> b!9679 m!13871))

(declare-fun m!13991 () Bool)

(assert (=> b!9679 m!13991))

(declare-fun m!13993 () Bool)

(assert (=> b!9679 m!13993))

(assert (=> b!9590 d!3090))

(declare-fun d!3118 () Bool)

(declare-fun c!632 () Bool)

(assert (=> d!3118 (= c!632 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!5983 () List!145)

(assert (=> d!3118 (= (byteArrayBitContentToList!0 (_2!636 lt!14508) (_1!637 lt!14510) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!5983)))

(declare-fun b!9696 () Bool)

(assert (=> b!9696 (= e!5983 Nil!142)))

(declare-fun b!9697 () Bool)

(assert (=> b!9697 (= e!5983 (Cons!141 (not (= (bvand ((_ sign_extend 24) (select (arr!662 (_1!637 lt!14510)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!636 lt!14508) (_1!637 lt!14510) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3118 c!632) b!9696))

(assert (= (and d!3118 (not c!632)) b!9697))

(declare-fun m!14003 () Bool)

(assert (=> b!9697 m!14003))

(declare-fun m!14005 () Bool)

(assert (=> b!9697 m!14005))

(declare-fun m!14007 () Bool)

(assert (=> b!9697 m!14007))

(assert (=> b!9590 d!3118))

(declare-fun b!9723 () Bool)

(declare-fun res!9899 () Bool)

(declare-fun e!5992 () Bool)

(assert (=> b!9723 (=> (not res!9899) (not e!5992))))

(declare-fun lt!14724 () tuple2!1200)

(declare-fun lt!14732 () (_ BitVec 64))

(assert (=> b!9723 (= res!9899 (= (size!251 (_1!637 lt!14724)) ((_ extract 31 0) lt!14732)))))

(assert (=> b!9723 (and (bvslt lt!14732 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!14732 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!14727 () (_ BitVec 64))

(declare-fun lt!14729 () (_ BitVec 64))

(assert (=> b!9723 (= lt!14732 (bvsdiv lt!14727 lt!14729))))

(assert (=> b!9723 (and (not (= lt!14729 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!14727 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!14729 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!9723 (= lt!14729 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!14730 () (_ BitVec 64))

(declare-fun lt!14726 () (_ BitVec 64))

(assert (=> b!9723 (= lt!14727 (bvsub lt!14730 lt!14726))))

(assert (=> b!9723 (or (= (bvand lt!14730 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!14726 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!14730 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!14730 lt!14726) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9723 (= lt!14726 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!14725 () (_ BitVec 64))

(assert (=> b!9723 (= lt!14730 (bvadd nBits!460 lt!14725))))

(assert (=> b!9723 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!14725 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!14725) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9723 (= lt!14725 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!9724 () Bool)

(declare-fun res!9897 () Bool)

(assert (=> b!9724 (=> (not res!9897) (not e!5992))))

(declare-fun lt!14728 () (_ BitVec 64))

(assert (=> b!9724 (= res!9897 (= (bvadd lt!14728 nBits!460) (bitIndex!0 (size!251 (buf!590 (_2!637 lt!14724))) (currentByte!1635 (_2!637 lt!14724)) (currentBit!1630 (_2!637 lt!14724)))))))

(assert (=> b!9724 (or (not (= (bvand lt!14728 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!14728 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!14728 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9724 (= lt!14728 (bitIndex!0 (size!251 (buf!590 (_1!638 lt!14506))) (currentByte!1635 (_1!638 lt!14506)) (currentBit!1630 (_1!638 lt!14506))))))

(declare-fun b!9725 () Bool)

(assert (=> b!9725 (= e!5992 (= (byteArrayBitContentToList!0 (_2!637 lt!14724) (_1!637 lt!14724) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!637 lt!14724) (_1!638 lt!14506) nBits!460)))))

(declare-fun d!3122 () Bool)

(assert (=> d!3122 e!5992))

(declare-fun res!9898 () Bool)

(assert (=> d!3122 (=> (not res!9898) (not e!5992))))

(assert (=> d!3122 (= res!9898 (= (buf!590 (_2!637 lt!14724)) (buf!590 (_1!638 lt!14506))))))

(declare-datatypes ((tuple3!68 0))(
  ( (tuple3!69 (_1!644 Unit!819) (_2!644 BitStream!474) (_3!37 array!581)) )
))
(declare-fun lt!14731 () tuple3!68)

(assert (=> d!3122 (= lt!14724 (tuple2!1201 (_3!37 lt!14731) (_2!644 lt!14731)))))

(declare-fun readBitsLoop!0 (BitStream!474 (_ BitVec 64) array!581 (_ BitVec 64) (_ BitVec 64)) tuple3!68)

(assert (=> d!3122 (= lt!14731 (readBitsLoop!0 (_1!638 lt!14506) nBits!460 (array!582 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!3122 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!3122 (= (readBits!0 (_1!638 lt!14506) nBits!460) lt!14724)))

(declare-fun b!9726 () Bool)

(declare-fun res!9896 () Bool)

(assert (=> b!9726 (=> (not res!9896) (not e!5992))))

(assert (=> b!9726 (= res!9896 (invariant!0 (currentBit!1630 (_2!637 lt!14724)) (currentByte!1635 (_2!637 lt!14724)) (size!251 (buf!590 (_2!637 lt!14724)))))))

(declare-fun b!9727 () Bool)

(declare-fun res!9895 () Bool)

(assert (=> b!9727 (=> (not res!9895) (not e!5992))))

(assert (=> b!9727 (= res!9895 (bvsle (currentByte!1635 (_1!638 lt!14506)) (currentByte!1635 (_2!637 lt!14724))))))

(assert (= (and d!3122 res!9898) b!9724))

(assert (= (and b!9724 res!9897) b!9726))

(assert (= (and b!9726 res!9896) b!9723))

(assert (= (and b!9723 res!9899) b!9727))

(assert (= (and b!9727 res!9895) b!9725))

(declare-fun m!14039 () Bool)

(assert (=> b!9724 m!14039))

(declare-fun m!14041 () Bool)

(assert (=> b!9724 m!14041))

(declare-fun m!14043 () Bool)

(assert (=> b!9725 m!14043))

(declare-fun m!14045 () Bool)

(assert (=> b!9725 m!14045))

(declare-fun m!14047 () Bool)

(assert (=> d!3122 m!14047))

(declare-fun m!14049 () Bool)

(assert (=> b!9726 m!14049))

(assert (=> b!9590 d!3122))

(declare-fun lt!14739 () (_ BitVec 64))

(declare-datatypes ((tuple2!1214 0))(
  ( (tuple2!1215 (_1!645 List!145) (_2!645 BitStream!474)) )
))
(declare-fun e!5998 () tuple2!1214)

(declare-fun b!9737 () Bool)

(declare-datatypes ((tuple2!1216 0))(
  ( (tuple2!1217 (_1!646 Bool) (_2!646 BitStream!474)) )
))
(declare-fun lt!14740 () tuple2!1216)

(assert (=> b!9737 (= e!5998 (tuple2!1215 (Cons!141 (_1!646 lt!14740) (bitStreamReadBitsIntoList!0 (_2!636 lt!14508) (_2!646 lt!14740) (bvsub nBits!460 lt!14739))) (_2!646 lt!14740)))))

(declare-fun readBit!0 (BitStream!474) tuple2!1216)

(assert (=> b!9737 (= lt!14740 (readBit!0 (_1!638 lt!14506)))))

(assert (=> b!9737 (= lt!14739 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!9739 () Bool)

(declare-fun e!5997 () Bool)

(declare-fun lt!14741 () List!145)

(declare-fun length!24 (List!145) Int)

(assert (=> b!9739 (= e!5997 (> (length!24 lt!14741) 0))))

(declare-fun b!9738 () Bool)

(declare-fun isEmpty!29 (List!145) Bool)

(assert (=> b!9738 (= e!5997 (isEmpty!29 lt!14741))))

(declare-fun d!3126 () Bool)

(assert (=> d!3126 e!5997))

(declare-fun c!640 () Bool)

(assert (=> d!3126 (= c!640 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3126 (= lt!14741 (_1!645 e!5998))))

(declare-fun c!641 () Bool)

(assert (=> d!3126 (= c!641 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3126 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3126 (= (bitStreamReadBitsIntoList!0 (_2!636 lt!14508) (_1!638 lt!14506) nBits!460) lt!14741)))

(declare-fun b!9736 () Bool)

(assert (=> b!9736 (= e!5998 (tuple2!1215 Nil!142 (_1!638 lt!14506)))))

(assert (= (and d!3126 c!641) b!9736))

(assert (= (and d!3126 (not c!641)) b!9737))

(assert (= (and d!3126 c!640) b!9738))

(assert (= (and d!3126 (not c!640)) b!9739))

(declare-fun m!14051 () Bool)

(assert (=> b!9737 m!14051))

(declare-fun m!14053 () Bool)

(assert (=> b!9737 m!14053))

(declare-fun m!14055 () Bool)

(assert (=> b!9739 m!14055))

(declare-fun m!14057 () Bool)

(assert (=> b!9738 m!14057))

(assert (=> b!9590 d!3126))

(declare-fun d!3128 () Bool)

(assert (=> d!3128 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!251 (buf!590 (_2!636 lt!14508)))) ((_ sign_extend 32) (currentByte!1635 thiss!1486)) ((_ sign_extend 32) (currentBit!1630 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!251 (buf!590 (_2!636 lt!14508)))) ((_ sign_extend 32) (currentByte!1635 thiss!1486)) ((_ sign_extend 32) (currentBit!1630 thiss!1486))) nBits!460))))

(declare-fun bs!937 () Bool)

(assert (= bs!937 d!3128))

(declare-fun m!14059 () Bool)

(assert (=> bs!937 m!14059))

(assert (=> b!9590 d!3128))

(declare-fun d!3130 () Bool)

(assert (=> d!3130 (validate_offset_bits!1 ((_ sign_extend 32) (size!251 (buf!590 (_2!636 lt!14508)))) ((_ sign_extend 32) (currentByte!1635 thiss!1486)) ((_ sign_extend 32) (currentBit!1630 thiss!1486)) nBits!460)))

(declare-fun lt!14744 () Unit!819)

(declare-fun choose!9 (BitStream!474 array!581 (_ BitVec 64) BitStream!474) Unit!819)

(assert (=> d!3130 (= lt!14744 (choose!9 thiss!1486 (buf!590 (_2!636 lt!14508)) nBits!460 (BitStream!475 (buf!590 (_2!636 lt!14508)) (currentByte!1635 thiss!1486) (currentBit!1630 thiss!1486))))))

(assert (=> d!3130 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!590 (_2!636 lt!14508)) nBits!460) lt!14744)))

(declare-fun bs!938 () Bool)

(assert (= bs!938 d!3130))

(assert (=> bs!938 m!13893))

(declare-fun m!14061 () Bool)

(assert (=> bs!938 m!14061))

(assert (=> b!9590 d!3130))

(declare-fun d!3132 () Bool)

(assert (=> d!3132 (= (array_inv!243 (buf!590 thiss!1486)) (bvsge (size!251 (buf!590 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!9594 d!3132))

(declare-fun d!3134 () Bool)

(assert (=> d!3134 (= (invariant!0 (currentBit!1630 (_2!636 lt!14508)) (currentByte!1635 (_2!636 lt!14508)) (size!251 (buf!590 (_2!636 lt!14508)))) (and (bvsge (currentBit!1630 (_2!636 lt!14508)) #b00000000000000000000000000000000) (bvslt (currentBit!1630 (_2!636 lt!14508)) #b00000000000000000000000000001000) (bvsge (currentByte!1635 (_2!636 lt!14508)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1635 (_2!636 lt!14508)) (size!251 (buf!590 (_2!636 lt!14508)))) (and (= (currentBit!1630 (_2!636 lt!14508)) #b00000000000000000000000000000000) (= (currentByte!1635 (_2!636 lt!14508)) (size!251 (buf!590 (_2!636 lt!14508))))))))))

(assert (=> b!9588 d!3134))

(declare-fun b!9863 () Bool)

(declare-fun e!6044 () tuple2!1198)

(declare-fun Unit!831 () Unit!819)

(assert (=> b!9863 (= e!6044 (tuple2!1199 Unit!831 thiss!1486))))

(assert (=> b!9863 (= (size!251 (buf!590 thiss!1486)) (size!251 (buf!590 thiss!1486)))))

(declare-fun lt!15199 () Unit!819)

(declare-fun Unit!832 () Unit!819)

(assert (=> b!9863 (= lt!15199 Unit!832)))

(declare-fun call!178 () tuple2!1202)

(declare-fun checkByteArrayBitContent!0 (BitStream!474 array!581 array!581 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!9863 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!637 (readBits!0 (_1!638 call!178) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!9864 () Bool)

(declare-fun lt!15217 () tuple2!1198)

(declare-fun Unit!833 () Unit!819)

(assert (=> b!9864 (= e!6044 (tuple2!1199 Unit!833 (_2!636 lt!15217)))))

(declare-fun lt!15190 () tuple2!1198)

(declare-fun appendBitFromByte!0 (BitStream!474 (_ BitVec 8) (_ BitVec 32)) tuple2!1198)

(assert (=> b!9864 (= lt!15190 (appendBitFromByte!0 thiss!1486 (select (arr!662 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!15188 () (_ BitVec 64))

(assert (=> b!9864 (= lt!15188 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!15210 () (_ BitVec 64))

(assert (=> b!9864 (= lt!15210 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!15193 () Unit!819)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!474 BitStream!474 (_ BitVec 64) (_ BitVec 64)) Unit!819)

(assert (=> b!9864 (= lt!15193 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!636 lt!15190) lt!15188 lt!15210))))

(assert (=> b!9864 (validate_offset_bits!1 ((_ sign_extend 32) (size!251 (buf!590 (_2!636 lt!15190)))) ((_ sign_extend 32) (currentByte!1635 (_2!636 lt!15190))) ((_ sign_extend 32) (currentBit!1630 (_2!636 lt!15190))) (bvsub lt!15188 lt!15210))))

(declare-fun lt!15195 () Unit!819)

(assert (=> b!9864 (= lt!15195 lt!15193)))

(declare-fun lt!15215 () tuple2!1202)

(assert (=> b!9864 (= lt!15215 call!178)))

(declare-fun lt!15192 () (_ BitVec 64))

(assert (=> b!9864 (= lt!15192 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!15214 () Unit!819)

(assert (=> b!9864 (= lt!15214 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!590 (_2!636 lt!15190)) lt!15192))))

(assert (=> b!9864 (validate_offset_bits!1 ((_ sign_extend 32) (size!251 (buf!590 (_2!636 lt!15190)))) ((_ sign_extend 32) (currentByte!1635 thiss!1486)) ((_ sign_extend 32) (currentBit!1630 thiss!1486)) lt!15192)))

(declare-fun lt!15198 () Unit!819)

(assert (=> b!9864 (= lt!15198 lt!15214)))

(declare-fun head!51 (List!145) Bool)

(assert (=> b!9864 (= (head!51 (byteArrayBitContentToList!0 (_2!636 lt!15190) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!51 (bitStreamReadBitsIntoList!0 (_2!636 lt!15190) (_1!638 lt!15215) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!15191 () Unit!819)

(declare-fun Unit!836 () Unit!819)

(assert (=> b!9864 (= lt!15191 Unit!836)))

(assert (=> b!9864 (= lt!15217 (appendBitsMSBFirstLoop!0 (_2!636 lt!15190) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!15202 () Unit!819)

(assert (=> b!9864 (= lt!15202 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!636 lt!15190) (_2!636 lt!15217)))))

(assert (=> b!9864 (isPrefixOf!0 thiss!1486 (_2!636 lt!15217))))

(declare-fun lt!15200 () Unit!819)

(assert (=> b!9864 (= lt!15200 lt!15202)))

(assert (=> b!9864 (= (size!251 (buf!590 (_2!636 lt!15217))) (size!251 (buf!590 thiss!1486)))))

(declare-fun lt!15218 () Unit!819)

(declare-fun Unit!837 () Unit!819)

(assert (=> b!9864 (= lt!15218 Unit!837)))

(assert (=> b!9864 (= (bitIndex!0 (size!251 (buf!590 (_2!636 lt!15217))) (currentByte!1635 (_2!636 lt!15217)) (currentBit!1630 (_2!636 lt!15217))) (bvsub (bvadd (bitIndex!0 (size!251 (buf!590 thiss!1486)) (currentByte!1635 thiss!1486) (currentBit!1630 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!15211 () Unit!819)

(declare-fun Unit!838 () Unit!819)

(assert (=> b!9864 (= lt!15211 Unit!838)))

(assert (=> b!9864 (= (bitIndex!0 (size!251 (buf!590 (_2!636 lt!15217))) (currentByte!1635 (_2!636 lt!15217)) (currentBit!1630 (_2!636 lt!15217))) (bvsub (bvsub (bvadd (bitIndex!0 (size!251 (buf!590 (_2!636 lt!15190))) (currentByte!1635 (_2!636 lt!15190)) (currentBit!1630 (_2!636 lt!15190))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!15216 () Unit!819)

(declare-fun Unit!839 () Unit!819)

(assert (=> b!9864 (= lt!15216 Unit!839)))

(declare-fun lt!15186 () tuple2!1202)

(assert (=> b!9864 (= lt!15186 (reader!0 thiss!1486 (_2!636 lt!15217)))))

(declare-fun lt!15194 () (_ BitVec 64))

(assert (=> b!9864 (= lt!15194 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!15187 () Unit!819)

(assert (=> b!9864 (= lt!15187 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!590 (_2!636 lt!15217)) lt!15194))))

(assert (=> b!9864 (validate_offset_bits!1 ((_ sign_extend 32) (size!251 (buf!590 (_2!636 lt!15217)))) ((_ sign_extend 32) (currentByte!1635 thiss!1486)) ((_ sign_extend 32) (currentBit!1630 thiss!1486)) lt!15194)))

(declare-fun lt!15180 () Unit!819)

(assert (=> b!9864 (= lt!15180 lt!15187)))

(declare-fun lt!15205 () tuple2!1202)

(assert (=> b!9864 (= lt!15205 (reader!0 (_2!636 lt!15190) (_2!636 lt!15217)))))

(declare-fun lt!15182 () (_ BitVec 64))

(assert (=> b!9864 (= lt!15182 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!15181 () Unit!819)

(assert (=> b!9864 (= lt!15181 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!636 lt!15190) (buf!590 (_2!636 lt!15217)) lt!15182))))

(assert (=> b!9864 (validate_offset_bits!1 ((_ sign_extend 32) (size!251 (buf!590 (_2!636 lt!15217)))) ((_ sign_extend 32) (currentByte!1635 (_2!636 lt!15190))) ((_ sign_extend 32) (currentBit!1630 (_2!636 lt!15190))) lt!15182)))

(declare-fun lt!15213 () Unit!819)

(assert (=> b!9864 (= lt!15213 lt!15181)))

(declare-fun lt!15209 () List!145)

(assert (=> b!9864 (= lt!15209 (byteArrayBitContentToList!0 (_2!636 lt!15217) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!15203 () List!145)

(assert (=> b!9864 (= lt!15203 (byteArrayBitContentToList!0 (_2!636 lt!15217) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!15196 () List!145)

(assert (=> b!9864 (= lt!15196 (bitStreamReadBitsIntoList!0 (_2!636 lt!15217) (_1!638 lt!15186) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!15183 () List!145)

(assert (=> b!9864 (= lt!15183 (bitStreamReadBitsIntoList!0 (_2!636 lt!15217) (_1!638 lt!15205) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!15221 () (_ BitVec 64))

(assert (=> b!9864 (= lt!15221 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!15212 () Unit!819)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!474 BitStream!474 BitStream!474 BitStream!474 (_ BitVec 64) List!145) Unit!819)

(assert (=> b!9864 (= lt!15212 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!636 lt!15217) (_2!636 lt!15217) (_1!638 lt!15186) (_1!638 lt!15205) lt!15221 lt!15196))))

(declare-fun tail!59 (List!145) List!145)

(assert (=> b!9864 (= (bitStreamReadBitsIntoList!0 (_2!636 lt!15217) (_1!638 lt!15205) (bvsub lt!15221 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!59 lt!15196))))

(declare-fun lt!15207 () Unit!819)

(assert (=> b!9864 (= lt!15207 lt!15212)))

(declare-fun lt!15208 () (_ BitVec 64))

(declare-fun lt!15197 () Unit!819)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!581 array!581 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!819)

(assert (=> b!9864 (= lt!15197 (arrayBitRangesEqImpliesEq!0 (buf!590 (_2!636 lt!15190)) (buf!590 (_2!636 lt!15217)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!15208 (bitIndex!0 (size!251 (buf!590 (_2!636 lt!15190))) (currentByte!1635 (_2!636 lt!15190)) (currentBit!1630 (_2!636 lt!15190)))))))

(declare-fun bitAt!0 (array!581 (_ BitVec 64)) Bool)

(assert (=> b!9864 (= (bitAt!0 (buf!590 (_2!636 lt!15190)) lt!15208) (bitAt!0 (buf!590 (_2!636 lt!15217)) lt!15208))))

(declare-fun lt!15220 () Unit!819)

(assert (=> b!9864 (= lt!15220 lt!15197)))

(declare-fun b!9865 () Bool)

(declare-fun res!9987 () Bool)

(declare-fun e!6046 () Bool)

(assert (=> b!9865 (=> (not res!9987) (not e!6046))))

(declare-fun lt!15184 () tuple2!1198)

(assert (=> b!9865 (= res!9987 (= (size!251 (buf!590 (_2!636 lt!15184))) (size!251 (buf!590 thiss!1486))))))

(declare-fun b!9866 () Bool)

(declare-fun res!9988 () Bool)

(assert (=> b!9866 (=> (not res!9988) (not e!6046))))

(assert (=> b!9866 (= res!9988 (isPrefixOf!0 thiss!1486 (_2!636 lt!15184)))))

(declare-fun b!9867 () Bool)

(declare-fun res!9990 () Bool)

(assert (=> b!9867 (=> (not res!9990) (not e!6046))))

(assert (=> b!9867 (= res!9990 (= (size!251 (buf!590 thiss!1486)) (size!251 (buf!590 (_2!636 lt!15184)))))))

(declare-fun d!3136 () Bool)

(assert (=> d!3136 e!6046))

(declare-fun res!9992 () Bool)

(assert (=> d!3136 (=> (not res!9992) (not e!6046))))

(declare-fun lt!15189 () (_ BitVec 64))

(assert (=> d!3136 (= res!9992 (= (bitIndex!0 (size!251 (buf!590 (_2!636 lt!15184))) (currentByte!1635 (_2!636 lt!15184)) (currentBit!1630 (_2!636 lt!15184))) (bvsub lt!15189 from!367)))))

(assert (=> d!3136 (or (= (bvand lt!15189 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!15189 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!15189 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!15179 () (_ BitVec 64))

(assert (=> d!3136 (= lt!15189 (bvadd lt!15179 from!367 nBits!460))))

(assert (=> d!3136 (or (not (= (bvand lt!15179 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!15179 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!15179 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3136 (= lt!15179 (bitIndex!0 (size!251 (buf!590 thiss!1486)) (currentByte!1635 thiss!1486) (currentBit!1630 thiss!1486)))))

(assert (=> d!3136 (= lt!15184 e!6044)))

(declare-fun c!660 () Bool)

(assert (=> d!3136 (= c!660 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!15185 () Unit!819)

(declare-fun lt!15222 () Unit!819)

(assert (=> d!3136 (= lt!15185 lt!15222)))

(assert (=> d!3136 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!3136 (= lt!15222 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!3136 (= lt!15208 (bitIndex!0 (size!251 (buf!590 thiss!1486)) (currentByte!1635 thiss!1486) (currentBit!1630 thiss!1486)))))

(assert (=> d!3136 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3136 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!15184)))

(declare-fun b!9868 () Bool)

(declare-fun res!9989 () Bool)

(assert (=> b!9868 (=> (not res!9989) (not e!6046))))

(assert (=> b!9868 (= res!9989 (invariant!0 (currentBit!1630 (_2!636 lt!15184)) (currentByte!1635 (_2!636 lt!15184)) (size!251 (buf!590 (_2!636 lt!15184)))))))

(declare-fun bm!175 () Bool)

(assert (=> bm!175 (= call!178 (reader!0 thiss!1486 (ite c!660 (_2!636 lt!15190) thiss!1486)))))

(declare-fun b!9869 () Bool)

(declare-fun e!6045 () Bool)

(declare-fun lt!15206 () (_ BitVec 64))

(assert (=> b!9869 (= e!6045 (validate_offset_bits!1 ((_ sign_extend 32) (size!251 (buf!590 thiss!1486))) ((_ sign_extend 32) (currentByte!1635 thiss!1486)) ((_ sign_extend 32) (currentBit!1630 thiss!1486)) lt!15206))))

(declare-fun lt!15219 () tuple2!1202)

(declare-fun b!9871 () Bool)

(assert (=> b!9871 (= e!6046 (= (bitStreamReadBitsIntoList!0 (_2!636 lt!15184) (_1!638 lt!15219) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!636 lt!15184) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!9871 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9871 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!15201 () Unit!819)

(declare-fun lt!15204 () Unit!819)

(assert (=> b!9871 (= lt!15201 lt!15204)))

(assert (=> b!9871 (validate_offset_bits!1 ((_ sign_extend 32) (size!251 (buf!590 (_2!636 lt!15184)))) ((_ sign_extend 32) (currentByte!1635 thiss!1486)) ((_ sign_extend 32) (currentBit!1630 thiss!1486)) lt!15206)))

(assert (=> b!9871 (= lt!15204 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!590 (_2!636 lt!15184)) lt!15206))))

(assert (=> b!9871 e!6045))

(declare-fun res!9991 () Bool)

(assert (=> b!9871 (=> (not res!9991) (not e!6045))))

(assert (=> b!9871 (= res!9991 (and (= (size!251 (buf!590 thiss!1486)) (size!251 (buf!590 (_2!636 lt!15184)))) (bvsge lt!15206 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9871 (= lt!15206 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!9871 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9871 (= lt!15219 (reader!0 thiss!1486 (_2!636 lt!15184)))))

(assert (= (and d!3136 c!660) b!9864))

(assert (= (and d!3136 (not c!660)) b!9863))

(assert (= (or b!9864 b!9863) bm!175))

(assert (= (and d!3136 res!9992) b!9868))

(assert (= (and b!9868 res!9989) b!9867))

(assert (= (and b!9867 res!9990) b!9866))

(assert (= (and b!9866 res!9988) b!9865))

(assert (= (and b!9865 res!9987) b!9871))

(assert (= (and b!9871 res!9991) b!9869))

(declare-fun m!14229 () Bool)

(assert (=> b!9868 m!14229))

(declare-fun m!14231 () Bool)

(assert (=> d!3136 m!14231))

(assert (=> d!3136 m!13871))

(assert (=> d!3136 m!13973))

(assert (=> d!3136 m!13983))

(declare-fun m!14233 () Bool)

(assert (=> b!9869 m!14233))

(declare-fun m!14235 () Bool)

(assert (=> b!9863 m!14235))

(declare-fun m!14237 () Bool)

(assert (=> b!9863 m!14237))

(declare-fun m!14239 () Bool)

(assert (=> bm!175 m!14239))

(declare-fun m!14241 () Bool)

(assert (=> b!9871 m!14241))

(declare-fun m!14243 () Bool)

(assert (=> b!9871 m!14243))

(declare-fun m!14245 () Bool)

(assert (=> b!9871 m!14245))

(declare-fun m!14247 () Bool)

(assert (=> b!9871 m!14247))

(declare-fun m!14249 () Bool)

(assert (=> b!9871 m!14249))

(declare-fun m!14251 () Bool)

(assert (=> b!9866 m!14251))

(declare-fun m!14253 () Bool)

(assert (=> b!9864 m!14253))

(declare-fun m!14255 () Bool)

(assert (=> b!9864 m!14255))

(declare-fun m!14257 () Bool)

(assert (=> b!9864 m!14257))

(declare-fun m!14259 () Bool)

(assert (=> b!9864 m!14259))

(declare-fun m!14261 () Bool)

(assert (=> b!9864 m!14261))

(declare-fun m!14263 () Bool)

(assert (=> b!9864 m!14263))

(declare-fun m!14265 () Bool)

(assert (=> b!9864 m!14265))

(declare-fun m!14267 () Bool)

(assert (=> b!9864 m!14267))

(declare-fun m!14269 () Bool)

(assert (=> b!9864 m!14269))

(declare-fun m!14271 () Bool)

(assert (=> b!9864 m!14271))

(declare-fun m!14273 () Bool)

(assert (=> b!9864 m!14273))

(declare-fun m!14275 () Bool)

(assert (=> b!9864 m!14275))

(declare-fun m!14277 () Bool)

(assert (=> b!9864 m!14277))

(declare-fun m!14279 () Bool)

(assert (=> b!9864 m!14279))

(declare-fun m!14281 () Bool)

(assert (=> b!9864 m!14281))

(declare-fun m!14283 () Bool)

(assert (=> b!9864 m!14283))

(declare-fun m!14285 () Bool)

(assert (=> b!9864 m!14285))

(declare-fun m!14287 () Bool)

(assert (=> b!9864 m!14287))

(declare-fun m!14289 () Bool)

(assert (=> b!9864 m!14289))

(assert (=> b!9864 m!14279))

(assert (=> b!9864 m!14287))

(declare-fun m!14291 () Bool)

(assert (=> b!9864 m!14291))

(declare-fun m!14293 () Bool)

(assert (=> b!9864 m!14293))

(assert (=> b!9864 m!14261))

(declare-fun m!14295 () Bool)

(assert (=> b!9864 m!14295))

(declare-fun m!14297 () Bool)

(assert (=> b!9864 m!14297))

(assert (=> b!9864 m!13871))

(declare-fun m!14299 () Bool)

(assert (=> b!9864 m!14299))

(declare-fun m!14301 () Bool)

(assert (=> b!9864 m!14301))

(declare-fun m!14303 () Bool)

(assert (=> b!9864 m!14303))

(declare-fun m!14305 () Bool)

(assert (=> b!9864 m!14305))

(declare-fun m!14307 () Bool)

(assert (=> b!9864 m!14307))

(declare-fun m!14309 () Bool)

(assert (=> b!9864 m!14309))

(assert (=> b!9864 m!14257))

(declare-fun m!14311 () Bool)

(assert (=> b!9864 m!14311))

(declare-fun m!14313 () Bool)

(assert (=> b!9864 m!14313))

(assert (=> b!9588 d!3136))

(declare-fun d!3168 () Bool)

(declare-fun e!6054 () Bool)

(assert (=> d!3168 e!6054))

(declare-fun res!10007 () Bool)

(assert (=> d!3168 (=> (not res!10007) (not e!6054))))

(declare-fun lt!15280 () (_ BitVec 64))

(declare-fun lt!15284 () (_ BitVec 64))

(declare-fun lt!15279 () (_ BitVec 64))

(assert (=> d!3168 (= res!10007 (= lt!15284 (bvsub lt!15279 lt!15280)))))

(assert (=> d!3168 (or (= (bvand lt!15279 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!15280 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!15279 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!15279 lt!15280) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3168 (= lt!15280 (remainingBits!0 ((_ sign_extend 32) (size!251 (buf!590 (_2!636 lt!14508)))) ((_ sign_extend 32) (currentByte!1635 (_2!636 lt!14508))) ((_ sign_extend 32) (currentBit!1630 (_2!636 lt!14508)))))))

(declare-fun lt!15283 () (_ BitVec 64))

(declare-fun lt!15282 () (_ BitVec 64))

(assert (=> d!3168 (= lt!15279 (bvmul lt!15283 lt!15282))))

(assert (=> d!3168 (or (= lt!15283 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!15282 (bvsdiv (bvmul lt!15283 lt!15282) lt!15283)))))

(assert (=> d!3168 (= lt!15282 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3168 (= lt!15283 ((_ sign_extend 32) (size!251 (buf!590 (_2!636 lt!14508)))))))

(assert (=> d!3168 (= lt!15284 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1635 (_2!636 lt!14508))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1630 (_2!636 lt!14508)))))))

(assert (=> d!3168 (invariant!0 (currentBit!1630 (_2!636 lt!14508)) (currentByte!1635 (_2!636 lt!14508)) (size!251 (buf!590 (_2!636 lt!14508))))))

(assert (=> d!3168 (= (bitIndex!0 (size!251 (buf!590 (_2!636 lt!14508))) (currentByte!1635 (_2!636 lt!14508)) (currentBit!1630 (_2!636 lt!14508))) lt!15284)))

(declare-fun b!9886 () Bool)

(declare-fun res!10006 () Bool)

(assert (=> b!9886 (=> (not res!10006) (not e!6054))))

(assert (=> b!9886 (= res!10006 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!15284))))

(declare-fun b!9887 () Bool)

(declare-fun lt!15281 () (_ BitVec 64))

(assert (=> b!9887 (= e!6054 (bvsle lt!15284 (bvmul lt!15281 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!9887 (or (= lt!15281 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!15281 #b0000000000000000000000000000000000000000000000000000000000001000) lt!15281)))))

(assert (=> b!9887 (= lt!15281 ((_ sign_extend 32) (size!251 (buf!590 (_2!636 lt!14508)))))))

(assert (= (and d!3168 res!10007) b!9886))

(assert (= (and b!9886 res!10006) b!9887))

(declare-fun m!14399 () Bool)

(assert (=> d!3168 m!14399))

(assert (=> d!3168 m!13875))

(assert (=> b!9593 d!3168))

(declare-fun d!3170 () Bool)

(declare-fun e!6055 () Bool)

(assert (=> d!3170 e!6055))

(declare-fun res!10009 () Bool)

(assert (=> d!3170 (=> (not res!10009) (not e!6055))))

(declare-fun lt!15286 () (_ BitVec 64))

(declare-fun lt!15285 () (_ BitVec 64))

(declare-fun lt!15290 () (_ BitVec 64))

(assert (=> d!3170 (= res!10009 (= lt!15290 (bvsub lt!15285 lt!15286)))))

(assert (=> d!3170 (or (= (bvand lt!15285 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!15286 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!15285 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!15285 lt!15286) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3170 (= lt!15286 (remainingBits!0 ((_ sign_extend 32) (size!251 (buf!590 thiss!1486))) ((_ sign_extend 32) (currentByte!1635 thiss!1486)) ((_ sign_extend 32) (currentBit!1630 thiss!1486))))))

(declare-fun lt!15289 () (_ BitVec 64))

(declare-fun lt!15288 () (_ BitVec 64))

(assert (=> d!3170 (= lt!15285 (bvmul lt!15289 lt!15288))))

(assert (=> d!3170 (or (= lt!15289 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!15288 (bvsdiv (bvmul lt!15289 lt!15288) lt!15289)))))

(assert (=> d!3170 (= lt!15288 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3170 (= lt!15289 ((_ sign_extend 32) (size!251 (buf!590 thiss!1486))))))

(assert (=> d!3170 (= lt!15290 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1635 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1630 thiss!1486))))))

(assert (=> d!3170 (invariant!0 (currentBit!1630 thiss!1486) (currentByte!1635 thiss!1486) (size!251 (buf!590 thiss!1486)))))

(assert (=> d!3170 (= (bitIndex!0 (size!251 (buf!590 thiss!1486)) (currentByte!1635 thiss!1486) (currentBit!1630 thiss!1486)) lt!15290)))

(declare-fun b!9888 () Bool)

(declare-fun res!10008 () Bool)

(assert (=> b!9888 (=> (not res!10008) (not e!6055))))

(assert (=> b!9888 (= res!10008 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!15290))))

(declare-fun b!9889 () Bool)

(declare-fun lt!15287 () (_ BitVec 64))

(assert (=> b!9889 (= e!6055 (bvsle lt!15290 (bvmul lt!15287 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!9889 (or (= lt!15287 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!15287 #b0000000000000000000000000000000000000000000000000000000000001000) lt!15287)))))

(assert (=> b!9889 (= lt!15287 ((_ sign_extend 32) (size!251 (buf!590 thiss!1486))))))

(assert (= (and d!3170 res!10009) b!9888))

(assert (= (and b!9888 res!10008) b!9889))

(assert (=> d!3170 m!13931))

(assert (=> d!3170 m!13935))

(assert (=> b!9593 d!3170))

(declare-fun d!3172 () Bool)

(declare-fun c!662 () Bool)

(assert (=> d!3172 (= c!662 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!6056 () List!145)

(assert (=> d!3172 (= (byteArrayBitContentToList!0 (_2!636 lt!14508) srcBuffer!6 from!367 nBits!460) e!6056)))

(declare-fun b!9890 () Bool)

(assert (=> b!9890 (= e!6056 Nil!142)))

(declare-fun b!9891 () Bool)

(assert (=> b!9891 (= e!6056 (Cons!141 (not (= (bvand ((_ sign_extend 24) (select (arr!662 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!636 lt!14508) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3172 c!662) b!9890))

(assert (= (and d!3172 (not c!662)) b!9891))

(assert (=> b!9891 m!14257))

(declare-fun m!14401 () Bool)

(assert (=> b!9891 m!14401))

(declare-fun m!14403 () Bool)

(assert (=> b!9891 m!14403))

(assert (=> b!9587 d!3172))

(check-sat (not d!3130) (not b!9725) (not d!3128) (not b!9866) (not b!9868) (not b!9739) (not b!9675) (not d!3136) (not b!9891) (not b!9864) (not b!9869) (not b!9697) (not b!9863) (not b!9678) (not bm!175) (not b!9676) (not b!9737) (not d!3168) (not d!3090) (not d!3088) (not b!9726) (not b!9627) (not d!3122) (not b!9738) (not d!3078) (not b!9871) (not b!9724) (not d!3170) (not b!9625) (not b!9679))
