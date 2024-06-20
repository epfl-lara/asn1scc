; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13394 () Bool)

(assert start!13394)

(declare-datatypes ((array!2892 0))(
  ( (array!2893 (arr!1917 (Array (_ BitVec 32) (_ BitVec 8))) (size!1341 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2892)

(declare-fun b!68700 () Bool)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((BitStream!2292 0))(
  ( (BitStream!2293 (buf!1722 array!2892) (currentByte!3418 (_ BitVec 32)) (currentBit!3413 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!6016 0))(
  ( (tuple2!6017 (_1!3119 BitStream!2292) (_2!3119 BitStream!2292)) )
))
(declare-fun lt!109960 () tuple2!6016)

(declare-datatypes ((Unit!4615 0))(
  ( (Unit!4616) )
))
(declare-datatypes ((tuple2!6018 0))(
  ( (tuple2!6019 (_1!3120 Unit!4615) (_2!3120 BitStream!2292)) )
))
(declare-fun lt!109956 () tuple2!6018)

(declare-fun e!44921 () Bool)

(declare-datatypes ((List!721 0))(
  ( (Nil!718) (Cons!717 (h!836 Bool) (t!1471 List!721)) )
))
(declare-fun head!540 (List!721) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2292 array!2892 (_ BitVec 64) (_ BitVec 64)) List!721)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2292 BitStream!2292 (_ BitVec 64)) List!721)

(assert (=> b!68700 (= e!44921 (= (head!540 (byteArrayBitContentToList!0 (_2!3120 lt!109956) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!540 (bitStreamReadBitsIntoList!0 (_2!3120 lt!109956) (_1!3119 lt!109960) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun res!56819 () Bool)

(declare-fun e!44926 () Bool)

(assert (=> start!13394 (=> (not res!56819) (not e!44926))))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!13394 (= res!56819 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1341 srcBuffer!2))))))))

(assert (=> start!13394 e!44926))

(assert (=> start!13394 true))

(declare-fun array_inv!1205 (array!2892) Bool)

(assert (=> start!13394 (array_inv!1205 srcBuffer!2)))

(declare-fun thiss!1379 () BitStream!2292)

(declare-fun e!44923 () Bool)

(declare-fun inv!12 (BitStream!2292) Bool)

(assert (=> start!13394 (and (inv!12 thiss!1379) e!44923)))

(declare-fun b!68701 () Bool)

(declare-fun res!56810 () Bool)

(declare-fun e!44925 () Bool)

(assert (=> b!68701 (=> res!56810 e!44925)))

(declare-fun lt!109953 () tuple2!6018)

(assert (=> b!68701 (= res!56810 (not (= (size!1341 (buf!1722 thiss!1379)) (size!1341 (buf!1722 (_2!3120 lt!109953))))))))

(declare-fun b!68702 () Bool)

(declare-fun e!44928 () Bool)

(declare-fun lt!109959 () (_ BitVec 64))

(assert (=> b!68702 (= e!44928 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!109959) (bvsle lt!109959 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1341 (buf!1722 (_2!3120 lt!109956))))))))))

(declare-fun b!68703 () Bool)

(declare-fun e!44932 () Bool)

(declare-fun e!44922 () Bool)

(assert (=> b!68703 (= e!44932 e!44922)))

(declare-fun res!56806 () Bool)

(assert (=> b!68703 (=> res!56806 e!44922)))

(declare-fun lt!109952 () Bool)

(declare-fun lt!109951 () (_ BitVec 64))

(declare-fun lt!109941 () tuple2!6016)

(declare-fun bitAt!0 (array!2892 (_ BitVec 64)) Bool)

(assert (=> b!68703 (= res!56806 (not (= lt!109952 (bitAt!0 (buf!1722 (_1!3119 lt!109941)) lt!109951))))))

(declare-fun lt!109957 () tuple2!6016)

(assert (=> b!68703 (= lt!109952 (bitAt!0 (buf!1722 (_1!3119 lt!109957)) lt!109951))))

(declare-fun b!68704 () Bool)

(declare-fun res!56823 () Bool)

(assert (=> b!68704 (=> (not res!56823) (not e!44926))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!68704 (= res!56823 (validate_offset_bits!1 ((_ sign_extend 32) (size!1341 (buf!1722 thiss!1379))) ((_ sign_extend 32) (currentByte!3418 thiss!1379)) ((_ sign_extend 32) (currentBit!3413 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!68705 () Bool)

(declare-fun res!56807 () Bool)

(assert (=> b!68705 (=> res!56807 e!44925)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!68705 (= res!56807 (not (invariant!0 (currentBit!3413 (_2!3120 lt!109953)) (currentByte!3418 (_2!3120 lt!109953)) (size!1341 (buf!1722 (_2!3120 lt!109953))))))))

(declare-fun b!68706 () Bool)

(assert (=> b!68706 (= e!44923 (array_inv!1205 (buf!1722 thiss!1379)))))

(declare-fun b!68707 () Bool)

(declare-fun e!44927 () Bool)

(assert (=> b!68707 (= e!44926 (not e!44927))))

(declare-fun res!56815 () Bool)

(assert (=> b!68707 (=> res!56815 e!44927)))

(assert (=> b!68707 (= res!56815 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2292 BitStream!2292) Bool)

(assert (=> b!68707 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!109947 () Unit!4615)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2292) Unit!4615)

(assert (=> b!68707 (= lt!109947 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!68707 (= lt!109951 (bitIndex!0 (size!1341 (buf!1722 thiss!1379)) (currentByte!3418 thiss!1379) (currentBit!3413 thiss!1379)))))

(declare-fun b!68708 () Bool)

(declare-fun e!44930 () Bool)

(assert (=> b!68708 (= e!44925 e!44930)))

(declare-fun res!56808 () Bool)

(assert (=> b!68708 (=> res!56808 e!44930)))

(assert (=> b!68708 (= res!56808 (not (= (size!1341 (buf!1722 (_2!3120 lt!109956))) (size!1341 (buf!1722 (_2!3120 lt!109953))))))))

(declare-fun lt!109949 () (_ BitVec 64))

(assert (=> b!68708 (= lt!109949 (bvsub (bvsub (bvadd lt!109959 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!68708 (= lt!109959 (bitIndex!0 (size!1341 (buf!1722 (_2!3120 lt!109956))) (currentByte!3418 (_2!3120 lt!109956)) (currentBit!3413 (_2!3120 lt!109956))))))

(assert (=> b!68708 (= (size!1341 (buf!1722 (_2!3120 lt!109953))) (size!1341 (buf!1722 thiss!1379)))))

(declare-fun b!68709 () Bool)

(declare-fun e!44920 () Bool)

(assert (=> b!68709 (= e!44920 e!44932)))

(declare-fun res!56820 () Bool)

(assert (=> b!68709 (=> res!56820 e!44932)))

(declare-fun lt!109954 () List!721)

(declare-fun lt!109958 () List!721)

(assert (=> b!68709 (= res!56820 (not (= lt!109954 lt!109958)))))

(assert (=> b!68709 (= lt!109958 lt!109954)))

(declare-fun lt!109948 () List!721)

(declare-fun tail!325 (List!721) List!721)

(assert (=> b!68709 (= lt!109954 (tail!325 lt!109948))))

(declare-fun lt!109950 () Unit!4615)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2292 BitStream!2292 BitStream!2292 BitStream!2292 (_ BitVec 64) List!721) Unit!4615)

(assert (=> b!68709 (= lt!109950 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3120 lt!109953) (_2!3120 lt!109953) (_1!3119 lt!109957) (_1!3119 lt!109941) (bvsub to!314 i!635) lt!109948))))

(declare-fun b!68710 () Bool)

(declare-fun res!56814 () Bool)

(assert (=> b!68710 (=> res!56814 e!44922)))

(assert (=> b!68710 (= res!56814 (not (= (head!540 lt!109948) lt!109952)))))

(declare-fun b!68711 () Bool)

(declare-fun res!56822 () Bool)

(assert (=> b!68711 (=> res!56822 e!44928)))

(declare-fun lt!109940 () Bool)

(assert (=> b!68711 (= res!56822 (not (= (bitAt!0 (buf!1722 (_2!3120 lt!109956)) lt!109951) lt!109940)))))

(declare-fun b!68712 () Bool)

(declare-fun res!56811 () Bool)

(assert (=> b!68712 (=> res!56811 e!44920)))

(declare-fun length!349 (List!721) Int)

(assert (=> b!68712 (= res!56811 (<= (length!349 lt!109948) 0))))

(declare-fun b!68713 () Bool)

(assert (=> b!68713 (= e!44930 e!44920)))

(declare-fun res!56816 () Bool)

(assert (=> b!68713 (=> res!56816 e!44920)))

(assert (=> b!68713 (= res!56816 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!109944 () (_ BitVec 64))

(assert (=> b!68713 (= lt!109958 (bitStreamReadBitsIntoList!0 (_2!3120 lt!109953) (_1!3119 lt!109941) lt!109944))))

(assert (=> b!68713 (= lt!109948 (bitStreamReadBitsIntoList!0 (_2!3120 lt!109953) (_1!3119 lt!109957) (bvsub to!314 i!635)))))

(assert (=> b!68713 (validate_offset_bits!1 ((_ sign_extend 32) (size!1341 (buf!1722 (_2!3120 lt!109953)))) ((_ sign_extend 32) (currentByte!3418 (_2!3120 lt!109956))) ((_ sign_extend 32) (currentBit!3413 (_2!3120 lt!109956))) lt!109944)))

(declare-fun lt!109946 () Unit!4615)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2292 array!2892 (_ BitVec 64)) Unit!4615)

(assert (=> b!68713 (= lt!109946 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3120 lt!109956) (buf!1722 (_2!3120 lt!109953)) lt!109944))))

(declare-fun reader!0 (BitStream!2292 BitStream!2292) tuple2!6016)

(assert (=> b!68713 (= lt!109941 (reader!0 (_2!3120 lt!109956) (_2!3120 lt!109953)))))

(assert (=> b!68713 (validate_offset_bits!1 ((_ sign_extend 32) (size!1341 (buf!1722 (_2!3120 lt!109953)))) ((_ sign_extend 32) (currentByte!3418 thiss!1379)) ((_ sign_extend 32) (currentBit!3413 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!109955 () Unit!4615)

(assert (=> b!68713 (= lt!109955 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1722 (_2!3120 lt!109953)) (bvsub to!314 i!635)))))

(assert (=> b!68713 (= lt!109957 (reader!0 thiss!1379 (_2!3120 lt!109953)))))

(declare-fun b!68714 () Bool)

(assert (=> b!68714 (= e!44922 e!44928)))

(declare-fun res!56818 () Bool)

(assert (=> b!68714 (=> res!56818 e!44928)))

(assert (=> b!68714 (= res!56818 (not (= (head!540 (byteArrayBitContentToList!0 (_2!3120 lt!109953) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!109940)))))

(assert (=> b!68714 (= lt!109940 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!68715 () Bool)

(declare-fun res!56812 () Bool)

(assert (=> b!68715 (=> res!56812 e!44930)))

(assert (=> b!68715 (= res!56812 (not (invariant!0 (currentBit!3413 (_2!3120 lt!109956)) (currentByte!3418 (_2!3120 lt!109956)) (size!1341 (buf!1722 (_2!3120 lt!109956))))))))

(declare-fun b!68716 () Bool)

(declare-fun res!56817 () Bool)

(assert (=> b!68716 (=> res!56817 e!44930)))

(assert (=> b!68716 (= res!56817 (not (invariant!0 (currentBit!3413 (_2!3120 lt!109956)) (currentByte!3418 (_2!3120 lt!109956)) (size!1341 (buf!1722 (_2!3120 lt!109953))))))))

(declare-fun b!68717 () Bool)

(declare-fun e!44924 () Bool)

(assert (=> b!68717 (= e!44927 e!44924)))

(declare-fun res!56805 () Bool)

(assert (=> b!68717 (=> res!56805 e!44924)))

(assert (=> b!68717 (= res!56805 (not (isPrefixOf!0 thiss!1379 (_2!3120 lt!109956))))))

(assert (=> b!68717 (validate_offset_bits!1 ((_ sign_extend 32) (size!1341 (buf!1722 (_2!3120 lt!109956)))) ((_ sign_extend 32) (currentByte!3418 (_2!3120 lt!109956))) ((_ sign_extend 32) (currentBit!3413 (_2!3120 lt!109956))) lt!109944)))

(assert (=> b!68717 (= lt!109944 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!109942 () Unit!4615)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2292 BitStream!2292 (_ BitVec 64) (_ BitVec 64)) Unit!4615)

(assert (=> b!68717 (= lt!109942 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3120 lt!109956) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2292 (_ BitVec 8) (_ BitVec 32)) tuple2!6018)

(assert (=> b!68717 (= lt!109956 (appendBitFromByte!0 thiss!1379 (select (arr!1917 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!68718 () Bool)

(declare-fun e!44931 () Bool)

(assert (=> b!68718 (= e!44924 e!44931)))

(declare-fun res!56821 () Bool)

(assert (=> b!68718 (=> res!56821 e!44931)))

(assert (=> b!68718 (= res!56821 (not (isPrefixOf!0 (_2!3120 lt!109956) (_2!3120 lt!109953))))))

(assert (=> b!68718 (isPrefixOf!0 thiss!1379 (_2!3120 lt!109953))))

(declare-fun lt!109945 () Unit!4615)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2292 BitStream!2292 BitStream!2292) Unit!4615)

(assert (=> b!68718 (= lt!109945 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3120 lt!109956) (_2!3120 lt!109953)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2292 array!2892 (_ BitVec 64) (_ BitVec 64)) tuple2!6018)

(assert (=> b!68718 (= lt!109953 (appendBitsMSBFirstLoop!0 (_2!3120 lt!109956) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!68718 e!44921))

(declare-fun res!56809 () Bool)

(assert (=> b!68718 (=> (not res!56809) (not e!44921))))

(assert (=> b!68718 (= res!56809 (validate_offset_bits!1 ((_ sign_extend 32) (size!1341 (buf!1722 (_2!3120 lt!109956)))) ((_ sign_extend 32) (currentByte!3418 thiss!1379)) ((_ sign_extend 32) (currentBit!3413 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!109943 () Unit!4615)

(assert (=> b!68718 (= lt!109943 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1722 (_2!3120 lt!109956)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!68718 (= lt!109960 (reader!0 thiss!1379 (_2!3120 lt!109956)))))

(declare-fun b!68719 () Bool)

(assert (=> b!68719 (= e!44931 e!44925)))

(declare-fun res!56813 () Bool)

(assert (=> b!68719 (=> res!56813 e!44925)))

(assert (=> b!68719 (= res!56813 (not (= lt!109949 (bvsub (bvadd lt!109951 to!314) i!635))))))

(assert (=> b!68719 (= lt!109949 (bitIndex!0 (size!1341 (buf!1722 (_2!3120 lt!109953))) (currentByte!3418 (_2!3120 lt!109953)) (currentBit!3413 (_2!3120 lt!109953))))))

(assert (= (and start!13394 res!56819) b!68704))

(assert (= (and b!68704 res!56823) b!68707))

(assert (= (and b!68707 (not res!56815)) b!68717))

(assert (= (and b!68717 (not res!56805)) b!68718))

(assert (= (and b!68718 res!56809) b!68700))

(assert (= (and b!68718 (not res!56821)) b!68719))

(assert (= (and b!68719 (not res!56813)) b!68705))

(assert (= (and b!68705 (not res!56807)) b!68701))

(assert (= (and b!68701 (not res!56810)) b!68708))

(assert (= (and b!68708 (not res!56808)) b!68715))

(assert (= (and b!68715 (not res!56812)) b!68716))

(assert (= (and b!68716 (not res!56817)) b!68713))

(assert (= (and b!68713 (not res!56816)) b!68712))

(assert (= (and b!68712 (not res!56811)) b!68709))

(assert (= (and b!68709 (not res!56820)) b!68703))

(assert (= (and b!68703 (not res!56806)) b!68710))

(assert (= (and b!68710 (not res!56814)) b!68714))

(assert (= (and b!68714 (not res!56818)) b!68711))

(assert (= (and b!68711 (not res!56822)) b!68702))

(assert (= start!13394 b!68706))

(declare-fun m!109695 () Bool)

(assert (=> b!68708 m!109695))

(declare-fun m!109697 () Bool)

(assert (=> b!68717 m!109697))

(declare-fun m!109699 () Bool)

(assert (=> b!68717 m!109699))

(declare-fun m!109701 () Bool)

(assert (=> b!68717 m!109701))

(assert (=> b!68717 m!109697))

(declare-fun m!109703 () Bool)

(assert (=> b!68717 m!109703))

(declare-fun m!109705 () Bool)

(assert (=> b!68717 m!109705))

(declare-fun m!109707 () Bool)

(assert (=> b!68705 m!109707))

(declare-fun m!109709 () Bool)

(assert (=> b!68716 m!109709))

(declare-fun m!109711 () Bool)

(assert (=> b!68704 m!109711))

(declare-fun m!109713 () Bool)

(assert (=> b!68703 m!109713))

(declare-fun m!109715 () Bool)

(assert (=> b!68703 m!109715))

(declare-fun m!109717 () Bool)

(assert (=> b!68709 m!109717))

(declare-fun m!109719 () Bool)

(assert (=> b!68709 m!109719))

(declare-fun m!109721 () Bool)

(assert (=> b!68714 m!109721))

(assert (=> b!68714 m!109721))

(declare-fun m!109723 () Bool)

(assert (=> b!68714 m!109723))

(declare-fun m!109725 () Bool)

(assert (=> b!68714 m!109725))

(declare-fun m!109727 () Bool)

(assert (=> b!68707 m!109727))

(declare-fun m!109729 () Bool)

(assert (=> b!68707 m!109729))

(declare-fun m!109731 () Bool)

(assert (=> b!68707 m!109731))

(declare-fun m!109733 () Bool)

(assert (=> b!68711 m!109733))

(declare-fun m!109735 () Bool)

(assert (=> b!68700 m!109735))

(assert (=> b!68700 m!109735))

(declare-fun m!109737 () Bool)

(assert (=> b!68700 m!109737))

(declare-fun m!109739 () Bool)

(assert (=> b!68700 m!109739))

(assert (=> b!68700 m!109739))

(declare-fun m!109741 () Bool)

(assert (=> b!68700 m!109741))

(declare-fun m!109743 () Bool)

(assert (=> b!68713 m!109743))

(declare-fun m!109745 () Bool)

(assert (=> b!68713 m!109745))

(declare-fun m!109747 () Bool)

(assert (=> b!68713 m!109747))

(declare-fun m!109749 () Bool)

(assert (=> b!68713 m!109749))

(declare-fun m!109751 () Bool)

(assert (=> b!68713 m!109751))

(declare-fun m!109753 () Bool)

(assert (=> b!68713 m!109753))

(declare-fun m!109755 () Bool)

(assert (=> b!68713 m!109755))

(declare-fun m!109757 () Bool)

(assert (=> b!68713 m!109757))

(declare-fun m!109759 () Bool)

(assert (=> b!68718 m!109759))

(declare-fun m!109761 () Bool)

(assert (=> b!68718 m!109761))

(declare-fun m!109763 () Bool)

(assert (=> b!68718 m!109763))

(declare-fun m!109765 () Bool)

(assert (=> b!68718 m!109765))

(declare-fun m!109767 () Bool)

(assert (=> b!68718 m!109767))

(declare-fun m!109769 () Bool)

(assert (=> b!68718 m!109769))

(declare-fun m!109771 () Bool)

(assert (=> b!68718 m!109771))

(declare-fun m!109773 () Bool)

(assert (=> b!68710 m!109773))

(declare-fun m!109775 () Bool)

(assert (=> b!68706 m!109775))

(declare-fun m!109777 () Bool)

(assert (=> b!68712 m!109777))

(declare-fun m!109779 () Bool)

(assert (=> b!68715 m!109779))

(declare-fun m!109781 () Bool)

(assert (=> start!13394 m!109781))

(declare-fun m!109783 () Bool)

(assert (=> start!13394 m!109783))

(declare-fun m!109785 () Bool)

(assert (=> b!68719 m!109785))

(check-sat (not b!68706) (not b!68704) (not b!68719) (not b!68712) (not b!68705) (not b!68718) (not b!68717) (not b!68703) (not b!68709) (not b!68710) (not b!68715) (not start!13394) (not b!68714) (not b!68700) (not b!68707) (not b!68708) (not b!68716) (not b!68711) (not b!68713))
(check-sat)
(get-model)

(declare-fun d!21844 () Bool)

(declare-fun res!56887 () Bool)

(declare-fun e!44980 () Bool)

(assert (=> d!21844 (=> (not res!56887) (not e!44980))))

(assert (=> d!21844 (= res!56887 (= (size!1341 (buf!1722 thiss!1379)) (size!1341 (buf!1722 (_2!3120 lt!109956)))))))

(assert (=> d!21844 (= (isPrefixOf!0 thiss!1379 (_2!3120 lt!109956)) e!44980)))

(declare-fun b!68786 () Bool)

(declare-fun res!56888 () Bool)

(assert (=> b!68786 (=> (not res!56888) (not e!44980))))

(assert (=> b!68786 (= res!56888 (bvsle (bitIndex!0 (size!1341 (buf!1722 thiss!1379)) (currentByte!3418 thiss!1379) (currentBit!3413 thiss!1379)) (bitIndex!0 (size!1341 (buf!1722 (_2!3120 lt!109956))) (currentByte!3418 (_2!3120 lt!109956)) (currentBit!3413 (_2!3120 lt!109956)))))))

(declare-fun b!68787 () Bool)

(declare-fun e!44981 () Bool)

(assert (=> b!68787 (= e!44980 e!44981)))

(declare-fun res!56889 () Bool)

(assert (=> b!68787 (=> res!56889 e!44981)))

(assert (=> b!68787 (= res!56889 (= (size!1341 (buf!1722 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!68788 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2892 array!2892 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!68788 (= e!44981 (arrayBitRangesEq!0 (buf!1722 thiss!1379) (buf!1722 (_2!3120 lt!109956)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1341 (buf!1722 thiss!1379)) (currentByte!3418 thiss!1379) (currentBit!3413 thiss!1379))))))

(assert (= (and d!21844 res!56887) b!68786))

(assert (= (and b!68786 res!56888) b!68787))

(assert (= (and b!68787 (not res!56889)) b!68788))

(assert (=> b!68786 m!109731))

(assert (=> b!68786 m!109695))

(assert (=> b!68788 m!109731))

(assert (=> b!68788 m!109731))

(declare-fun m!109879 () Bool)

(assert (=> b!68788 m!109879))

(assert (=> b!68717 d!21844))

(declare-fun d!21846 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!21846 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1341 (buf!1722 (_2!3120 lt!109956)))) ((_ sign_extend 32) (currentByte!3418 (_2!3120 lt!109956))) ((_ sign_extend 32) (currentBit!3413 (_2!3120 lt!109956))) lt!109944) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1341 (buf!1722 (_2!3120 lt!109956)))) ((_ sign_extend 32) (currentByte!3418 (_2!3120 lt!109956))) ((_ sign_extend 32) (currentBit!3413 (_2!3120 lt!109956)))) lt!109944))))

(declare-fun bs!5274 () Bool)

(assert (= bs!5274 d!21846))

(declare-fun m!109881 () Bool)

(assert (=> bs!5274 m!109881))

(assert (=> b!68717 d!21846))

(declare-fun d!21848 () Bool)

(declare-fun e!44984 () Bool)

(assert (=> d!21848 e!44984))

(declare-fun res!56892 () Bool)

(assert (=> d!21848 (=> (not res!56892) (not e!44984))))

(assert (=> d!21848 (= res!56892 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!110026 () Unit!4615)

(declare-fun choose!27 (BitStream!2292 BitStream!2292 (_ BitVec 64) (_ BitVec 64)) Unit!4615)

(assert (=> d!21848 (= lt!110026 (choose!27 thiss!1379 (_2!3120 lt!109956) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!21848 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!21848 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3120 lt!109956) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!110026)))

(declare-fun b!68791 () Bool)

(assert (=> b!68791 (= e!44984 (validate_offset_bits!1 ((_ sign_extend 32) (size!1341 (buf!1722 (_2!3120 lt!109956)))) ((_ sign_extend 32) (currentByte!3418 (_2!3120 lt!109956))) ((_ sign_extend 32) (currentBit!3413 (_2!3120 lt!109956))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!21848 res!56892) b!68791))

(declare-fun m!109883 () Bool)

(assert (=> d!21848 m!109883))

(declare-fun m!109885 () Bool)

(assert (=> b!68791 m!109885))

(assert (=> b!68717 d!21848))

(declare-fun b!68809 () Bool)

(declare-fun res!56909 () Bool)

(declare-fun e!44994 () Bool)

(assert (=> b!68809 (=> (not res!56909) (not e!44994))))

(declare-fun lt!110056 () tuple2!6018)

(assert (=> b!68809 (= res!56909 (isPrefixOf!0 thiss!1379 (_2!3120 lt!110056)))))

(declare-fun b!68810 () Bool)

(declare-fun res!56915 () Bool)

(declare-fun e!44996 () Bool)

(assert (=> b!68810 (=> (not res!56915) (not e!44996))))

(declare-fun lt!110054 () (_ BitVec 64))

(declare-fun lt!110060 () (_ BitVec 64))

(declare-fun lt!110053 () tuple2!6018)

(assert (=> b!68810 (= res!56915 (= (bitIndex!0 (size!1341 (buf!1722 (_2!3120 lt!110053))) (currentByte!3418 (_2!3120 lt!110053)) (currentBit!3413 (_2!3120 lt!110053))) (bvadd lt!110060 lt!110054)))))

(assert (=> b!68810 (or (not (= (bvand lt!110060 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!110054 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!110060 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!110060 lt!110054) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!68810 (= lt!110054 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!68810 (= lt!110060 (bitIndex!0 (size!1341 (buf!1722 thiss!1379)) (currentByte!3418 thiss!1379) (currentBit!3413 thiss!1379)))))

(declare-fun d!21850 () Bool)

(assert (=> d!21850 e!44996))

(declare-fun res!56911 () Bool)

(assert (=> d!21850 (=> (not res!56911) (not e!44996))))

(assert (=> d!21850 (= res!56911 (= (size!1341 (buf!1722 (_2!3120 lt!110053))) (size!1341 (buf!1722 thiss!1379))))))

(declare-fun lt!110051 () (_ BitVec 8))

(declare-fun lt!110055 () array!2892)

(assert (=> d!21850 (= lt!110051 (select (arr!1917 lt!110055) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!21850 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1341 lt!110055)))))

(assert (=> d!21850 (= lt!110055 (array!2893 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!110058 () tuple2!6018)

(assert (=> d!21850 (= lt!110053 (tuple2!6019 (_1!3120 lt!110058) (_2!3120 lt!110058)))))

(assert (=> d!21850 (= lt!110058 lt!110056)))

(assert (=> d!21850 e!44994))

(declare-fun res!56916 () Bool)

(assert (=> d!21850 (=> (not res!56916) (not e!44994))))

(assert (=> d!21850 (= res!56916 (= (size!1341 (buf!1722 thiss!1379)) (size!1341 (buf!1722 (_2!3120 lt!110056)))))))

(declare-fun lt!110062 () Bool)

(declare-fun appendBit!0 (BitStream!2292 Bool) tuple2!6018)

(assert (=> d!21850 (= lt!110056 (appendBit!0 thiss!1379 lt!110062))))

(assert (=> d!21850 (= lt!110062 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1917 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!21850 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!21850 (= (appendBitFromByte!0 thiss!1379 (select (arr!1917 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!110053)))

(declare-fun b!68811 () Bool)

(declare-fun res!56913 () Bool)

(assert (=> b!68811 (=> (not res!56913) (not e!44996))))

(assert (=> b!68811 (= res!56913 (isPrefixOf!0 thiss!1379 (_2!3120 lt!110053)))))

(declare-fun b!68812 () Bool)

(declare-fun res!56914 () Bool)

(assert (=> b!68812 (=> (not res!56914) (not e!44994))))

(assert (=> b!68812 (= res!56914 (= (bitIndex!0 (size!1341 (buf!1722 (_2!3120 lt!110056))) (currentByte!3418 (_2!3120 lt!110056)) (currentBit!3413 (_2!3120 lt!110056))) (bvadd (bitIndex!0 (size!1341 (buf!1722 thiss!1379)) (currentByte!3418 thiss!1379) (currentBit!3413 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!68813 () Bool)

(declare-fun e!44993 () Bool)

(assert (=> b!68813 (= e!44994 e!44993)))

(declare-fun res!56912 () Bool)

(assert (=> b!68813 (=> (not res!56912) (not e!44993))))

(declare-datatypes ((tuple2!6024 0))(
  ( (tuple2!6025 (_1!3123 BitStream!2292) (_2!3123 Bool)) )
))
(declare-fun lt!110057 () tuple2!6024)

(assert (=> b!68813 (= res!56912 (and (= (_2!3123 lt!110057) lt!110062) (= (_1!3123 lt!110057) (_2!3120 lt!110056))))))

(declare-fun readBitPure!0 (BitStream!2292) tuple2!6024)

(declare-fun readerFrom!0 (BitStream!2292 (_ BitVec 32) (_ BitVec 32)) BitStream!2292)

(assert (=> b!68813 (= lt!110057 (readBitPure!0 (readerFrom!0 (_2!3120 lt!110056) (currentBit!3413 thiss!1379) (currentByte!3418 thiss!1379))))))

(declare-fun b!68814 () Bool)

(assert (=> b!68814 (= e!44993 (= (bitIndex!0 (size!1341 (buf!1722 (_1!3123 lt!110057))) (currentByte!3418 (_1!3123 lt!110057)) (currentBit!3413 (_1!3123 lt!110057))) (bitIndex!0 (size!1341 (buf!1722 (_2!3120 lt!110056))) (currentByte!3418 (_2!3120 lt!110056)) (currentBit!3413 (_2!3120 lt!110056)))))))

(declare-fun b!68815 () Bool)

(declare-fun e!44995 () Bool)

(assert (=> b!68815 (= e!44996 e!44995)))

(declare-fun res!56910 () Bool)

(assert (=> b!68815 (=> (not res!56910) (not e!44995))))

(declare-fun lt!110061 () tuple2!6024)

(assert (=> b!68815 (= res!56910 (and (= (_2!3123 lt!110061) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1917 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!110051)) #b00000000000000000000000000000000))) (= (_1!3123 lt!110061) (_2!3120 lt!110053))))))

(declare-datatypes ((tuple2!6026 0))(
  ( (tuple2!6027 (_1!3124 array!2892) (_2!3124 BitStream!2292)) )
))
(declare-fun lt!110052 () tuple2!6026)

(declare-fun lt!110059 () BitStream!2292)

(declare-fun readBits!0 (BitStream!2292 (_ BitVec 64)) tuple2!6026)

(assert (=> b!68815 (= lt!110052 (readBits!0 lt!110059 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!68815 (= lt!110061 (readBitPure!0 lt!110059))))

(assert (=> b!68815 (= lt!110059 (readerFrom!0 (_2!3120 lt!110053) (currentBit!3413 thiss!1379) (currentByte!3418 thiss!1379)))))

(declare-fun b!68816 () Bool)

(assert (=> b!68816 (= e!44995 (= (bitIndex!0 (size!1341 (buf!1722 (_1!3123 lt!110061))) (currentByte!3418 (_1!3123 lt!110061)) (currentBit!3413 (_1!3123 lt!110061))) (bitIndex!0 (size!1341 (buf!1722 (_2!3120 lt!110053))) (currentByte!3418 (_2!3120 lt!110053)) (currentBit!3413 (_2!3120 lt!110053)))))))

(assert (= (and d!21850 res!56916) b!68812))

(assert (= (and b!68812 res!56914) b!68809))

(assert (= (and b!68809 res!56909) b!68813))

(assert (= (and b!68813 res!56912) b!68814))

(assert (= (and d!21850 res!56911) b!68810))

(assert (= (and b!68810 res!56915) b!68811))

(assert (= (and b!68811 res!56913) b!68815))

(assert (= (and b!68815 res!56910) b!68816))

(declare-fun m!109887 () Bool)

(assert (=> b!68809 m!109887))

(declare-fun m!109889 () Bool)

(assert (=> b!68815 m!109889))

(declare-fun m!109891 () Bool)

(assert (=> b!68815 m!109891))

(declare-fun m!109893 () Bool)

(assert (=> b!68815 m!109893))

(declare-fun m!109895 () Bool)

(assert (=> d!21850 m!109895))

(declare-fun m!109897 () Bool)

(assert (=> d!21850 m!109897))

(declare-fun m!109899 () Bool)

(assert (=> d!21850 m!109899))

(declare-fun m!109901 () Bool)

(assert (=> b!68814 m!109901))

(declare-fun m!109903 () Bool)

(assert (=> b!68814 m!109903))

(declare-fun m!109905 () Bool)

(assert (=> b!68810 m!109905))

(assert (=> b!68810 m!109731))

(assert (=> b!68812 m!109903))

(assert (=> b!68812 m!109731))

(declare-fun m!109907 () Bool)

(assert (=> b!68816 m!109907))

(assert (=> b!68816 m!109905))

(declare-fun m!109909 () Bool)

(assert (=> b!68811 m!109909))

(declare-fun m!109911 () Bool)

(assert (=> b!68813 m!109911))

(assert (=> b!68813 m!109911))

(declare-fun m!109913 () Bool)

(assert (=> b!68813 m!109913))

(assert (=> b!68717 d!21850))

(declare-fun d!21852 () Bool)

(assert (=> d!21852 (= (array_inv!1205 (buf!1722 thiss!1379)) (bvsge (size!1341 (buf!1722 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!68706 d!21852))

(declare-fun d!21854 () Bool)

(assert (=> d!21854 (= (invariant!0 (currentBit!3413 (_2!3120 lt!109953)) (currentByte!3418 (_2!3120 lt!109953)) (size!1341 (buf!1722 (_2!3120 lt!109953)))) (and (bvsge (currentBit!3413 (_2!3120 lt!109953)) #b00000000000000000000000000000000) (bvslt (currentBit!3413 (_2!3120 lt!109953)) #b00000000000000000000000000001000) (bvsge (currentByte!3418 (_2!3120 lt!109953)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3418 (_2!3120 lt!109953)) (size!1341 (buf!1722 (_2!3120 lt!109953)))) (and (= (currentBit!3413 (_2!3120 lt!109953)) #b00000000000000000000000000000000) (= (currentByte!3418 (_2!3120 lt!109953)) (size!1341 (buf!1722 (_2!3120 lt!109953))))))))))

(assert (=> b!68705 d!21854))

(declare-fun d!21856 () Bool)

(assert (=> d!21856 (= (invariant!0 (currentBit!3413 (_2!3120 lt!109956)) (currentByte!3418 (_2!3120 lt!109956)) (size!1341 (buf!1722 (_2!3120 lt!109953)))) (and (bvsge (currentBit!3413 (_2!3120 lt!109956)) #b00000000000000000000000000000000) (bvslt (currentBit!3413 (_2!3120 lt!109956)) #b00000000000000000000000000001000) (bvsge (currentByte!3418 (_2!3120 lt!109956)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3418 (_2!3120 lt!109956)) (size!1341 (buf!1722 (_2!3120 lt!109953)))) (and (= (currentBit!3413 (_2!3120 lt!109956)) #b00000000000000000000000000000000) (= (currentByte!3418 (_2!3120 lt!109956)) (size!1341 (buf!1722 (_2!3120 lt!109953))))))))))

(assert (=> b!68716 d!21856))

(declare-fun d!21858 () Bool)

(assert (=> d!21858 (= (invariant!0 (currentBit!3413 (_2!3120 lt!109956)) (currentByte!3418 (_2!3120 lt!109956)) (size!1341 (buf!1722 (_2!3120 lt!109956)))) (and (bvsge (currentBit!3413 (_2!3120 lt!109956)) #b00000000000000000000000000000000) (bvslt (currentBit!3413 (_2!3120 lt!109956)) #b00000000000000000000000000001000) (bvsge (currentByte!3418 (_2!3120 lt!109956)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3418 (_2!3120 lt!109956)) (size!1341 (buf!1722 (_2!3120 lt!109956)))) (and (= (currentBit!3413 (_2!3120 lt!109956)) #b00000000000000000000000000000000) (= (currentByte!3418 (_2!3120 lt!109956)) (size!1341 (buf!1722 (_2!3120 lt!109956))))))))))

(assert (=> b!68715 d!21858))

(declare-fun d!21860 () Bool)

(assert (=> d!21860 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1341 (buf!1722 thiss!1379))) ((_ sign_extend 32) (currentByte!3418 thiss!1379)) ((_ sign_extend 32) (currentBit!3413 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1341 (buf!1722 thiss!1379))) ((_ sign_extend 32) (currentByte!3418 thiss!1379)) ((_ sign_extend 32) (currentBit!3413 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5275 () Bool)

(assert (= bs!5275 d!21860))

(declare-fun m!109915 () Bool)

(assert (=> bs!5275 m!109915))

(assert (=> b!68704 d!21860))

(declare-fun d!21862 () Bool)

(assert (=> d!21862 (= (bitAt!0 (buf!1722 (_1!3119 lt!109941)) lt!109951) (not (= (bvand ((_ sign_extend 24) (select (arr!1917 (buf!1722 (_1!3119 lt!109941))) ((_ extract 31 0) (bvsdiv lt!109951 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!109951 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5276 () Bool)

(assert (= bs!5276 d!21862))

(declare-fun m!109917 () Bool)

(assert (=> bs!5276 m!109917))

(declare-fun m!109919 () Bool)

(assert (=> bs!5276 m!109919))

(assert (=> b!68703 d!21862))

(declare-fun d!21864 () Bool)

(assert (=> d!21864 (= (bitAt!0 (buf!1722 (_1!3119 lt!109957)) lt!109951) (not (= (bvand ((_ sign_extend 24) (select (arr!1917 (buf!1722 (_1!3119 lt!109957))) ((_ extract 31 0) (bvsdiv lt!109951 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!109951 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5277 () Bool)

(assert (= bs!5277 d!21864))

(declare-fun m!109921 () Bool)

(assert (=> bs!5277 m!109921))

(assert (=> bs!5277 m!109919))

(assert (=> b!68703 d!21864))

(declare-fun d!21866 () Bool)

(assert (=> d!21866 (= (head!540 (byteArrayBitContentToList!0 (_2!3120 lt!109953) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!836 (byteArrayBitContentToList!0 (_2!3120 lt!109953) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!68714 d!21866))

(declare-fun d!21868 () Bool)

(declare-fun c!5061 () Bool)

(assert (=> d!21868 (= c!5061 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!44999 () List!721)

(assert (=> d!21868 (= (byteArrayBitContentToList!0 (_2!3120 lt!109953) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!44999)))

(declare-fun b!68821 () Bool)

(assert (=> b!68821 (= e!44999 Nil!718)))

(declare-fun b!68822 () Bool)

(assert (=> b!68822 (= e!44999 (Cons!717 (not (= (bvand ((_ sign_extend 24) (select (arr!1917 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3120 lt!109953) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!21868 c!5061) b!68821))

(assert (= (and d!21868 (not c!5061)) b!68822))

(assert (=> b!68822 m!109697))

(assert (=> b!68822 m!109899))

(declare-fun m!109923 () Bool)

(assert (=> b!68822 m!109923))

(assert (=> b!68714 d!21868))

(declare-fun d!21870 () Bool)

(assert (=> d!21870 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1917 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5278 () Bool)

(assert (= bs!5278 d!21870))

(assert (=> bs!5278 m!109697))

(assert (=> bs!5278 m!109899))

(assert (=> b!68714 d!21870))

(declare-fun d!21872 () Bool)

(assert (=> d!21872 (validate_offset_bits!1 ((_ sign_extend 32) (size!1341 (buf!1722 (_2!3120 lt!109953)))) ((_ sign_extend 32) (currentByte!3418 thiss!1379)) ((_ sign_extend 32) (currentBit!3413 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!110065 () Unit!4615)

(declare-fun choose!9 (BitStream!2292 array!2892 (_ BitVec 64) BitStream!2292) Unit!4615)

(assert (=> d!21872 (= lt!110065 (choose!9 thiss!1379 (buf!1722 (_2!3120 lt!109953)) (bvsub to!314 i!635) (BitStream!2293 (buf!1722 (_2!3120 lt!109953)) (currentByte!3418 thiss!1379) (currentBit!3413 thiss!1379))))))

(assert (=> d!21872 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1722 (_2!3120 lt!109953)) (bvsub to!314 i!635)) lt!110065)))

(declare-fun bs!5279 () Bool)

(assert (= bs!5279 d!21872))

(assert (=> bs!5279 m!109743))

(declare-fun m!109925 () Bool)

(assert (=> bs!5279 m!109925))

(assert (=> b!68713 d!21872))

(declare-fun b!68833 () Bool)

(declare-fun res!56923 () Bool)

(declare-fun e!45005 () Bool)

(assert (=> b!68833 (=> (not res!56923) (not e!45005))))

(declare-fun lt!110114 () tuple2!6016)

(assert (=> b!68833 (= res!56923 (isPrefixOf!0 (_2!3119 lt!110114) (_2!3120 lt!109953)))))

(declare-fun lt!110111 () (_ BitVec 64))

(declare-fun b!68834 () Bool)

(declare-fun lt!110122 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2292 (_ BitVec 64)) BitStream!2292)

(assert (=> b!68834 (= e!45005 (= (_1!3119 lt!110114) (withMovedBitIndex!0 (_2!3119 lt!110114) (bvsub lt!110122 lt!110111))))))

(assert (=> b!68834 (or (= (bvand lt!110122 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!110111 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!110122 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!110122 lt!110111) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!68834 (= lt!110111 (bitIndex!0 (size!1341 (buf!1722 (_2!3120 lt!109953))) (currentByte!3418 (_2!3120 lt!109953)) (currentBit!3413 (_2!3120 lt!109953))))))

(assert (=> b!68834 (= lt!110122 (bitIndex!0 (size!1341 (buf!1722 thiss!1379)) (currentByte!3418 thiss!1379) (currentBit!3413 thiss!1379)))))

(declare-fun d!21874 () Bool)

(assert (=> d!21874 e!45005))

(declare-fun res!56924 () Bool)

(assert (=> d!21874 (=> (not res!56924) (not e!45005))))

(assert (=> d!21874 (= res!56924 (isPrefixOf!0 (_1!3119 lt!110114) (_2!3119 lt!110114)))))

(declare-fun lt!110117 () BitStream!2292)

(assert (=> d!21874 (= lt!110114 (tuple2!6017 lt!110117 (_2!3120 lt!109953)))))

(declare-fun lt!110120 () Unit!4615)

(declare-fun lt!110107 () Unit!4615)

(assert (=> d!21874 (= lt!110120 lt!110107)))

(assert (=> d!21874 (isPrefixOf!0 lt!110117 (_2!3120 lt!109953))))

(assert (=> d!21874 (= lt!110107 (lemmaIsPrefixTransitive!0 lt!110117 (_2!3120 lt!109953) (_2!3120 lt!109953)))))

(declare-fun lt!110119 () Unit!4615)

(declare-fun lt!110123 () Unit!4615)

(assert (=> d!21874 (= lt!110119 lt!110123)))

(assert (=> d!21874 (isPrefixOf!0 lt!110117 (_2!3120 lt!109953))))

(assert (=> d!21874 (= lt!110123 (lemmaIsPrefixTransitive!0 lt!110117 thiss!1379 (_2!3120 lt!109953)))))

(declare-fun lt!110115 () Unit!4615)

(declare-fun e!45004 () Unit!4615)

(assert (=> d!21874 (= lt!110115 e!45004)))

(declare-fun c!5064 () Bool)

(assert (=> d!21874 (= c!5064 (not (= (size!1341 (buf!1722 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!110108 () Unit!4615)

(declare-fun lt!110109 () Unit!4615)

(assert (=> d!21874 (= lt!110108 lt!110109)))

(assert (=> d!21874 (isPrefixOf!0 (_2!3120 lt!109953) (_2!3120 lt!109953))))

(assert (=> d!21874 (= lt!110109 (lemmaIsPrefixRefl!0 (_2!3120 lt!109953)))))

(declare-fun lt!110124 () Unit!4615)

(declare-fun lt!110118 () Unit!4615)

(assert (=> d!21874 (= lt!110124 lt!110118)))

(assert (=> d!21874 (= lt!110118 (lemmaIsPrefixRefl!0 (_2!3120 lt!109953)))))

(declare-fun lt!110110 () Unit!4615)

(declare-fun lt!110125 () Unit!4615)

(assert (=> d!21874 (= lt!110110 lt!110125)))

(assert (=> d!21874 (isPrefixOf!0 lt!110117 lt!110117)))

(assert (=> d!21874 (= lt!110125 (lemmaIsPrefixRefl!0 lt!110117))))

(declare-fun lt!110112 () Unit!4615)

(declare-fun lt!110121 () Unit!4615)

(assert (=> d!21874 (= lt!110112 lt!110121)))

(assert (=> d!21874 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!21874 (= lt!110121 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!21874 (= lt!110117 (BitStream!2293 (buf!1722 (_2!3120 lt!109953)) (currentByte!3418 thiss!1379) (currentBit!3413 thiss!1379)))))

(assert (=> d!21874 (isPrefixOf!0 thiss!1379 (_2!3120 lt!109953))))

(assert (=> d!21874 (= (reader!0 thiss!1379 (_2!3120 lt!109953)) lt!110114)))

(declare-fun b!68835 () Bool)

(declare-fun res!56925 () Bool)

(assert (=> b!68835 (=> (not res!56925) (not e!45005))))

(assert (=> b!68835 (= res!56925 (isPrefixOf!0 (_1!3119 lt!110114) thiss!1379))))

(declare-fun b!68836 () Bool)

(declare-fun Unit!4619 () Unit!4615)

(assert (=> b!68836 (= e!45004 Unit!4619)))

(declare-fun b!68837 () Bool)

(declare-fun lt!110113 () Unit!4615)

(assert (=> b!68837 (= e!45004 lt!110113)))

(declare-fun lt!110106 () (_ BitVec 64))

(assert (=> b!68837 (= lt!110106 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110116 () (_ BitVec 64))

(assert (=> b!68837 (= lt!110116 (bitIndex!0 (size!1341 (buf!1722 thiss!1379)) (currentByte!3418 thiss!1379) (currentBit!3413 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2892 array!2892 (_ BitVec 64) (_ BitVec 64)) Unit!4615)

(assert (=> b!68837 (= lt!110113 (arrayBitRangesEqSymmetric!0 (buf!1722 thiss!1379) (buf!1722 (_2!3120 lt!109953)) lt!110106 lt!110116))))

(assert (=> b!68837 (arrayBitRangesEq!0 (buf!1722 (_2!3120 lt!109953)) (buf!1722 thiss!1379) lt!110106 lt!110116)))

(assert (= (and d!21874 c!5064) b!68837))

(assert (= (and d!21874 (not c!5064)) b!68836))

(assert (= (and d!21874 res!56924) b!68835))

(assert (= (and b!68835 res!56925) b!68833))

(assert (= (and b!68833 res!56923) b!68834))

(assert (=> b!68837 m!109731))

(declare-fun m!109927 () Bool)

(assert (=> b!68837 m!109927))

(declare-fun m!109929 () Bool)

(assert (=> b!68837 m!109929))

(declare-fun m!109931 () Bool)

(assert (=> b!68833 m!109931))

(declare-fun m!109933 () Bool)

(assert (=> b!68834 m!109933))

(assert (=> b!68834 m!109785))

(assert (=> b!68834 m!109731))

(declare-fun m!109935 () Bool)

(assert (=> d!21874 m!109935))

(declare-fun m!109937 () Bool)

(assert (=> d!21874 m!109937))

(assert (=> d!21874 m!109729))

(declare-fun m!109939 () Bool)

(assert (=> d!21874 m!109939))

(assert (=> d!21874 m!109727))

(declare-fun m!109941 () Bool)

(assert (=> d!21874 m!109941))

(declare-fun m!109943 () Bool)

(assert (=> d!21874 m!109943))

(assert (=> d!21874 m!109769))

(declare-fun m!109945 () Bool)

(assert (=> d!21874 m!109945))

(declare-fun m!109947 () Bool)

(assert (=> d!21874 m!109947))

(declare-fun m!109949 () Bool)

(assert (=> d!21874 m!109949))

(declare-fun m!109951 () Bool)

(assert (=> b!68835 m!109951))

(assert (=> b!68713 d!21874))

(declare-fun d!21876 () Bool)

(assert (=> d!21876 (validate_offset_bits!1 ((_ sign_extend 32) (size!1341 (buf!1722 (_2!3120 lt!109953)))) ((_ sign_extend 32) (currentByte!3418 (_2!3120 lt!109956))) ((_ sign_extend 32) (currentBit!3413 (_2!3120 lt!109956))) lt!109944)))

(declare-fun lt!110126 () Unit!4615)

(assert (=> d!21876 (= lt!110126 (choose!9 (_2!3120 lt!109956) (buf!1722 (_2!3120 lt!109953)) lt!109944 (BitStream!2293 (buf!1722 (_2!3120 lt!109953)) (currentByte!3418 (_2!3120 lt!109956)) (currentBit!3413 (_2!3120 lt!109956)))))))

(assert (=> d!21876 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3120 lt!109956) (buf!1722 (_2!3120 lt!109953)) lt!109944) lt!110126)))

(declare-fun bs!5280 () Bool)

(assert (= bs!5280 d!21876))

(assert (=> bs!5280 m!109757))

(declare-fun m!109953 () Bool)

(assert (=> bs!5280 m!109953))

(assert (=> b!68713 d!21876))

(declare-fun b!68849 () Bool)

(declare-fun e!45011 () Bool)

(declare-fun lt!110135 () List!721)

(assert (=> b!68849 (= e!45011 (> (length!349 lt!110135) 0))))

(declare-fun lt!110134 () (_ BitVec 64))

(declare-datatypes ((tuple2!6028 0))(
  ( (tuple2!6029 (_1!3125 List!721) (_2!3125 BitStream!2292)) )
))
(declare-fun e!45010 () tuple2!6028)

(declare-datatypes ((tuple2!6030 0))(
  ( (tuple2!6031 (_1!3126 Bool) (_2!3126 BitStream!2292)) )
))
(declare-fun lt!110133 () tuple2!6030)

(declare-fun b!68847 () Bool)

(assert (=> b!68847 (= e!45010 (tuple2!6029 (Cons!717 (_1!3126 lt!110133) (bitStreamReadBitsIntoList!0 (_2!3120 lt!109953) (_2!3126 lt!110133) (bvsub lt!109944 lt!110134))) (_2!3126 lt!110133)))))

(declare-fun readBit!0 (BitStream!2292) tuple2!6030)

(assert (=> b!68847 (= lt!110133 (readBit!0 (_1!3119 lt!109941)))))

(assert (=> b!68847 (= lt!110134 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!68848 () Bool)

(declare-fun isEmpty!219 (List!721) Bool)

(assert (=> b!68848 (= e!45011 (isEmpty!219 lt!110135))))

(declare-fun d!21878 () Bool)

(assert (=> d!21878 e!45011))

(declare-fun c!5069 () Bool)

(assert (=> d!21878 (= c!5069 (= lt!109944 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21878 (= lt!110135 (_1!3125 e!45010))))

(declare-fun c!5070 () Bool)

(assert (=> d!21878 (= c!5070 (= lt!109944 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21878 (bvsge lt!109944 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21878 (= (bitStreamReadBitsIntoList!0 (_2!3120 lt!109953) (_1!3119 lt!109941) lt!109944) lt!110135)))

(declare-fun b!68846 () Bool)

(assert (=> b!68846 (= e!45010 (tuple2!6029 Nil!718 (_1!3119 lt!109941)))))

(assert (= (and d!21878 c!5070) b!68846))

(assert (= (and d!21878 (not c!5070)) b!68847))

(assert (= (and d!21878 c!5069) b!68848))

(assert (= (and d!21878 (not c!5069)) b!68849))

(declare-fun m!109955 () Bool)

(assert (=> b!68849 m!109955))

(declare-fun m!109957 () Bool)

(assert (=> b!68847 m!109957))

(declare-fun m!109959 () Bool)

(assert (=> b!68847 m!109959))

(declare-fun m!109961 () Bool)

(assert (=> b!68848 m!109961))

(assert (=> b!68713 d!21878))

(declare-fun d!21880 () Bool)

(assert (=> d!21880 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1341 (buf!1722 (_2!3120 lt!109953)))) ((_ sign_extend 32) (currentByte!3418 (_2!3120 lt!109956))) ((_ sign_extend 32) (currentBit!3413 (_2!3120 lt!109956))) lt!109944) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1341 (buf!1722 (_2!3120 lt!109953)))) ((_ sign_extend 32) (currentByte!3418 (_2!3120 lt!109956))) ((_ sign_extend 32) (currentBit!3413 (_2!3120 lt!109956)))) lt!109944))))

(declare-fun bs!5281 () Bool)

(assert (= bs!5281 d!21880))

(declare-fun m!109963 () Bool)

(assert (=> bs!5281 m!109963))

(assert (=> b!68713 d!21880))

(declare-fun b!68853 () Bool)

(declare-fun e!45013 () Bool)

(declare-fun lt!110138 () List!721)

(assert (=> b!68853 (= e!45013 (> (length!349 lt!110138) 0))))

(declare-fun lt!110137 () (_ BitVec 64))

(declare-fun b!68851 () Bool)

(declare-fun lt!110136 () tuple2!6030)

(declare-fun e!45012 () tuple2!6028)

(assert (=> b!68851 (= e!45012 (tuple2!6029 (Cons!717 (_1!3126 lt!110136) (bitStreamReadBitsIntoList!0 (_2!3120 lt!109953) (_2!3126 lt!110136) (bvsub (bvsub to!314 i!635) lt!110137))) (_2!3126 lt!110136)))))

(assert (=> b!68851 (= lt!110136 (readBit!0 (_1!3119 lt!109957)))))

(assert (=> b!68851 (= lt!110137 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!68852 () Bool)

(assert (=> b!68852 (= e!45013 (isEmpty!219 lt!110138))))

(declare-fun d!21884 () Bool)

(assert (=> d!21884 e!45013))

(declare-fun c!5071 () Bool)

(assert (=> d!21884 (= c!5071 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21884 (= lt!110138 (_1!3125 e!45012))))

(declare-fun c!5072 () Bool)

(assert (=> d!21884 (= c!5072 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21884 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21884 (= (bitStreamReadBitsIntoList!0 (_2!3120 lt!109953) (_1!3119 lt!109957) (bvsub to!314 i!635)) lt!110138)))

(declare-fun b!68850 () Bool)

(assert (=> b!68850 (= e!45012 (tuple2!6029 Nil!718 (_1!3119 lt!109957)))))

(assert (= (and d!21884 c!5072) b!68850))

(assert (= (and d!21884 (not c!5072)) b!68851))

(assert (= (and d!21884 c!5071) b!68852))

(assert (= (and d!21884 (not c!5071)) b!68853))

(declare-fun m!109965 () Bool)

(assert (=> b!68853 m!109965))

(declare-fun m!109967 () Bool)

(assert (=> b!68851 m!109967))

(declare-fun m!109969 () Bool)

(assert (=> b!68851 m!109969))

(declare-fun m!109971 () Bool)

(assert (=> b!68852 m!109971))

(assert (=> b!68713 d!21884))

(declare-fun d!21886 () Bool)

(assert (=> d!21886 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1341 (buf!1722 (_2!3120 lt!109953)))) ((_ sign_extend 32) (currentByte!3418 thiss!1379)) ((_ sign_extend 32) (currentBit!3413 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1341 (buf!1722 (_2!3120 lt!109953)))) ((_ sign_extend 32) (currentByte!3418 thiss!1379)) ((_ sign_extend 32) (currentBit!3413 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5282 () Bool)

(assert (= bs!5282 d!21886))

(declare-fun m!109973 () Bool)

(assert (=> bs!5282 m!109973))

(assert (=> b!68713 d!21886))

(declare-fun b!68854 () Bool)

(declare-fun res!56926 () Bool)

(declare-fun e!45015 () Bool)

(assert (=> b!68854 (=> (not res!56926) (not e!45015))))

(declare-fun lt!110147 () tuple2!6016)

(assert (=> b!68854 (= res!56926 (isPrefixOf!0 (_2!3119 lt!110147) (_2!3120 lt!109953)))))

(declare-fun lt!110144 () (_ BitVec 64))

(declare-fun b!68855 () Bool)

(declare-fun lt!110155 () (_ BitVec 64))

(assert (=> b!68855 (= e!45015 (= (_1!3119 lt!110147) (withMovedBitIndex!0 (_2!3119 lt!110147) (bvsub lt!110155 lt!110144))))))

(assert (=> b!68855 (or (= (bvand lt!110155 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!110144 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!110155 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!110155 lt!110144) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!68855 (= lt!110144 (bitIndex!0 (size!1341 (buf!1722 (_2!3120 lt!109953))) (currentByte!3418 (_2!3120 lt!109953)) (currentBit!3413 (_2!3120 lt!109953))))))

(assert (=> b!68855 (= lt!110155 (bitIndex!0 (size!1341 (buf!1722 (_2!3120 lt!109956))) (currentByte!3418 (_2!3120 lt!109956)) (currentBit!3413 (_2!3120 lt!109956))))))

(declare-fun d!21888 () Bool)

(assert (=> d!21888 e!45015))

(declare-fun res!56927 () Bool)

(assert (=> d!21888 (=> (not res!56927) (not e!45015))))

(assert (=> d!21888 (= res!56927 (isPrefixOf!0 (_1!3119 lt!110147) (_2!3119 lt!110147)))))

(declare-fun lt!110150 () BitStream!2292)

(assert (=> d!21888 (= lt!110147 (tuple2!6017 lt!110150 (_2!3120 lt!109953)))))

(declare-fun lt!110153 () Unit!4615)

(declare-fun lt!110140 () Unit!4615)

(assert (=> d!21888 (= lt!110153 lt!110140)))

(assert (=> d!21888 (isPrefixOf!0 lt!110150 (_2!3120 lt!109953))))

(assert (=> d!21888 (= lt!110140 (lemmaIsPrefixTransitive!0 lt!110150 (_2!3120 lt!109953) (_2!3120 lt!109953)))))

(declare-fun lt!110152 () Unit!4615)

(declare-fun lt!110156 () Unit!4615)

(assert (=> d!21888 (= lt!110152 lt!110156)))

(assert (=> d!21888 (isPrefixOf!0 lt!110150 (_2!3120 lt!109953))))

(assert (=> d!21888 (= lt!110156 (lemmaIsPrefixTransitive!0 lt!110150 (_2!3120 lt!109956) (_2!3120 lt!109953)))))

(declare-fun lt!110148 () Unit!4615)

(declare-fun e!45014 () Unit!4615)

(assert (=> d!21888 (= lt!110148 e!45014)))

(declare-fun c!5073 () Bool)

(assert (=> d!21888 (= c!5073 (not (= (size!1341 (buf!1722 (_2!3120 lt!109956))) #b00000000000000000000000000000000)))))

(declare-fun lt!110141 () Unit!4615)

(declare-fun lt!110142 () Unit!4615)

(assert (=> d!21888 (= lt!110141 lt!110142)))

(assert (=> d!21888 (isPrefixOf!0 (_2!3120 lt!109953) (_2!3120 lt!109953))))

(assert (=> d!21888 (= lt!110142 (lemmaIsPrefixRefl!0 (_2!3120 lt!109953)))))

(declare-fun lt!110157 () Unit!4615)

(declare-fun lt!110151 () Unit!4615)

(assert (=> d!21888 (= lt!110157 lt!110151)))

(assert (=> d!21888 (= lt!110151 (lemmaIsPrefixRefl!0 (_2!3120 lt!109953)))))

(declare-fun lt!110143 () Unit!4615)

(declare-fun lt!110158 () Unit!4615)

(assert (=> d!21888 (= lt!110143 lt!110158)))

(assert (=> d!21888 (isPrefixOf!0 lt!110150 lt!110150)))

(assert (=> d!21888 (= lt!110158 (lemmaIsPrefixRefl!0 lt!110150))))

(declare-fun lt!110145 () Unit!4615)

(declare-fun lt!110154 () Unit!4615)

(assert (=> d!21888 (= lt!110145 lt!110154)))

(assert (=> d!21888 (isPrefixOf!0 (_2!3120 lt!109956) (_2!3120 lt!109956))))

(assert (=> d!21888 (= lt!110154 (lemmaIsPrefixRefl!0 (_2!3120 lt!109956)))))

(assert (=> d!21888 (= lt!110150 (BitStream!2293 (buf!1722 (_2!3120 lt!109953)) (currentByte!3418 (_2!3120 lt!109956)) (currentBit!3413 (_2!3120 lt!109956))))))

(assert (=> d!21888 (isPrefixOf!0 (_2!3120 lt!109956) (_2!3120 lt!109953))))

(assert (=> d!21888 (= (reader!0 (_2!3120 lt!109956) (_2!3120 lt!109953)) lt!110147)))

(declare-fun b!68856 () Bool)

(declare-fun res!56928 () Bool)

(assert (=> b!68856 (=> (not res!56928) (not e!45015))))

(assert (=> b!68856 (= res!56928 (isPrefixOf!0 (_1!3119 lt!110147) (_2!3120 lt!109956)))))

(declare-fun b!68857 () Bool)

(declare-fun Unit!4620 () Unit!4615)

(assert (=> b!68857 (= e!45014 Unit!4620)))

(declare-fun b!68858 () Bool)

(declare-fun lt!110146 () Unit!4615)

(assert (=> b!68858 (= e!45014 lt!110146)))

(declare-fun lt!110139 () (_ BitVec 64))

(assert (=> b!68858 (= lt!110139 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110149 () (_ BitVec 64))

(assert (=> b!68858 (= lt!110149 (bitIndex!0 (size!1341 (buf!1722 (_2!3120 lt!109956))) (currentByte!3418 (_2!3120 lt!109956)) (currentBit!3413 (_2!3120 lt!109956))))))

(assert (=> b!68858 (= lt!110146 (arrayBitRangesEqSymmetric!0 (buf!1722 (_2!3120 lt!109956)) (buf!1722 (_2!3120 lt!109953)) lt!110139 lt!110149))))

(assert (=> b!68858 (arrayBitRangesEq!0 (buf!1722 (_2!3120 lt!109953)) (buf!1722 (_2!3120 lt!109956)) lt!110139 lt!110149)))

(assert (= (and d!21888 c!5073) b!68858))

(assert (= (and d!21888 (not c!5073)) b!68857))

(assert (= (and d!21888 res!56927) b!68856))

(assert (= (and b!68856 res!56928) b!68854))

(assert (= (and b!68854 res!56926) b!68855))

(assert (=> b!68858 m!109695))

(declare-fun m!109975 () Bool)

(assert (=> b!68858 m!109975))

(declare-fun m!109977 () Bool)

(assert (=> b!68858 m!109977))

(declare-fun m!109979 () Bool)

(assert (=> b!68854 m!109979))

(declare-fun m!109981 () Bool)

(assert (=> b!68855 m!109981))

(assert (=> b!68855 m!109785))

(assert (=> b!68855 m!109695))

(declare-fun m!109983 () Bool)

(assert (=> d!21888 m!109983))

(declare-fun m!109985 () Bool)

(assert (=> d!21888 m!109985))

(declare-fun m!109987 () Bool)

(assert (=> d!21888 m!109987))

(declare-fun m!109989 () Bool)

(assert (=> d!21888 m!109989))

(declare-fun m!109991 () Bool)

(assert (=> d!21888 m!109991))

(declare-fun m!109993 () Bool)

(assert (=> d!21888 m!109993))

(declare-fun m!109995 () Bool)

(assert (=> d!21888 m!109995))

(assert (=> d!21888 m!109771))

(declare-fun m!109997 () Bool)

(assert (=> d!21888 m!109997))

(assert (=> d!21888 m!109947))

(assert (=> d!21888 m!109949))

(declare-fun m!109999 () Bool)

(assert (=> b!68856 m!109999))

(assert (=> b!68713 d!21888))

(declare-fun d!21892 () Bool)

(declare-fun size!1343 (List!721) Int)

(assert (=> d!21892 (= (length!349 lt!109948) (size!1343 lt!109948))))

(declare-fun bs!5284 () Bool)

(assert (= bs!5284 d!21892))

(declare-fun m!110003 () Bool)

(assert (=> bs!5284 m!110003))

(assert (=> b!68712 d!21892))

(declare-fun d!21896 () Bool)

(assert (=> d!21896 (= (bitAt!0 (buf!1722 (_2!3120 lt!109956)) lt!109951) (not (= (bvand ((_ sign_extend 24) (select (arr!1917 (buf!1722 (_2!3120 lt!109956))) ((_ extract 31 0) (bvsdiv lt!109951 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!109951 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5285 () Bool)

(assert (= bs!5285 d!21896))

(declare-fun m!110005 () Bool)

(assert (=> bs!5285 m!110005))

(assert (=> bs!5285 m!109919))

(assert (=> b!68711 d!21896))

(declare-fun d!21898 () Bool)

(assert (=> d!21898 (= (head!540 (byteArrayBitContentToList!0 (_2!3120 lt!109956) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!836 (byteArrayBitContentToList!0 (_2!3120 lt!109956) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!68700 d!21898))

(declare-fun d!21900 () Bool)

(declare-fun c!5074 () Bool)

(assert (=> d!21900 (= c!5074 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!45016 () List!721)

(assert (=> d!21900 (= (byteArrayBitContentToList!0 (_2!3120 lt!109956) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!45016)))

(declare-fun b!68859 () Bool)

(assert (=> b!68859 (= e!45016 Nil!718)))

(declare-fun b!68860 () Bool)

(assert (=> b!68860 (= e!45016 (Cons!717 (not (= (bvand ((_ sign_extend 24) (select (arr!1917 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3120 lt!109956) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!21900 c!5074) b!68859))

(assert (= (and d!21900 (not c!5074)) b!68860))

(assert (=> b!68860 m!109697))

(assert (=> b!68860 m!109899))

(declare-fun m!110007 () Bool)

(assert (=> b!68860 m!110007))

(assert (=> b!68700 d!21900))

(declare-fun d!21902 () Bool)

(assert (=> d!21902 (= (head!540 (bitStreamReadBitsIntoList!0 (_2!3120 lt!109956) (_1!3119 lt!109960) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!836 (bitStreamReadBitsIntoList!0 (_2!3120 lt!109956) (_1!3119 lt!109960) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!68700 d!21902))

(declare-fun b!68864 () Bool)

(declare-fun e!45018 () Bool)

(declare-fun lt!110161 () List!721)

(assert (=> b!68864 (= e!45018 (> (length!349 lt!110161) 0))))

(declare-fun e!45017 () tuple2!6028)

(declare-fun lt!110159 () tuple2!6030)

(declare-fun b!68862 () Bool)

(declare-fun lt!110160 () (_ BitVec 64))

(assert (=> b!68862 (= e!45017 (tuple2!6029 (Cons!717 (_1!3126 lt!110159) (bitStreamReadBitsIntoList!0 (_2!3120 lt!109956) (_2!3126 lt!110159) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!110160))) (_2!3126 lt!110159)))))

(assert (=> b!68862 (= lt!110159 (readBit!0 (_1!3119 lt!109960)))))

(assert (=> b!68862 (= lt!110160 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!68863 () Bool)

(assert (=> b!68863 (= e!45018 (isEmpty!219 lt!110161))))

(declare-fun d!21904 () Bool)

(assert (=> d!21904 e!45018))

(declare-fun c!5075 () Bool)

(assert (=> d!21904 (= c!5075 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21904 (= lt!110161 (_1!3125 e!45017))))

(declare-fun c!5076 () Bool)

(assert (=> d!21904 (= c!5076 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21904 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21904 (= (bitStreamReadBitsIntoList!0 (_2!3120 lt!109956) (_1!3119 lt!109960) #b0000000000000000000000000000000000000000000000000000000000000001) lt!110161)))

(declare-fun b!68861 () Bool)

(assert (=> b!68861 (= e!45017 (tuple2!6029 Nil!718 (_1!3119 lt!109960)))))

(assert (= (and d!21904 c!5076) b!68861))

(assert (= (and d!21904 (not c!5076)) b!68862))

(assert (= (and d!21904 c!5075) b!68863))

(assert (= (and d!21904 (not c!5075)) b!68864))

(declare-fun m!110009 () Bool)

(assert (=> b!68864 m!110009))

(declare-fun m!110011 () Bool)

(assert (=> b!68862 m!110011))

(declare-fun m!110013 () Bool)

(assert (=> b!68862 m!110013))

(declare-fun m!110015 () Bool)

(assert (=> b!68863 m!110015))

(assert (=> b!68700 d!21904))

(declare-fun d!21906 () Bool)

(assert (=> d!21906 (= (array_inv!1205 srcBuffer!2) (bvsge (size!1341 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!13394 d!21906))

(declare-fun d!21908 () Bool)

(assert (=> d!21908 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3413 thiss!1379) (currentByte!3418 thiss!1379) (size!1341 (buf!1722 thiss!1379))))))

(declare-fun bs!5286 () Bool)

(assert (= bs!5286 d!21908))

(declare-fun m!110017 () Bool)

(assert (=> bs!5286 m!110017))

(assert (=> start!13394 d!21908))

(declare-fun d!21910 () Bool)

(assert (=> d!21910 (= (head!540 lt!109948) (h!836 lt!109948))))

(assert (=> b!68710 d!21910))

(declare-fun d!21912 () Bool)

(assert (=> d!21912 (= (tail!325 lt!109948) (t!1471 lt!109948))))

(assert (=> b!68709 d!21912))

(declare-fun d!21914 () Bool)

(declare-fun e!45023 () Bool)

(assert (=> d!21914 e!45023))

(declare-fun res!56935 () Bool)

(assert (=> d!21914 (=> (not res!56935) (not e!45023))))

(declare-fun lt!110179 () (_ BitVec 64))

(assert (=> d!21914 (= res!56935 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!110179 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!110179) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!21914 (= lt!110179 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!110178 () Unit!4615)

(declare-fun choose!42 (BitStream!2292 BitStream!2292 BitStream!2292 BitStream!2292 (_ BitVec 64) List!721) Unit!4615)

(assert (=> d!21914 (= lt!110178 (choose!42 (_2!3120 lt!109953) (_2!3120 lt!109953) (_1!3119 lt!109957) (_1!3119 lt!109941) (bvsub to!314 i!635) lt!109948))))

(assert (=> d!21914 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21914 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3120 lt!109953) (_2!3120 lt!109953) (_1!3119 lt!109957) (_1!3119 lt!109941) (bvsub to!314 i!635) lt!109948) lt!110178)))

(declare-fun b!68871 () Bool)

(assert (=> b!68871 (= e!45023 (= (bitStreamReadBitsIntoList!0 (_2!3120 lt!109953) (_1!3119 lt!109941) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!325 lt!109948)))))

(assert (= (and d!21914 res!56935) b!68871))

(declare-fun m!110019 () Bool)

(assert (=> d!21914 m!110019))

(declare-fun m!110021 () Bool)

(assert (=> b!68871 m!110021))

(assert (=> b!68871 m!109717))

(assert (=> b!68709 d!21914))

(declare-fun d!21916 () Bool)

(declare-fun e!45029 () Bool)

(assert (=> d!21916 e!45029))

(declare-fun res!56942 () Bool)

(assert (=> d!21916 (=> (not res!56942) (not e!45029))))

(declare-fun lt!110209 () (_ BitVec 64))

(declare-fun lt!110206 () (_ BitVec 64))

(declare-fun lt!110208 () (_ BitVec 64))

(assert (=> d!21916 (= res!56942 (= lt!110208 (bvsub lt!110206 lt!110209)))))

(assert (=> d!21916 (or (= (bvand lt!110206 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!110209 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!110206 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!110206 lt!110209) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!21916 (= lt!110209 (remainingBits!0 ((_ sign_extend 32) (size!1341 (buf!1722 (_2!3120 lt!109953)))) ((_ sign_extend 32) (currentByte!3418 (_2!3120 lt!109953))) ((_ sign_extend 32) (currentBit!3413 (_2!3120 lt!109953)))))))

(declare-fun lt!110205 () (_ BitVec 64))

(declare-fun lt!110207 () (_ BitVec 64))

(assert (=> d!21916 (= lt!110206 (bvmul lt!110205 lt!110207))))

(assert (=> d!21916 (or (= lt!110205 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!110207 (bvsdiv (bvmul lt!110205 lt!110207) lt!110205)))))

(assert (=> d!21916 (= lt!110207 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!21916 (= lt!110205 ((_ sign_extend 32) (size!1341 (buf!1722 (_2!3120 lt!109953)))))))

(assert (=> d!21916 (= lt!110208 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3418 (_2!3120 lt!109953))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3413 (_2!3120 lt!109953)))))))

(assert (=> d!21916 (invariant!0 (currentBit!3413 (_2!3120 lt!109953)) (currentByte!3418 (_2!3120 lt!109953)) (size!1341 (buf!1722 (_2!3120 lt!109953))))))

(assert (=> d!21916 (= (bitIndex!0 (size!1341 (buf!1722 (_2!3120 lt!109953))) (currentByte!3418 (_2!3120 lt!109953)) (currentBit!3413 (_2!3120 lt!109953))) lt!110208)))

(declare-fun b!68882 () Bool)

(declare-fun res!56943 () Bool)

(assert (=> b!68882 (=> (not res!56943) (not e!45029))))

(assert (=> b!68882 (= res!56943 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!110208))))

(declare-fun b!68883 () Bool)

(declare-fun lt!110204 () (_ BitVec 64))

(assert (=> b!68883 (= e!45029 (bvsle lt!110208 (bvmul lt!110204 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!68883 (or (= lt!110204 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!110204 #b0000000000000000000000000000000000000000000000000000000000001000) lt!110204)))))

(assert (=> b!68883 (= lt!110204 ((_ sign_extend 32) (size!1341 (buf!1722 (_2!3120 lt!109953)))))))

(assert (= (and d!21916 res!56942) b!68882))

(assert (= (and b!68882 res!56943) b!68883))

(declare-fun m!110025 () Bool)

(assert (=> d!21916 m!110025))

(assert (=> d!21916 m!109707))

(assert (=> b!68719 d!21916))

(declare-fun d!21922 () Bool)

(declare-fun e!45032 () Bool)

(assert (=> d!21922 e!45032))

(declare-fun res!56944 () Bool)

(assert (=> d!21922 (=> (not res!56944) (not e!45032))))

(declare-fun lt!110212 () (_ BitVec 64))

(declare-fun lt!110215 () (_ BitVec 64))

(declare-fun lt!110214 () (_ BitVec 64))

(assert (=> d!21922 (= res!56944 (= lt!110214 (bvsub lt!110212 lt!110215)))))

(assert (=> d!21922 (or (= (bvand lt!110212 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!110215 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!110212 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!110212 lt!110215) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!21922 (= lt!110215 (remainingBits!0 ((_ sign_extend 32) (size!1341 (buf!1722 (_2!3120 lt!109956)))) ((_ sign_extend 32) (currentByte!3418 (_2!3120 lt!109956))) ((_ sign_extend 32) (currentBit!3413 (_2!3120 lt!109956)))))))

(declare-fun lt!110211 () (_ BitVec 64))

(declare-fun lt!110213 () (_ BitVec 64))

(assert (=> d!21922 (= lt!110212 (bvmul lt!110211 lt!110213))))

(assert (=> d!21922 (or (= lt!110211 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!110213 (bvsdiv (bvmul lt!110211 lt!110213) lt!110211)))))

(assert (=> d!21922 (= lt!110213 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!21922 (= lt!110211 ((_ sign_extend 32) (size!1341 (buf!1722 (_2!3120 lt!109956)))))))

(assert (=> d!21922 (= lt!110214 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3418 (_2!3120 lt!109956))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3413 (_2!3120 lt!109956)))))))

(assert (=> d!21922 (invariant!0 (currentBit!3413 (_2!3120 lt!109956)) (currentByte!3418 (_2!3120 lt!109956)) (size!1341 (buf!1722 (_2!3120 lt!109956))))))

(assert (=> d!21922 (= (bitIndex!0 (size!1341 (buf!1722 (_2!3120 lt!109956))) (currentByte!3418 (_2!3120 lt!109956)) (currentBit!3413 (_2!3120 lt!109956))) lt!110214)))

(declare-fun b!68888 () Bool)

(declare-fun res!56945 () Bool)

(assert (=> b!68888 (=> (not res!56945) (not e!45032))))

(assert (=> b!68888 (= res!56945 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!110214))))

(declare-fun b!68889 () Bool)

(declare-fun lt!110210 () (_ BitVec 64))

(assert (=> b!68889 (= e!45032 (bvsle lt!110214 (bvmul lt!110210 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!68889 (or (= lt!110210 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!110210 #b0000000000000000000000000000000000000000000000000000000000001000) lt!110210)))))

(assert (=> b!68889 (= lt!110210 ((_ sign_extend 32) (size!1341 (buf!1722 (_2!3120 lt!109956)))))))

(assert (= (and d!21922 res!56944) b!68888))

(assert (= (and b!68888 res!56945) b!68889))

(assert (=> d!21922 m!109881))

(assert (=> d!21922 m!109779))

(assert (=> b!68708 d!21922))

(declare-fun d!21924 () Bool)

(declare-fun res!56946 () Bool)

(declare-fun e!45033 () Bool)

(assert (=> d!21924 (=> (not res!56946) (not e!45033))))

(assert (=> d!21924 (= res!56946 (= (size!1341 (buf!1722 thiss!1379)) (size!1341 (buf!1722 thiss!1379))))))

(assert (=> d!21924 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!45033)))

(declare-fun b!68890 () Bool)

(declare-fun res!56947 () Bool)

(assert (=> b!68890 (=> (not res!56947) (not e!45033))))

(assert (=> b!68890 (= res!56947 (bvsle (bitIndex!0 (size!1341 (buf!1722 thiss!1379)) (currentByte!3418 thiss!1379) (currentBit!3413 thiss!1379)) (bitIndex!0 (size!1341 (buf!1722 thiss!1379)) (currentByte!3418 thiss!1379) (currentBit!3413 thiss!1379))))))

(declare-fun b!68891 () Bool)

(declare-fun e!45034 () Bool)

(assert (=> b!68891 (= e!45033 e!45034)))

(declare-fun res!56948 () Bool)

(assert (=> b!68891 (=> res!56948 e!45034)))

(assert (=> b!68891 (= res!56948 (= (size!1341 (buf!1722 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!68892 () Bool)

(assert (=> b!68892 (= e!45034 (arrayBitRangesEq!0 (buf!1722 thiss!1379) (buf!1722 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1341 (buf!1722 thiss!1379)) (currentByte!3418 thiss!1379) (currentBit!3413 thiss!1379))))))

(assert (= (and d!21924 res!56946) b!68890))

(assert (= (and b!68890 res!56947) b!68891))

(assert (= (and b!68891 (not res!56948)) b!68892))

(assert (=> b!68890 m!109731))

(assert (=> b!68890 m!109731))

(assert (=> b!68892 m!109731))

(assert (=> b!68892 m!109731))

(declare-fun m!110027 () Bool)

(assert (=> b!68892 m!110027))

(assert (=> b!68707 d!21924))

(declare-fun d!21926 () Bool)

(assert (=> d!21926 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!110221 () Unit!4615)

(declare-fun choose!11 (BitStream!2292) Unit!4615)

(assert (=> d!21926 (= lt!110221 (choose!11 thiss!1379))))

(assert (=> d!21926 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!110221)))

(declare-fun bs!5288 () Bool)

(assert (= bs!5288 d!21926))

(assert (=> bs!5288 m!109727))

(declare-fun m!110037 () Bool)

(assert (=> bs!5288 m!110037))

(assert (=> b!68707 d!21926))

(declare-fun d!21930 () Bool)

(declare-fun e!45037 () Bool)

(assert (=> d!21930 e!45037))

(declare-fun res!56949 () Bool)

(assert (=> d!21930 (=> (not res!56949) (not e!45037))))

(declare-fun lt!110228 () (_ BitVec 64))

(declare-fun lt!110226 () (_ BitVec 64))

(declare-fun lt!110229 () (_ BitVec 64))

(assert (=> d!21930 (= res!56949 (= lt!110228 (bvsub lt!110226 lt!110229)))))

(assert (=> d!21930 (or (= (bvand lt!110226 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!110229 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!110226 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!110226 lt!110229) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!21930 (= lt!110229 (remainingBits!0 ((_ sign_extend 32) (size!1341 (buf!1722 thiss!1379))) ((_ sign_extend 32) (currentByte!3418 thiss!1379)) ((_ sign_extend 32) (currentBit!3413 thiss!1379))))))

(declare-fun lt!110225 () (_ BitVec 64))

(declare-fun lt!110227 () (_ BitVec 64))

(assert (=> d!21930 (= lt!110226 (bvmul lt!110225 lt!110227))))

(assert (=> d!21930 (or (= lt!110225 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!110227 (bvsdiv (bvmul lt!110225 lt!110227) lt!110225)))))

(assert (=> d!21930 (= lt!110227 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!21930 (= lt!110225 ((_ sign_extend 32) (size!1341 (buf!1722 thiss!1379))))))

(assert (=> d!21930 (= lt!110228 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3418 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3413 thiss!1379))))))

(assert (=> d!21930 (invariant!0 (currentBit!3413 thiss!1379) (currentByte!3418 thiss!1379) (size!1341 (buf!1722 thiss!1379)))))

(assert (=> d!21930 (= (bitIndex!0 (size!1341 (buf!1722 thiss!1379)) (currentByte!3418 thiss!1379) (currentBit!3413 thiss!1379)) lt!110228)))

(declare-fun b!68897 () Bool)

(declare-fun res!56950 () Bool)

(assert (=> b!68897 (=> (not res!56950) (not e!45037))))

(assert (=> b!68897 (= res!56950 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!110228))))

(declare-fun b!68898 () Bool)

(declare-fun lt!110224 () (_ BitVec 64))

(assert (=> b!68898 (= e!45037 (bvsle lt!110228 (bvmul lt!110224 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!68898 (or (= lt!110224 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!110224 #b0000000000000000000000000000000000000000000000000000000000001000) lt!110224)))))

(assert (=> b!68898 (= lt!110224 ((_ sign_extend 32) (size!1341 (buf!1722 thiss!1379))))))

(assert (= (and d!21930 res!56949) b!68897))

(assert (= (and b!68897 res!56950) b!68898))

(assert (=> d!21930 m!109915))

(assert (=> d!21930 m!110017))

(assert (=> b!68707 d!21930))

(declare-fun call!887 () tuple2!6016)

(declare-fun c!5104 () Bool)

(declare-fun bm!884 () Bool)

(declare-fun lt!110626 () tuple2!6018)

(assert (=> bm!884 (= call!887 (reader!0 (_2!3120 lt!109956) (ite c!5104 (_2!3120 lt!110626) (_2!3120 lt!109956))))))

(declare-fun b!69007 () Bool)

(declare-fun e!45087 () tuple2!6018)

(declare-fun lt!110619 () tuple2!6018)

(declare-fun Unit!4621 () Unit!4615)

(assert (=> b!69007 (= e!45087 (tuple2!6019 Unit!4621 (_2!3120 lt!110619)))))

(assert (=> b!69007 (= lt!110626 (appendBitFromByte!0 (_2!3120 lt!109956) (select (arr!1917 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!110647 () (_ BitVec 64))

(assert (=> b!69007 (= lt!110647 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!110650 () (_ BitVec 64))

(assert (=> b!69007 (= lt!110650 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!110639 () Unit!4615)

(assert (=> b!69007 (= lt!110639 (validateOffsetBitsIneqLemma!0 (_2!3120 lt!109956) (_2!3120 lt!110626) lt!110647 lt!110650))))

(assert (=> b!69007 (validate_offset_bits!1 ((_ sign_extend 32) (size!1341 (buf!1722 (_2!3120 lt!110626)))) ((_ sign_extend 32) (currentByte!3418 (_2!3120 lt!110626))) ((_ sign_extend 32) (currentBit!3413 (_2!3120 lt!110626))) (bvsub lt!110647 lt!110650))))

(declare-fun lt!110644 () Unit!4615)

(assert (=> b!69007 (= lt!110644 lt!110639)))

(declare-fun lt!110648 () tuple2!6016)

(assert (=> b!69007 (= lt!110648 call!887)))

(declare-fun lt!110627 () (_ BitVec 64))

(assert (=> b!69007 (= lt!110627 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!110649 () Unit!4615)

(assert (=> b!69007 (= lt!110649 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3120 lt!109956) (buf!1722 (_2!3120 lt!110626)) lt!110627))))

(assert (=> b!69007 (validate_offset_bits!1 ((_ sign_extend 32) (size!1341 (buf!1722 (_2!3120 lt!110626)))) ((_ sign_extend 32) (currentByte!3418 (_2!3120 lt!109956))) ((_ sign_extend 32) (currentBit!3413 (_2!3120 lt!109956))) lt!110627)))

(declare-fun lt!110652 () Unit!4615)

(assert (=> b!69007 (= lt!110652 lt!110649)))

(assert (=> b!69007 (= (head!540 (byteArrayBitContentToList!0 (_2!3120 lt!110626) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!540 (bitStreamReadBitsIntoList!0 (_2!3120 lt!110626) (_1!3119 lt!110648) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!110651 () Unit!4615)

(declare-fun Unit!4622 () Unit!4615)

(assert (=> b!69007 (= lt!110651 Unit!4622)))

(assert (=> b!69007 (= lt!110619 (appendBitsMSBFirstLoop!0 (_2!3120 lt!110626) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!110621 () Unit!4615)

(assert (=> b!69007 (= lt!110621 (lemmaIsPrefixTransitive!0 (_2!3120 lt!109956) (_2!3120 lt!110626) (_2!3120 lt!110619)))))

(assert (=> b!69007 (isPrefixOf!0 (_2!3120 lt!109956) (_2!3120 lt!110619))))

(declare-fun lt!110622 () Unit!4615)

(assert (=> b!69007 (= lt!110622 lt!110621)))

(assert (=> b!69007 (= (size!1341 (buf!1722 (_2!3120 lt!110619))) (size!1341 (buf!1722 (_2!3120 lt!109956))))))

(declare-fun lt!110654 () Unit!4615)

(declare-fun Unit!4623 () Unit!4615)

(assert (=> b!69007 (= lt!110654 Unit!4623)))

(assert (=> b!69007 (= (bitIndex!0 (size!1341 (buf!1722 (_2!3120 lt!110619))) (currentByte!3418 (_2!3120 lt!110619)) (currentBit!3413 (_2!3120 lt!110619))) (bvsub (bvadd (bitIndex!0 (size!1341 (buf!1722 (_2!3120 lt!109956))) (currentByte!3418 (_2!3120 lt!109956)) (currentBit!3413 (_2!3120 lt!109956))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!110636 () Unit!4615)

(declare-fun Unit!4624 () Unit!4615)

(assert (=> b!69007 (= lt!110636 Unit!4624)))

(assert (=> b!69007 (= (bitIndex!0 (size!1341 (buf!1722 (_2!3120 lt!110619))) (currentByte!3418 (_2!3120 lt!110619)) (currentBit!3413 (_2!3120 lt!110619))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1341 (buf!1722 (_2!3120 lt!110626))) (currentByte!3418 (_2!3120 lt!110626)) (currentBit!3413 (_2!3120 lt!110626))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!110645 () Unit!4615)

(declare-fun Unit!4625 () Unit!4615)

(assert (=> b!69007 (= lt!110645 Unit!4625)))

(declare-fun lt!110638 () tuple2!6016)

(assert (=> b!69007 (= lt!110638 (reader!0 (_2!3120 lt!109956) (_2!3120 lt!110619)))))

(declare-fun lt!110646 () (_ BitVec 64))

(assert (=> b!69007 (= lt!110646 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!110620 () Unit!4615)

(assert (=> b!69007 (= lt!110620 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3120 lt!109956) (buf!1722 (_2!3120 lt!110619)) lt!110646))))

(assert (=> b!69007 (validate_offset_bits!1 ((_ sign_extend 32) (size!1341 (buf!1722 (_2!3120 lt!110619)))) ((_ sign_extend 32) (currentByte!3418 (_2!3120 lt!109956))) ((_ sign_extend 32) (currentBit!3413 (_2!3120 lt!109956))) lt!110646)))

(declare-fun lt!110634 () Unit!4615)

(assert (=> b!69007 (= lt!110634 lt!110620)))

(declare-fun lt!110628 () tuple2!6016)

(assert (=> b!69007 (= lt!110628 (reader!0 (_2!3120 lt!110626) (_2!3120 lt!110619)))))

(declare-fun lt!110623 () (_ BitVec 64))

(assert (=> b!69007 (= lt!110623 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!110637 () Unit!4615)

(assert (=> b!69007 (= lt!110637 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3120 lt!110626) (buf!1722 (_2!3120 lt!110619)) lt!110623))))

(assert (=> b!69007 (validate_offset_bits!1 ((_ sign_extend 32) (size!1341 (buf!1722 (_2!3120 lt!110619)))) ((_ sign_extend 32) (currentByte!3418 (_2!3120 lt!110626))) ((_ sign_extend 32) (currentBit!3413 (_2!3120 lt!110626))) lt!110623)))

(declare-fun lt!110632 () Unit!4615)

(assert (=> b!69007 (= lt!110632 lt!110637)))

(declare-fun lt!110631 () List!721)

(assert (=> b!69007 (= lt!110631 (byteArrayBitContentToList!0 (_2!3120 lt!110619) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!110658 () List!721)

(assert (=> b!69007 (= lt!110658 (byteArrayBitContentToList!0 (_2!3120 lt!110619) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!110635 () List!721)

(assert (=> b!69007 (= lt!110635 (bitStreamReadBitsIntoList!0 (_2!3120 lt!110619) (_1!3119 lt!110638) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!110633 () List!721)

(assert (=> b!69007 (= lt!110633 (bitStreamReadBitsIntoList!0 (_2!3120 lt!110619) (_1!3119 lt!110628) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!110640 () (_ BitVec 64))

(assert (=> b!69007 (= lt!110640 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!110653 () Unit!4615)

(assert (=> b!69007 (= lt!110653 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3120 lt!110619) (_2!3120 lt!110619) (_1!3119 lt!110638) (_1!3119 lt!110628) lt!110640 lt!110635))))

(assert (=> b!69007 (= (bitStreamReadBitsIntoList!0 (_2!3120 lt!110619) (_1!3119 lt!110628) (bvsub lt!110640 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!325 lt!110635))))

(declare-fun lt!110641 () Unit!4615)

(assert (=> b!69007 (= lt!110641 lt!110653)))

(declare-fun lt!110656 () Unit!4615)

(declare-fun lt!110661 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2892 array!2892 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4615)

(assert (=> b!69007 (= lt!110656 (arrayBitRangesEqImpliesEq!0 (buf!1722 (_2!3120 lt!110626)) (buf!1722 (_2!3120 lt!110619)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!110661 (bitIndex!0 (size!1341 (buf!1722 (_2!3120 lt!110626))) (currentByte!3418 (_2!3120 lt!110626)) (currentBit!3413 (_2!3120 lt!110626)))))))

(assert (=> b!69007 (= (bitAt!0 (buf!1722 (_2!3120 lt!110626)) lt!110661) (bitAt!0 (buf!1722 (_2!3120 lt!110619)) lt!110661))))

(declare-fun lt!110642 () Unit!4615)

(assert (=> b!69007 (= lt!110642 lt!110656)))

(declare-fun b!69009 () Bool)

(declare-fun res!57022 () Bool)

(declare-fun e!45089 () Bool)

(assert (=> b!69009 (=> (not res!57022) (not e!45089))))

(declare-fun lt!110657 () tuple2!6018)

(assert (=> b!69009 (= res!57022 (invariant!0 (currentBit!3413 (_2!3120 lt!110657)) (currentByte!3418 (_2!3120 lt!110657)) (size!1341 (buf!1722 (_2!3120 lt!110657)))))))

(declare-fun b!69010 () Bool)

(declare-fun e!45088 () Bool)

(declare-fun lt!110629 () (_ BitVec 64))

(assert (=> b!69010 (= e!45088 (validate_offset_bits!1 ((_ sign_extend 32) (size!1341 (buf!1722 (_2!3120 lt!109956)))) ((_ sign_extend 32) (currentByte!3418 (_2!3120 lt!109956))) ((_ sign_extend 32) (currentBit!3413 (_2!3120 lt!109956))) lt!110629))))

(declare-fun b!69011 () Bool)

(declare-fun res!57017 () Bool)

(assert (=> b!69011 (=> (not res!57017) (not e!45089))))

(assert (=> b!69011 (= res!57017 (= (size!1341 (buf!1722 (_2!3120 lt!109956))) (size!1341 (buf!1722 (_2!3120 lt!110657)))))))

(declare-fun b!69012 () Bool)

(declare-fun lt!110655 () tuple2!6016)

(assert (=> b!69012 (= e!45089 (= (bitStreamReadBitsIntoList!0 (_2!3120 lt!110657) (_1!3119 lt!110655) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!3120 lt!110657) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!69012 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!69012 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!110618 () Unit!4615)

(declare-fun lt!110659 () Unit!4615)

(assert (=> b!69012 (= lt!110618 lt!110659)))

(assert (=> b!69012 (validate_offset_bits!1 ((_ sign_extend 32) (size!1341 (buf!1722 (_2!3120 lt!110657)))) ((_ sign_extend 32) (currentByte!3418 (_2!3120 lt!109956))) ((_ sign_extend 32) (currentBit!3413 (_2!3120 lt!109956))) lt!110629)))

(assert (=> b!69012 (= lt!110659 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3120 lt!109956) (buf!1722 (_2!3120 lt!110657)) lt!110629))))

(assert (=> b!69012 e!45088))

(declare-fun res!57019 () Bool)

(assert (=> b!69012 (=> (not res!57019) (not e!45088))))

(assert (=> b!69012 (= res!57019 (and (= (size!1341 (buf!1722 (_2!3120 lt!109956))) (size!1341 (buf!1722 (_2!3120 lt!110657)))) (bvsge lt!110629 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!69012 (= lt!110629 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!69012 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!69012 (= lt!110655 (reader!0 (_2!3120 lt!109956) (_2!3120 lt!110657)))))

(declare-fun b!69008 () Bool)

(declare-fun res!57018 () Bool)

(assert (=> b!69008 (=> (not res!57018) (not e!45089))))

(assert (=> b!69008 (= res!57018 (= (size!1341 (buf!1722 (_2!3120 lt!110657))) (size!1341 (buf!1722 (_2!3120 lt!109956)))))))

(declare-fun d!21932 () Bool)

(assert (=> d!21932 e!45089))

(declare-fun res!57021 () Bool)

(assert (=> d!21932 (=> (not res!57021) (not e!45089))))

(declare-fun lt!110630 () (_ BitVec 64))

(assert (=> d!21932 (= res!57021 (= (bitIndex!0 (size!1341 (buf!1722 (_2!3120 lt!110657))) (currentByte!3418 (_2!3120 lt!110657)) (currentBit!3413 (_2!3120 lt!110657))) (bvsub lt!110630 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!21932 (or (= (bvand lt!110630 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!110630 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!110630 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!110660 () (_ BitVec 64))

(assert (=> d!21932 (= lt!110630 (bvadd lt!110660 to!314))))

(assert (=> d!21932 (or (not (= (bvand lt!110660 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!110660 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!110660 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!21932 (= lt!110660 (bitIndex!0 (size!1341 (buf!1722 (_2!3120 lt!109956))) (currentByte!3418 (_2!3120 lt!109956)) (currentBit!3413 (_2!3120 lt!109956))))))

(assert (=> d!21932 (= lt!110657 e!45087)))

(assert (=> d!21932 (= c!5104 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!110624 () Unit!4615)

(declare-fun lt!110625 () Unit!4615)

(assert (=> d!21932 (= lt!110624 lt!110625)))

(assert (=> d!21932 (isPrefixOf!0 (_2!3120 lt!109956) (_2!3120 lt!109956))))

(assert (=> d!21932 (= lt!110625 (lemmaIsPrefixRefl!0 (_2!3120 lt!109956)))))

(assert (=> d!21932 (= lt!110661 (bitIndex!0 (size!1341 (buf!1722 (_2!3120 lt!109956))) (currentByte!3418 (_2!3120 lt!109956)) (currentBit!3413 (_2!3120 lt!109956))))))

(assert (=> d!21932 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21932 (= (appendBitsMSBFirstLoop!0 (_2!3120 lt!109956) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!110657)))

(declare-fun b!69013 () Bool)

(declare-fun res!57020 () Bool)

(assert (=> b!69013 (=> (not res!57020) (not e!45089))))

(assert (=> b!69013 (= res!57020 (isPrefixOf!0 (_2!3120 lt!109956) (_2!3120 lt!110657)))))

(declare-fun b!69014 () Bool)

(declare-fun Unit!4626 () Unit!4615)

(assert (=> b!69014 (= e!45087 (tuple2!6019 Unit!4626 (_2!3120 lt!109956)))))

(assert (=> b!69014 (= (size!1341 (buf!1722 (_2!3120 lt!109956))) (size!1341 (buf!1722 (_2!3120 lt!109956))))))

(declare-fun lt!110643 () Unit!4615)

(declare-fun Unit!4627 () Unit!4615)

(assert (=> b!69014 (= lt!110643 Unit!4627)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2292 array!2892 array!2892 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!69014 (checkByteArrayBitContent!0 (_2!3120 lt!109956) srcBuffer!2 (_1!3124 (readBits!0 (_1!3119 call!887) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (= (and d!21932 c!5104) b!69007))

(assert (= (and d!21932 (not c!5104)) b!69014))

(assert (= (or b!69007 b!69014) bm!884))

(assert (= (and d!21932 res!57021) b!69009))

(assert (= (and b!69009 res!57022) b!69011))

(assert (= (and b!69011 res!57017) b!69013))

(assert (= (and b!69013 res!57020) b!69008))

(assert (= (and b!69008 res!57018) b!69012))

(assert (= (and b!69012 res!57019) b!69010))

(declare-fun m!110141 () Bool)

(assert (=> b!69012 m!110141))

(declare-fun m!110143 () Bool)

(assert (=> b!69012 m!110143))

(declare-fun m!110145 () Bool)

(assert (=> b!69012 m!110145))

(declare-fun m!110147 () Bool)

(assert (=> b!69012 m!110147))

(declare-fun m!110149 () Bool)

(assert (=> b!69012 m!110149))

(declare-fun m!110151 () Bool)

(assert (=> d!21932 m!110151))

(assert (=> d!21932 m!109695))

(assert (=> d!21932 m!109991))

(assert (=> d!21932 m!109987))

(declare-fun m!110153 () Bool)

(assert (=> b!69013 m!110153))

(declare-fun m!110155 () Bool)

(assert (=> b!69014 m!110155))

(declare-fun m!110157 () Bool)

(assert (=> b!69014 m!110157))

(declare-fun m!110159 () Bool)

(assert (=> bm!884 m!110159))

(declare-fun m!110161 () Bool)

(assert (=> b!69009 m!110161))

(declare-fun m!110163 () Bool)

(assert (=> b!69010 m!110163))

(declare-fun m!110165 () Bool)

(assert (=> b!69007 m!110165))

(declare-fun m!110167 () Bool)

(assert (=> b!69007 m!110167))

(declare-fun m!110169 () Bool)

(assert (=> b!69007 m!110169))

(declare-fun m!110171 () Bool)

(assert (=> b!69007 m!110171))

(declare-fun m!110173 () Bool)

(assert (=> b!69007 m!110173))

(declare-fun m!110175 () Bool)

(assert (=> b!69007 m!110175))

(assert (=> b!69007 m!109695))

(declare-fun m!110179 () Bool)

(assert (=> b!69007 m!110179))

(declare-fun m!110183 () Bool)

(assert (=> b!69007 m!110183))

(declare-fun m!110187 () Bool)

(assert (=> b!69007 m!110187))

(declare-fun m!110191 () Bool)

(assert (=> b!69007 m!110191))

(declare-fun m!110195 () Bool)

(assert (=> b!69007 m!110195))

(declare-fun m!110197 () Bool)

(assert (=> b!69007 m!110197))

(declare-fun m!110201 () Bool)

(assert (=> b!69007 m!110201))

(declare-fun m!110207 () Bool)

(assert (=> b!69007 m!110207))

(declare-fun m!110211 () Bool)

(assert (=> b!69007 m!110211))

(declare-fun m!110215 () Bool)

(assert (=> b!69007 m!110215))

(declare-fun m!110219 () Bool)

(assert (=> b!69007 m!110219))

(assert (=> b!69007 m!110197))

(declare-fun m!110223 () Bool)

(assert (=> b!69007 m!110223))

(declare-fun m!110227 () Bool)

(assert (=> b!69007 m!110227))

(declare-fun m!110231 () Bool)

(assert (=> b!69007 m!110231))

(assert (=> b!69007 m!110173))

(declare-fun m!110239 () Bool)

(assert (=> b!69007 m!110239))

(declare-fun m!110243 () Bool)

(assert (=> b!69007 m!110243))

(assert (=> b!69007 m!110201))

(declare-fun m!110251 () Bool)

(assert (=> b!69007 m!110251))

(declare-fun m!110253 () Bool)

(assert (=> b!69007 m!110253))

(assert (=> b!69007 m!110231))

(declare-fun m!110257 () Bool)

(assert (=> b!69007 m!110257))

(declare-fun m!110262 () Bool)

(assert (=> b!69007 m!110262))

(declare-fun m!110265 () Bool)

(assert (=> b!69007 m!110265))

(declare-fun m!110269 () Bool)

(assert (=> b!69007 m!110269))

(declare-fun m!110272 () Bool)

(assert (=> b!69007 m!110272))

(declare-fun m!110277 () Bool)

(assert (=> b!69007 m!110277))

(declare-fun m!110281 () Bool)

(assert (=> b!69007 m!110281))

(assert (=> b!68718 d!21932))

(declare-fun d!21980 () Bool)

(assert (=> d!21980 (isPrefixOf!0 thiss!1379 (_2!3120 lt!109953))))

(declare-fun lt!110729 () Unit!4615)

(declare-fun choose!30 (BitStream!2292 BitStream!2292 BitStream!2292) Unit!4615)

(assert (=> d!21980 (= lt!110729 (choose!30 thiss!1379 (_2!3120 lt!109956) (_2!3120 lt!109953)))))

(assert (=> d!21980 (isPrefixOf!0 thiss!1379 (_2!3120 lt!109956))))

(assert (=> d!21980 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3120 lt!109956) (_2!3120 lt!109953)) lt!110729)))

(declare-fun bs!5301 () Bool)

(assert (= bs!5301 d!21980))

(assert (=> bs!5301 m!109769))

(declare-fun m!110339 () Bool)

(assert (=> bs!5301 m!110339))

(assert (=> bs!5301 m!109699))

(assert (=> b!68718 d!21980))

(declare-fun d!21990 () Bool)

(declare-fun res!57032 () Bool)

(declare-fun e!45095 () Bool)

(assert (=> d!21990 (=> (not res!57032) (not e!45095))))

(assert (=> d!21990 (= res!57032 (= (size!1341 (buf!1722 thiss!1379)) (size!1341 (buf!1722 (_2!3120 lt!109953)))))))

(assert (=> d!21990 (= (isPrefixOf!0 thiss!1379 (_2!3120 lt!109953)) e!45095)))

(declare-fun b!69028 () Bool)

(declare-fun res!57033 () Bool)

(assert (=> b!69028 (=> (not res!57033) (not e!45095))))

(assert (=> b!69028 (= res!57033 (bvsle (bitIndex!0 (size!1341 (buf!1722 thiss!1379)) (currentByte!3418 thiss!1379) (currentBit!3413 thiss!1379)) (bitIndex!0 (size!1341 (buf!1722 (_2!3120 lt!109953))) (currentByte!3418 (_2!3120 lt!109953)) (currentBit!3413 (_2!3120 lt!109953)))))))

(declare-fun b!69029 () Bool)

(declare-fun e!45096 () Bool)

(assert (=> b!69029 (= e!45095 e!45096)))

(declare-fun res!57034 () Bool)

(assert (=> b!69029 (=> res!57034 e!45096)))

(assert (=> b!69029 (= res!57034 (= (size!1341 (buf!1722 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!69030 () Bool)

(assert (=> b!69030 (= e!45096 (arrayBitRangesEq!0 (buf!1722 thiss!1379) (buf!1722 (_2!3120 lt!109953)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1341 (buf!1722 thiss!1379)) (currentByte!3418 thiss!1379) (currentBit!3413 thiss!1379))))))

(assert (= (and d!21990 res!57032) b!69028))

(assert (= (and b!69028 res!57033) b!69029))

(assert (= (and b!69029 (not res!57034)) b!69030))

(assert (=> b!69028 m!109731))

(assert (=> b!69028 m!109785))

(assert (=> b!69030 m!109731))

(assert (=> b!69030 m!109731))

(declare-fun m!110341 () Bool)

(assert (=> b!69030 m!110341))

(assert (=> b!68718 d!21990))

(declare-fun b!69031 () Bool)

(declare-fun res!57035 () Bool)

(declare-fun e!45098 () Bool)

(assert (=> b!69031 (=> (not res!57035) (not e!45098))))

(declare-fun lt!110738 () tuple2!6016)

(assert (=> b!69031 (= res!57035 (isPrefixOf!0 (_2!3119 lt!110738) (_2!3120 lt!109956)))))

(declare-fun lt!110746 () (_ BitVec 64))

(declare-fun lt!110735 () (_ BitVec 64))

(declare-fun b!69032 () Bool)

(assert (=> b!69032 (= e!45098 (= (_1!3119 lt!110738) (withMovedBitIndex!0 (_2!3119 lt!110738) (bvsub lt!110746 lt!110735))))))

(assert (=> b!69032 (or (= (bvand lt!110746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!110735 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!110746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!110746 lt!110735) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!69032 (= lt!110735 (bitIndex!0 (size!1341 (buf!1722 (_2!3120 lt!109956))) (currentByte!3418 (_2!3120 lt!109956)) (currentBit!3413 (_2!3120 lt!109956))))))

(assert (=> b!69032 (= lt!110746 (bitIndex!0 (size!1341 (buf!1722 thiss!1379)) (currentByte!3418 thiss!1379) (currentBit!3413 thiss!1379)))))

(declare-fun d!21992 () Bool)

(assert (=> d!21992 e!45098))

(declare-fun res!57036 () Bool)

(assert (=> d!21992 (=> (not res!57036) (not e!45098))))

(assert (=> d!21992 (= res!57036 (isPrefixOf!0 (_1!3119 lt!110738) (_2!3119 lt!110738)))))

(declare-fun lt!110741 () BitStream!2292)

(assert (=> d!21992 (= lt!110738 (tuple2!6017 lt!110741 (_2!3120 lt!109956)))))

(declare-fun lt!110744 () Unit!4615)

(declare-fun lt!110731 () Unit!4615)

(assert (=> d!21992 (= lt!110744 lt!110731)))

(assert (=> d!21992 (isPrefixOf!0 lt!110741 (_2!3120 lt!109956))))

(assert (=> d!21992 (= lt!110731 (lemmaIsPrefixTransitive!0 lt!110741 (_2!3120 lt!109956) (_2!3120 lt!109956)))))

(declare-fun lt!110743 () Unit!4615)

(declare-fun lt!110747 () Unit!4615)

(assert (=> d!21992 (= lt!110743 lt!110747)))

(assert (=> d!21992 (isPrefixOf!0 lt!110741 (_2!3120 lt!109956))))

(assert (=> d!21992 (= lt!110747 (lemmaIsPrefixTransitive!0 lt!110741 thiss!1379 (_2!3120 lt!109956)))))

(declare-fun lt!110739 () Unit!4615)

(declare-fun e!45097 () Unit!4615)

(assert (=> d!21992 (= lt!110739 e!45097)))

(declare-fun c!5107 () Bool)

(assert (=> d!21992 (= c!5107 (not (= (size!1341 (buf!1722 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!110732 () Unit!4615)

(declare-fun lt!110733 () Unit!4615)

(assert (=> d!21992 (= lt!110732 lt!110733)))

(assert (=> d!21992 (isPrefixOf!0 (_2!3120 lt!109956) (_2!3120 lt!109956))))

(assert (=> d!21992 (= lt!110733 (lemmaIsPrefixRefl!0 (_2!3120 lt!109956)))))

(declare-fun lt!110748 () Unit!4615)

(declare-fun lt!110742 () Unit!4615)

(assert (=> d!21992 (= lt!110748 lt!110742)))

(assert (=> d!21992 (= lt!110742 (lemmaIsPrefixRefl!0 (_2!3120 lt!109956)))))

(declare-fun lt!110734 () Unit!4615)

(declare-fun lt!110749 () Unit!4615)

(assert (=> d!21992 (= lt!110734 lt!110749)))

(assert (=> d!21992 (isPrefixOf!0 lt!110741 lt!110741)))

(assert (=> d!21992 (= lt!110749 (lemmaIsPrefixRefl!0 lt!110741))))

(declare-fun lt!110736 () Unit!4615)

(declare-fun lt!110745 () Unit!4615)

(assert (=> d!21992 (= lt!110736 lt!110745)))

(assert (=> d!21992 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!21992 (= lt!110745 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!21992 (= lt!110741 (BitStream!2293 (buf!1722 (_2!3120 lt!109956)) (currentByte!3418 thiss!1379) (currentBit!3413 thiss!1379)))))

(assert (=> d!21992 (isPrefixOf!0 thiss!1379 (_2!3120 lt!109956))))

(assert (=> d!21992 (= (reader!0 thiss!1379 (_2!3120 lt!109956)) lt!110738)))

(declare-fun b!69033 () Bool)

(declare-fun res!57037 () Bool)

(assert (=> b!69033 (=> (not res!57037) (not e!45098))))

(assert (=> b!69033 (= res!57037 (isPrefixOf!0 (_1!3119 lt!110738) thiss!1379))))

(declare-fun b!69034 () Bool)

(declare-fun Unit!4629 () Unit!4615)

(assert (=> b!69034 (= e!45097 Unit!4629)))

(declare-fun b!69035 () Bool)

(declare-fun lt!110737 () Unit!4615)

(assert (=> b!69035 (= e!45097 lt!110737)))

(declare-fun lt!110730 () (_ BitVec 64))

(assert (=> b!69035 (= lt!110730 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110740 () (_ BitVec 64))

(assert (=> b!69035 (= lt!110740 (bitIndex!0 (size!1341 (buf!1722 thiss!1379)) (currentByte!3418 thiss!1379) (currentBit!3413 thiss!1379)))))

(assert (=> b!69035 (= lt!110737 (arrayBitRangesEqSymmetric!0 (buf!1722 thiss!1379) (buf!1722 (_2!3120 lt!109956)) lt!110730 lt!110740))))

(assert (=> b!69035 (arrayBitRangesEq!0 (buf!1722 (_2!3120 lt!109956)) (buf!1722 thiss!1379) lt!110730 lt!110740)))

(assert (= (and d!21992 c!5107) b!69035))

(assert (= (and d!21992 (not c!5107)) b!69034))

(assert (= (and d!21992 res!57036) b!69033))

(assert (= (and b!69033 res!57037) b!69031))

(assert (= (and b!69031 res!57035) b!69032))

(assert (=> b!69035 m!109731))

(declare-fun m!110343 () Bool)

(assert (=> b!69035 m!110343))

(declare-fun m!110345 () Bool)

(assert (=> b!69035 m!110345))

(declare-fun m!110347 () Bool)

(assert (=> b!69031 m!110347))

(declare-fun m!110349 () Bool)

(assert (=> b!69032 m!110349))

(assert (=> b!69032 m!109695))

(assert (=> b!69032 m!109731))

(declare-fun m!110351 () Bool)

(assert (=> d!21992 m!110351))

(declare-fun m!110353 () Bool)

(assert (=> d!21992 m!110353))

(assert (=> d!21992 m!109729))

(declare-fun m!110355 () Bool)

(assert (=> d!21992 m!110355))

(assert (=> d!21992 m!109727))

(declare-fun m!110357 () Bool)

(assert (=> d!21992 m!110357))

(declare-fun m!110359 () Bool)

(assert (=> d!21992 m!110359))

(assert (=> d!21992 m!109699))

(declare-fun m!110361 () Bool)

(assert (=> d!21992 m!110361))

(assert (=> d!21992 m!109987))

(assert (=> d!21992 m!109991))

(declare-fun m!110363 () Bool)

(assert (=> b!69033 m!110363))

(assert (=> b!68718 d!21992))

(declare-fun d!21994 () Bool)

(declare-fun res!57044 () Bool)

(declare-fun e!45102 () Bool)

(assert (=> d!21994 (=> (not res!57044) (not e!45102))))

(assert (=> d!21994 (= res!57044 (= (size!1341 (buf!1722 (_2!3120 lt!109956))) (size!1341 (buf!1722 (_2!3120 lt!109953)))))))

(assert (=> d!21994 (= (isPrefixOf!0 (_2!3120 lt!109956) (_2!3120 lt!109953)) e!45102)))

(declare-fun b!69044 () Bool)

(declare-fun res!57045 () Bool)

(assert (=> b!69044 (=> (not res!57045) (not e!45102))))

(assert (=> b!69044 (= res!57045 (bvsle (bitIndex!0 (size!1341 (buf!1722 (_2!3120 lt!109956))) (currentByte!3418 (_2!3120 lt!109956)) (currentBit!3413 (_2!3120 lt!109956))) (bitIndex!0 (size!1341 (buf!1722 (_2!3120 lt!109953))) (currentByte!3418 (_2!3120 lt!109953)) (currentBit!3413 (_2!3120 lt!109953)))))))

(declare-fun b!69045 () Bool)

(declare-fun e!45103 () Bool)

(assert (=> b!69045 (= e!45102 e!45103)))

(declare-fun res!57046 () Bool)

(assert (=> b!69045 (=> res!57046 e!45103)))

(assert (=> b!69045 (= res!57046 (= (size!1341 (buf!1722 (_2!3120 lt!109956))) #b00000000000000000000000000000000))))

(declare-fun b!69046 () Bool)

(assert (=> b!69046 (= e!45103 (arrayBitRangesEq!0 (buf!1722 (_2!3120 lt!109956)) (buf!1722 (_2!3120 lt!109953)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1341 (buf!1722 (_2!3120 lt!109956))) (currentByte!3418 (_2!3120 lt!109956)) (currentBit!3413 (_2!3120 lt!109956)))))))

(assert (= (and d!21994 res!57044) b!69044))

(assert (= (and b!69044 res!57045) b!69045))

(assert (= (and b!69045 (not res!57046)) b!69046))

(assert (=> b!69044 m!109695))

(assert (=> b!69044 m!109785))

(assert (=> b!69046 m!109695))

(assert (=> b!69046 m!109695))

(declare-fun m!110367 () Bool)

(assert (=> b!69046 m!110367))

(assert (=> b!68718 d!21994))

(declare-fun d!21998 () Bool)

(assert (=> d!21998 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1341 (buf!1722 (_2!3120 lt!109956)))) ((_ sign_extend 32) (currentByte!3418 thiss!1379)) ((_ sign_extend 32) (currentBit!3413 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1341 (buf!1722 (_2!3120 lt!109956)))) ((_ sign_extend 32) (currentByte!3418 thiss!1379)) ((_ sign_extend 32) (currentBit!3413 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!5303 () Bool)

(assert (= bs!5303 d!21998))

(declare-fun m!110369 () Bool)

(assert (=> bs!5303 m!110369))

(assert (=> b!68718 d!21998))

(declare-fun d!22000 () Bool)

(assert (=> d!22000 (validate_offset_bits!1 ((_ sign_extend 32) (size!1341 (buf!1722 (_2!3120 lt!109956)))) ((_ sign_extend 32) (currentByte!3418 thiss!1379)) ((_ sign_extend 32) (currentBit!3413 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!110797 () Unit!4615)

(assert (=> d!22000 (= lt!110797 (choose!9 thiss!1379 (buf!1722 (_2!3120 lt!109956)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2293 (buf!1722 (_2!3120 lt!109956)) (currentByte!3418 thiss!1379) (currentBit!3413 thiss!1379))))))

(assert (=> d!22000 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1722 (_2!3120 lt!109956)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!110797)))

(declare-fun bs!5304 () Bool)

(assert (= bs!5304 d!22000))

(assert (=> bs!5304 m!109767))

(declare-fun m!110371 () Bool)

(assert (=> bs!5304 m!110371))

(assert (=> b!68718 d!22000))

(check-sat (not d!21874) (not b!69031) (not b!68852) (not b!68864) (not b!68833) (not b!68851) (not d!21886) (not d!21848) (not b!68855) (not d!21992) (not b!69033) (not b!68892) (not b!68862) (not b!68871) (not b!68834) (not b!69032) (not b!68863) (not b!69012) (not d!21846) (not b!69009) (not b!69007) (not b!68849) (not b!68786) (not d!21932) (not d!21876) (not b!69030) (not b!68848) (not b!68791) (not b!68813) (not b!68788) (not d!21930) (not b!68860) (not d!21888) (not d!22000) (not b!68854) (not d!21914) (not d!21998) (not b!68812) (not b!69046) (not b!68815) (not d!21850) (not d!21872) (not b!68835) (not b!68890) (not b!69010) (not b!68858) (not b!68853) (not d!21892) (not d!21916) (not b!68809) (not d!21926) (not bm!884) (not b!68822) (not b!69013) (not d!21908) (not b!68847) (not b!68816) (not b!69044) (not b!68810) (not b!69028) (not b!68811) (not b!69035) (not d!21922) (not b!68837) (not d!21980) (not b!68856) (not d!21860) (not b!68814) (not b!69014) (not d!21880))
(check-sat)
