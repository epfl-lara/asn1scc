; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5944 () Bool)

(assert start!5944)

(declare-datatypes ((array!1681 0))(
  ( (array!1682 (arr!1185 (Array (_ BitVec 32) (_ BitVec 8))) (size!723 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1681)

(declare-fun e!17805 () Bool)

(declare-datatypes ((BitStream!1278 0))(
  ( (BitStream!1279 (buf!1050 array!1681) (currentByte!2375 (_ BitVec 32)) (currentBit!2370 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2922 0))(
  ( (tuple2!2923 (_1!1548 BitStream!1278) (_2!1548 BitStream!1278)) )
))
(declare-fun lt!37885 () tuple2!2922)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun b!26208 () Bool)

(declare-datatypes ((Unit!2149 0))(
  ( (Unit!2150) )
))
(declare-datatypes ((tuple2!2924 0))(
  ( (tuple2!2925 (_1!1549 Unit!2149) (_2!1549 BitStream!1278)) )
))
(declare-fun lt!37888 () tuple2!2924)

(declare-datatypes ((List!340 0))(
  ( (Nil!337) (Cons!336 (h!455 Bool) (t!1090 List!340)) )
))
(declare-fun head!177 (List!340) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1278 array!1681 (_ BitVec 64) (_ BitVec 64)) List!340)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1278 BitStream!1278 (_ BitVec 64)) List!340)

(assert (=> b!26208 (= e!17805 (= (head!177 (byteArrayBitContentToList!0 (_2!1549 lt!37888) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!177 (bitStreamReadBitsIntoList!0 (_2!1549 lt!37888) (_1!1548 lt!37885) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!26209 () Bool)

(declare-fun res!22579 () Bool)

(declare-fun e!17804 () Bool)

(assert (=> b!26209 (=> res!22579 e!17804)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!26209 (= res!22579 (not (invariant!0 (currentBit!2370 (_2!1549 lt!37888)) (currentByte!2375 (_2!1549 lt!37888)) (size!723 (buf!1050 (_2!1549 lt!37888))))))))

(declare-fun res!22575 () Bool)

(declare-fun e!17803 () Bool)

(assert (=> start!5944 (=> (not res!22575) (not e!17803))))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!5944 (= res!22575 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!723 srcBuffer!2))))))))

(assert (=> start!5944 e!17803))

(assert (=> start!5944 true))

(declare-fun array_inv!692 (array!1681) Bool)

(assert (=> start!5944 (array_inv!692 srcBuffer!2)))

(declare-fun thiss!1379 () BitStream!1278)

(declare-fun e!17802 () Bool)

(declare-fun inv!12 (BitStream!1278) Bool)

(assert (=> start!5944 (and (inv!12 thiss!1379) e!17802)))

(declare-fun b!26210 () Bool)

(assert (=> b!26210 (= e!17802 (array_inv!692 (buf!1050 thiss!1379)))))

(declare-fun b!26211 () Bool)

(declare-fun res!22570 () Bool)

(declare-fun e!17801 () Bool)

(assert (=> b!26211 (=> res!22570 e!17801)))

(declare-fun lt!37883 () tuple2!2922)

(declare-fun lt!37878 () tuple2!2924)

(declare-fun isPrefixOf!0 (BitStream!1278 BitStream!1278) Bool)

(assert (=> b!26211 (= res!22570 (not (isPrefixOf!0 (_1!1548 lt!37883) (_2!1549 lt!37878))))))

(declare-fun b!26212 () Bool)

(declare-fun e!17812 () Bool)

(assert (=> b!26212 (= e!17812 e!17804)))

(declare-fun res!22582 () Bool)

(assert (=> b!26212 (=> res!22582 e!17804)))

(assert (=> b!26212 (= res!22582 (not (= (size!723 (buf!1050 (_2!1549 lt!37888))) (size!723 (buf!1050 (_2!1549 lt!37878))))))))

(declare-fun e!17806 () Bool)

(assert (=> b!26212 e!17806))

(declare-fun res!22568 () Bool)

(assert (=> b!26212 (=> (not res!22568) (not e!17806))))

(assert (=> b!26212 (= res!22568 (= (size!723 (buf!1050 (_2!1549 lt!37878))) (size!723 (buf!1050 thiss!1379))))))

(declare-fun b!26213 () Bool)

(declare-fun res!22567 () Bool)

(assert (=> b!26213 (=> res!22567 e!17801)))

(declare-fun lt!37893 () (_ BitVec 64))

(declare-fun lt!37880 () tuple2!2922)

(assert (=> b!26213 (= res!22567 (or (not (= (buf!1050 (_1!1548 lt!37883)) (buf!1050 (_1!1548 lt!37880)))) (not (= (buf!1050 (_1!1548 lt!37883)) (buf!1050 (_2!1549 lt!37878)))) (bvsge lt!37893 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!26214 () Bool)

(declare-fun e!17809 () Bool)

(declare-fun e!17807 () Bool)

(assert (=> b!26214 (= e!17809 e!17807)))

(declare-fun res!22584 () Bool)

(assert (=> b!26214 (=> res!22584 e!17807)))

(assert (=> b!26214 (= res!22584 (not (isPrefixOf!0 thiss!1379 (_2!1549 lt!37888))))))

(declare-fun lt!37887 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!26214 (validate_offset_bits!1 ((_ sign_extend 32) (size!723 (buf!1050 (_2!1549 lt!37888)))) ((_ sign_extend 32) (currentByte!2375 (_2!1549 lt!37888))) ((_ sign_extend 32) (currentBit!2370 (_2!1549 lt!37888))) lt!37887)))

(assert (=> b!26214 (= lt!37887 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!37881 () Unit!2149)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1278 BitStream!1278 (_ BitVec 64) (_ BitVec 64)) Unit!2149)

(assert (=> b!26214 (= lt!37881 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1549 lt!37888) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1278 (_ BitVec 8) (_ BitVec 32)) tuple2!2924)

(assert (=> b!26214 (= lt!37888 (appendBitFromByte!0 thiss!1379 (select (arr!1185 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!26215 () Bool)

(declare-fun res!22569 () Bool)

(assert (=> b!26215 (=> res!22569 e!17804)))

(assert (=> b!26215 (= res!22569 (not (invariant!0 (currentBit!2370 (_2!1549 lt!37888)) (currentByte!2375 (_2!1549 lt!37888)) (size!723 (buf!1050 (_2!1549 lt!37878))))))))

(declare-fun b!26216 () Bool)

(declare-fun res!22581 () Bool)

(assert (=> b!26216 (=> res!22581 e!17812)))

(assert (=> b!26216 (= res!22581 (not (invariant!0 (currentBit!2370 (_2!1549 lt!37878)) (currentByte!2375 (_2!1549 lt!37878)) (size!723 (buf!1050 (_2!1549 lt!37878))))))))

(declare-fun b!26217 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!26217 (= e!17806 (= lt!37893 (bvsub (bvsub (bvadd (bitIndex!0 (size!723 (buf!1050 (_2!1549 lt!37888))) (currentByte!2375 (_2!1549 lt!37888)) (currentBit!2370 (_2!1549 lt!37888))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!26218 () Bool)

(declare-fun res!22571 () Bool)

(assert (=> b!26218 (=> res!22571 e!17801)))

(assert (=> b!26218 (= res!22571 (not (isPrefixOf!0 (_1!1548 lt!37883) (_1!1548 lt!37880))))))

(declare-fun b!26219 () Bool)

(declare-fun res!22572 () Bool)

(assert (=> b!26219 (=> res!22572 e!17812)))

(assert (=> b!26219 (= res!22572 (not (= (size!723 (buf!1050 thiss!1379)) (size!723 (buf!1050 (_2!1549 lt!37878))))))))

(declare-fun b!26220 () Bool)

(assert (=> b!26220 (= e!17803 (not e!17809))))

(declare-fun res!22573 () Bool)

(assert (=> b!26220 (=> res!22573 e!17809)))

(assert (=> b!26220 (= res!22573 (bvsge i!635 to!314))))

(assert (=> b!26220 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!37877 () Unit!2149)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1278) Unit!2149)

(assert (=> b!26220 (= lt!37877 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!37884 () (_ BitVec 64))

(assert (=> b!26220 (= lt!37884 (bitIndex!0 (size!723 (buf!1050 thiss!1379)) (currentByte!2375 thiss!1379) (currentBit!2370 thiss!1379)))))

(declare-fun b!26221 () Bool)

(declare-fun e!17811 () Bool)

(assert (=> b!26221 (= e!17807 e!17811)))

(declare-fun res!22577 () Bool)

(assert (=> b!26221 (=> res!22577 e!17811)))

(assert (=> b!26221 (= res!22577 (not (isPrefixOf!0 (_2!1549 lt!37888) (_2!1549 lt!37878))))))

(assert (=> b!26221 (isPrefixOf!0 thiss!1379 (_2!1549 lt!37878))))

(declare-fun lt!37886 () Unit!2149)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1278 BitStream!1278 BitStream!1278) Unit!2149)

(assert (=> b!26221 (= lt!37886 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1549 lt!37888) (_2!1549 lt!37878)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1278 array!1681 (_ BitVec 64) (_ BitVec 64)) tuple2!2924)

(assert (=> b!26221 (= lt!37878 (appendBitsMSBFirstLoop!0 (_2!1549 lt!37888) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!26221 e!17805))

(declare-fun res!22576 () Bool)

(assert (=> b!26221 (=> (not res!22576) (not e!17805))))

(assert (=> b!26221 (= res!22576 (validate_offset_bits!1 ((_ sign_extend 32) (size!723 (buf!1050 (_2!1549 lt!37888)))) ((_ sign_extend 32) (currentByte!2375 thiss!1379)) ((_ sign_extend 32) (currentBit!2370 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!37892 () Unit!2149)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1278 array!1681 (_ BitVec 64)) Unit!2149)

(assert (=> b!26221 (= lt!37892 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1050 (_2!1549 lt!37888)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1278 BitStream!1278) tuple2!2922)

(assert (=> b!26221 (= lt!37885 (reader!0 thiss!1379 (_2!1549 lt!37888)))))

(declare-fun b!26222 () Bool)

(declare-fun res!22574 () Bool)

(assert (=> b!26222 (=> (not res!22574) (not e!17803))))

(assert (=> b!26222 (= res!22574 (validate_offset_bits!1 ((_ sign_extend 32) (size!723 (buf!1050 thiss!1379))) ((_ sign_extend 32) (currentByte!2375 thiss!1379)) ((_ sign_extend 32) (currentBit!2370 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!26223 () Bool)

(declare-fun res!22578 () Bool)

(assert (=> b!26223 (=> res!22578 e!17801)))

(declare-fun lt!37882 () List!340)

(declare-fun length!66 (List!340) Int)

(assert (=> b!26223 (= res!22578 (<= (length!66 lt!37882) 0))))

(declare-fun b!26224 () Bool)

(assert (=> b!26224 (= e!17801 true)))

(declare-fun lt!37891 () (_ BitVec 64))

(assert (=> b!26224 (= lt!37891 (bitIndex!0 (size!723 (buf!1050 (_1!1548 lt!37880))) (currentByte!2375 (_1!1548 lt!37880)) (currentBit!2370 (_1!1548 lt!37880))))))

(declare-fun lt!37889 () (_ BitVec 64))

(assert (=> b!26224 (= lt!37889 (bitIndex!0 (size!723 (buf!1050 (_1!1548 lt!37883))) (currentByte!2375 (_1!1548 lt!37883)) (currentBit!2370 (_1!1548 lt!37883))))))

(declare-fun b!26225 () Bool)

(declare-fun res!22580 () Bool)

(assert (=> b!26225 (=> res!22580 e!17801)))

(assert (=> b!26225 (= res!22580 (not (isPrefixOf!0 (_1!1548 lt!37880) (_2!1549 lt!37878))))))

(declare-fun b!26226 () Bool)

(assert (=> b!26226 (= e!17811 e!17812)))

(declare-fun res!22583 () Bool)

(assert (=> b!26226 (=> res!22583 e!17812)))

(assert (=> b!26226 (= res!22583 (not (= lt!37893 (bvsub (bvadd lt!37884 to!314) i!635))))))

(assert (=> b!26226 (= lt!37893 (bitIndex!0 (size!723 (buf!1050 (_2!1549 lt!37878))) (currentByte!2375 (_2!1549 lt!37878)) (currentBit!2370 (_2!1549 lt!37878))))))

(declare-fun b!26227 () Bool)

(assert (=> b!26227 (= e!17804 e!17801)))

(declare-fun res!22566 () Bool)

(assert (=> b!26227 (=> res!22566 e!17801)))

(assert (=> b!26227 (= res!22566 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!37894 () List!340)

(assert (=> b!26227 (= lt!37894 (bitStreamReadBitsIntoList!0 (_2!1549 lt!37878) (_1!1548 lt!37880) lt!37887))))

(assert (=> b!26227 (= lt!37882 (bitStreamReadBitsIntoList!0 (_2!1549 lt!37878) (_1!1548 lt!37883) (bvsub to!314 i!635)))))

(assert (=> b!26227 (validate_offset_bits!1 ((_ sign_extend 32) (size!723 (buf!1050 (_2!1549 lt!37878)))) ((_ sign_extend 32) (currentByte!2375 (_2!1549 lt!37888))) ((_ sign_extend 32) (currentBit!2370 (_2!1549 lt!37888))) lt!37887)))

(declare-fun lt!37890 () Unit!2149)

(assert (=> b!26227 (= lt!37890 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1549 lt!37888) (buf!1050 (_2!1549 lt!37878)) lt!37887))))

(assert (=> b!26227 (= lt!37880 (reader!0 (_2!1549 lt!37888) (_2!1549 lt!37878)))))

(assert (=> b!26227 (validate_offset_bits!1 ((_ sign_extend 32) (size!723 (buf!1050 (_2!1549 lt!37878)))) ((_ sign_extend 32) (currentByte!2375 thiss!1379)) ((_ sign_extend 32) (currentBit!2370 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!37879 () Unit!2149)

(assert (=> b!26227 (= lt!37879 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1050 (_2!1549 lt!37878)) (bvsub to!314 i!635)))))

(assert (=> b!26227 (= lt!37883 (reader!0 thiss!1379 (_2!1549 lt!37878)))))

(assert (= (and start!5944 res!22575) b!26222))

(assert (= (and b!26222 res!22574) b!26220))

(assert (= (and b!26220 (not res!22573)) b!26214))

(assert (= (and b!26214 (not res!22584)) b!26221))

(assert (= (and b!26221 res!22576) b!26208))

(assert (= (and b!26221 (not res!22577)) b!26226))

(assert (= (and b!26226 (not res!22583)) b!26216))

(assert (= (and b!26216 (not res!22581)) b!26219))

(assert (= (and b!26219 (not res!22572)) b!26212))

(assert (= (and b!26212 res!22568) b!26217))

(assert (= (and b!26212 (not res!22582)) b!26209))

(assert (= (and b!26209 (not res!22579)) b!26215))

(assert (= (and b!26215 (not res!22569)) b!26227))

(assert (= (and b!26227 (not res!22566)) b!26223))

(assert (= (and b!26223 (not res!22578)) b!26211))

(assert (= (and b!26211 (not res!22570)) b!26225))

(assert (= (and b!26225 (not res!22580)) b!26218))

(assert (= (and b!26218 (not res!22571)) b!26213))

(assert (= (and b!26213 (not res!22567)) b!26224))

(assert (= start!5944 b!26210))

(declare-fun m!37593 () Bool)

(assert (=> b!26222 m!37593))

(declare-fun m!37595 () Bool)

(assert (=> b!26218 m!37595))

(declare-fun m!37597 () Bool)

(assert (=> b!26226 m!37597))

(declare-fun m!37599 () Bool)

(assert (=> b!26223 m!37599))

(declare-fun m!37601 () Bool)

(assert (=> b!26210 m!37601))

(declare-fun m!37603 () Bool)

(assert (=> b!26220 m!37603))

(declare-fun m!37605 () Bool)

(assert (=> b!26220 m!37605))

(declare-fun m!37607 () Bool)

(assert (=> b!26220 m!37607))

(declare-fun m!37609 () Bool)

(assert (=> b!26227 m!37609))

(declare-fun m!37611 () Bool)

(assert (=> b!26227 m!37611))

(declare-fun m!37613 () Bool)

(assert (=> b!26227 m!37613))

(declare-fun m!37615 () Bool)

(assert (=> b!26227 m!37615))

(declare-fun m!37617 () Bool)

(assert (=> b!26227 m!37617))

(declare-fun m!37619 () Bool)

(assert (=> b!26227 m!37619))

(declare-fun m!37621 () Bool)

(assert (=> b!26227 m!37621))

(declare-fun m!37623 () Bool)

(assert (=> b!26227 m!37623))

(declare-fun m!37625 () Bool)

(assert (=> b!26209 m!37625))

(declare-fun m!37627 () Bool)

(assert (=> b!26211 m!37627))

(declare-fun m!37629 () Bool)

(assert (=> b!26217 m!37629))

(declare-fun m!37631 () Bool)

(assert (=> b!26225 m!37631))

(declare-fun m!37633 () Bool)

(assert (=> b!26216 m!37633))

(declare-fun m!37635 () Bool)

(assert (=> b!26215 m!37635))

(declare-fun m!37637 () Bool)

(assert (=> b!26224 m!37637))

(declare-fun m!37639 () Bool)

(assert (=> b!26224 m!37639))

(declare-fun m!37641 () Bool)

(assert (=> start!5944 m!37641))

(declare-fun m!37643 () Bool)

(assert (=> start!5944 m!37643))

(declare-fun m!37645 () Bool)

(assert (=> b!26208 m!37645))

(assert (=> b!26208 m!37645))

(declare-fun m!37647 () Bool)

(assert (=> b!26208 m!37647))

(declare-fun m!37649 () Bool)

(assert (=> b!26208 m!37649))

(assert (=> b!26208 m!37649))

(declare-fun m!37651 () Bool)

(assert (=> b!26208 m!37651))

(declare-fun m!37653 () Bool)

(assert (=> b!26221 m!37653))

(declare-fun m!37655 () Bool)

(assert (=> b!26221 m!37655))

(declare-fun m!37657 () Bool)

(assert (=> b!26221 m!37657))

(declare-fun m!37659 () Bool)

(assert (=> b!26221 m!37659))

(declare-fun m!37661 () Bool)

(assert (=> b!26221 m!37661))

(declare-fun m!37663 () Bool)

(assert (=> b!26221 m!37663))

(declare-fun m!37665 () Bool)

(assert (=> b!26221 m!37665))

(declare-fun m!37667 () Bool)

(assert (=> b!26214 m!37667))

(declare-fun m!37669 () Bool)

(assert (=> b!26214 m!37669))

(declare-fun m!37671 () Bool)

(assert (=> b!26214 m!37671))

(assert (=> b!26214 m!37667))

(declare-fun m!37673 () Bool)

(assert (=> b!26214 m!37673))

(declare-fun m!37675 () Bool)

(assert (=> b!26214 m!37675))

(check-sat (not b!26218) (not b!26208) (not b!26211) (not b!26226) (not b!26224) (not b!26223) (not b!26220) (not b!26221) (not b!26217) (not b!26209) (not b!26225) (not b!26216) (not b!26210) (not b!26214) (not b!26227) (not start!5944) (not b!26222) (not b!26215))
