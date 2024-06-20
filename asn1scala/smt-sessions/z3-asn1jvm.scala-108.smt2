; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2692 () Bool)

(assert start!2692)

(declare-fun b!12994 () Bool)

(declare-fun res!12362 () Bool)

(declare-fun e!7879 () Bool)

(assert (=> b!12994 (=> (not res!12362) (not e!7879))))

(declare-datatypes ((array!707 0))(
  ( (array!708 (arr!737 (Array (_ BitVec 32) (_ BitVec 8))) (size!308 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!576 0))(
  ( (BitStream!577 (buf!659 array!707) (currentByte!1743 (_ BitVec 32)) (currentBit!1738 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!576)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!12994 (= res!12362 (validate_offset_bits!1 ((_ sign_extend 32) (size!308 (buf!659 thiss!1486))) ((_ sign_extend 32) (currentByte!1743 thiss!1486)) ((_ sign_extend 32) (currentBit!1738 thiss!1486)) nBits!460))))

(declare-fun b!12995 () Bool)

(declare-fun res!12364 () Bool)

(declare-fun e!7878 () Bool)

(assert (=> b!12995 (=> (not res!12364) (not e!7878))))

(declare-datatypes ((Unit!1099 0))(
  ( (Unit!1100) )
))
(declare-datatypes ((tuple2!1534 0))(
  ( (tuple2!1535 (_1!822 Unit!1099) (_2!822 BitStream!576)) )
))
(declare-fun lt!20760 () tuple2!1534)

(declare-fun isPrefixOf!0 (BitStream!576 BitStream!576) Bool)

(assert (=> b!12995 (= res!12364 (isPrefixOf!0 thiss!1486 (_2!822 lt!20760)))))

(declare-fun b!12997 () Bool)

(assert (=> b!12997 (= e!7879 e!7878)))

(declare-fun res!12366 () Bool)

(assert (=> b!12997 (=> (not res!12366) (not e!7878))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!12997 (= res!12366 (invariant!0 (currentBit!1738 (_2!822 lt!20760)) (currentByte!1743 (_2!822 lt!20760)) (size!308 (buf!659 (_2!822 lt!20760)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!707)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!576 array!707 (_ BitVec 64) (_ BitVec 64)) tuple2!1534)

(assert (=> b!12997 (= lt!20760 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!12998 () Bool)

(declare-fun e!7882 () Bool)

(assert (=> b!12998 (= e!7878 (not e!7882))))

(declare-fun res!12363 () Bool)

(assert (=> b!12998 (=> res!12363 e!7882)))

(declare-datatypes ((tuple2!1536 0))(
  ( (tuple2!1537 (_1!823 array!707) (_2!823 BitStream!576)) )
))
(declare-fun lt!20757 () tuple2!1536)

(declare-datatypes ((List!184 0))(
  ( (Nil!181) (Cons!180 (h!299 Bool) (t!934 List!184)) )
))
(declare-fun lt!20758 () List!184)

(declare-fun byteArrayBitContentToList!0 (BitStream!576 array!707 (_ BitVec 64) (_ BitVec 64)) List!184)

(assert (=> b!12998 (= res!12363 (not (= (byteArrayBitContentToList!0 (_2!822 lt!20760) (_1!823 lt!20757) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!20758)))))

(declare-datatypes ((tuple2!1538 0))(
  ( (tuple2!1539 (_1!824 BitStream!576) (_2!824 BitStream!576)) )
))
(declare-fun lt!20759 () tuple2!1538)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!576 BitStream!576 (_ BitVec 64)) List!184)

(assert (=> b!12998 (= lt!20758 (bitStreamReadBitsIntoList!0 (_2!822 lt!20760) (_1!824 lt!20759) nBits!460))))

(declare-fun readBits!0 (BitStream!576 (_ BitVec 64)) tuple2!1536)

(assert (=> b!12998 (= lt!20757 (readBits!0 (_1!824 lt!20759) nBits!460))))

(assert (=> b!12998 (validate_offset_bits!1 ((_ sign_extend 32) (size!308 (buf!659 (_2!822 lt!20760)))) ((_ sign_extend 32) (currentByte!1743 thiss!1486)) ((_ sign_extend 32) (currentBit!1738 thiss!1486)) nBits!460)))

(declare-fun lt!20762 () Unit!1099)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!576 array!707 (_ BitVec 64)) Unit!1099)

(assert (=> b!12998 (= lt!20762 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!659 (_2!822 lt!20760)) nBits!460))))

(declare-fun reader!0 (BitStream!576 BitStream!576) tuple2!1538)

(assert (=> b!12998 (= lt!20759 (reader!0 thiss!1486 (_2!822 lt!20760)))))

(declare-fun b!12999 () Bool)

(declare-fun e!7881 () Bool)

(declare-fun array_inv!297 (array!707) Bool)

(assert (=> b!12999 (= e!7881 (array_inv!297 (buf!659 thiss!1486)))))

(declare-fun b!13000 () Bool)

(assert (=> b!13000 (= e!7882 true)))

(declare-fun lt!20761 () Unit!1099)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!576 array!707 array!707 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1099)

(assert (=> b!13000 (= lt!20761 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!822 lt!20760) srcBuffer!6 (_1!823 lt!20757) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!13001 () Bool)

(declare-fun res!12367 () Bool)

(assert (=> b!13001 (=> res!12367 e!7882)))

(assert (=> b!13001 (= res!12367 (not (= lt!20758 (byteArrayBitContentToList!0 (_2!822 lt!20760) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!13002 () Bool)

(declare-fun res!12360 () Bool)

(assert (=> b!13002 (=> (not res!12360) (not e!7878))))

(assert (=> b!13002 (= res!12360 (= (size!308 (buf!659 thiss!1486)) (size!308 (buf!659 (_2!822 lt!20760)))))))

(declare-fun b!12996 () Bool)

(declare-fun res!12361 () Bool)

(assert (=> b!12996 (=> (not res!12361) (not e!7878))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!12996 (= res!12361 (= (bitIndex!0 (size!308 (buf!659 (_2!822 lt!20760))) (currentByte!1743 (_2!822 lt!20760)) (currentBit!1738 (_2!822 lt!20760))) (bvadd (bitIndex!0 (size!308 (buf!659 thiss!1486)) (currentByte!1743 thiss!1486) (currentBit!1738 thiss!1486)) nBits!460)))))

(declare-fun res!12365 () Bool)

(assert (=> start!2692 (=> (not res!12365) (not e!7879))))

(assert (=> start!2692 (= res!12365 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!308 srcBuffer!6))))))))

(assert (=> start!2692 e!7879))

(assert (=> start!2692 true))

(assert (=> start!2692 (array_inv!297 srcBuffer!6)))

(declare-fun inv!12 (BitStream!576) Bool)

(assert (=> start!2692 (and (inv!12 thiss!1486) e!7881)))

(assert (= (and start!2692 res!12365) b!12994))

(assert (= (and b!12994 res!12362) b!12997))

(assert (= (and b!12997 res!12366) b!13002))

(assert (= (and b!13002 res!12360) b!12996))

(assert (= (and b!12996 res!12361) b!12995))

(assert (= (and b!12995 res!12364) b!12998))

(assert (= (and b!12998 (not res!12363)) b!13001))

(assert (= (and b!13001 (not res!12367)) b!13000))

(assert (= start!2692 b!12999))

(declare-fun m!19593 () Bool)

(assert (=> b!12996 m!19593))

(declare-fun m!19595 () Bool)

(assert (=> b!12996 m!19595))

(declare-fun m!19597 () Bool)

(assert (=> b!12995 m!19597))

(declare-fun m!19599 () Bool)

(assert (=> b!12994 m!19599))

(declare-fun m!19601 () Bool)

(assert (=> b!12997 m!19601))

(declare-fun m!19603 () Bool)

(assert (=> b!12997 m!19603))

(declare-fun m!19605 () Bool)

(assert (=> b!13000 m!19605))

(declare-fun m!19607 () Bool)

(assert (=> start!2692 m!19607))

(declare-fun m!19609 () Bool)

(assert (=> start!2692 m!19609))

(declare-fun m!19611 () Bool)

(assert (=> b!13001 m!19611))

(declare-fun m!19613 () Bool)

(assert (=> b!12998 m!19613))

(declare-fun m!19615 () Bool)

(assert (=> b!12998 m!19615))

(declare-fun m!19617 () Bool)

(assert (=> b!12998 m!19617))

(declare-fun m!19619 () Bool)

(assert (=> b!12998 m!19619))

(declare-fun m!19621 () Bool)

(assert (=> b!12998 m!19621))

(declare-fun m!19623 () Bool)

(assert (=> b!12998 m!19623))

(declare-fun m!19625 () Bool)

(assert (=> b!12999 m!19625))

(check-sat (not b!13001) (not start!2692) (not b!12995) (not b!12998) (not b!12999) (not b!12996) (not b!12997) (not b!12994) (not b!13000))
