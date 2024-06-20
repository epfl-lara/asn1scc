; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54064 () Bool)

(assert start!54064)

(declare-fun b!251620 () Bool)

(declare-fun e!174341 () Bool)

(declare-fun e!174342 () Bool)

(assert (=> b!251620 (= e!174341 e!174342)))

(declare-fun res!210738 () Bool)

(assert (=> b!251620 (=> (not res!210738) (not e!174342))))

(declare-fun lt!390993 () (_ BitVec 64))

(declare-datatypes ((array!13688 0))(
  ( (array!13689 (arr!6990 (Array (_ BitVec 32) (_ BitVec 8))) (size!6003 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10928 0))(
  ( (BitStream!10929 (buf!6505 array!13688) (currentByte!11960 (_ BitVec 32)) (currentBit!11955 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!18154 0))(
  ( (Unit!18155) )
))
(declare-datatypes ((tuple2!21588 0))(
  ( (tuple2!21589 (_1!11722 Unit!18154) (_2!11722 BitStream!10928)) )
))
(declare-fun lt!391002 () tuple2!21588)

(declare-fun lt!390987 () tuple2!21588)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!251620 (= res!210738 (= (bitIndex!0 (size!6003 (buf!6505 (_2!11722 lt!391002))) (currentByte!11960 (_2!11722 lt!391002)) (currentBit!11955 (_2!11722 lt!391002))) (bvadd (bitIndex!0 (size!6003 (buf!6505 (_2!11722 lt!390987))) (currentByte!11960 (_2!11722 lt!390987)) (currentBit!11955 (_2!11722 lt!390987))) lt!390993)))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!251620 (= lt!390993 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!251621 () Bool)

(declare-fun e!174350 () Bool)

(declare-datatypes ((tuple2!21590 0))(
  ( (tuple2!21591 (_1!11723 BitStream!10928) (_2!11723 Bool)) )
))
(declare-fun lt!390996 () tuple2!21590)

(declare-fun lt!390997 () (_ BitVec 64))

(assert (=> b!251621 (= e!174350 (= (bitIndex!0 (size!6003 (buf!6505 (_1!11723 lt!390996))) (currentByte!11960 (_1!11723 lt!390996)) (currentBit!11955 (_1!11723 lt!390996))) lt!390997))))

(declare-fun b!251622 () Bool)

(declare-fun res!210737 () Bool)

(declare-fun e!174343 () Bool)

(assert (=> b!251622 (=> (not res!210737) (not e!174343))))

(declare-fun thiss!1005 () BitStream!10928)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!251622 (= res!210737 (validate_offset_bits!1 ((_ sign_extend 32) (size!6003 (buf!6505 thiss!1005))) ((_ sign_extend 32) (currentByte!11960 thiss!1005)) ((_ sign_extend 32) (currentBit!11955 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!251623 () Bool)

(declare-fun res!210740 () Bool)

(declare-fun e!174349 () Bool)

(assert (=> b!251623 (=> (not res!210740) (not e!174349))))

(declare-fun isPrefixOf!0 (BitStream!10928 BitStream!10928) Bool)

(assert (=> b!251623 (= res!210740 (isPrefixOf!0 thiss!1005 (_2!11722 lt!390987)))))

(declare-fun b!251624 () Bool)

(declare-fun e!174347 () Bool)

(declare-fun lt!390998 () tuple2!21590)

(declare-fun lt!390992 () tuple2!21590)

(assert (=> b!251624 (= e!174347 (= (_2!11723 lt!390998) (_2!11723 lt!390992)))))

(declare-fun b!251625 () Bool)

(declare-fun e!174345 () Bool)

(declare-fun array_inv!5744 (array!13688) Bool)

(assert (=> b!251625 (= e!174345 (array_inv!5744 (buf!6505 thiss!1005)))))

(declare-fun b!251626 () Bool)

(declare-fun res!210743 () Bool)

(assert (=> b!251626 (=> (not res!210743) (not e!174342))))

(assert (=> b!251626 (= res!210743 (isPrefixOf!0 (_2!11722 lt!390987) (_2!11722 lt!391002)))))

(declare-fun res!210734 () Bool)

(assert (=> start!54064 (=> (not res!210734) (not e!174343))))

(assert (=> start!54064 (= res!210734 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54064 e!174343))

(assert (=> start!54064 true))

(declare-fun inv!12 (BitStream!10928) Bool)

(assert (=> start!54064 (and (inv!12 thiss!1005) e!174345)))

(declare-fun b!251627 () Bool)

(declare-fun lt!390988 () tuple2!21590)

(declare-datatypes ((tuple2!21592 0))(
  ( (tuple2!21593 (_1!11724 BitStream!10928) (_2!11724 BitStream!10928)) )
))
(declare-fun lt!390994 () tuple2!21592)

(assert (=> b!251627 (= e!174342 (not (or (not (_2!11723 lt!390988)) (not (= (_1!11723 lt!390988) (_2!11724 lt!390994))))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10928 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21590)

(assert (=> b!251627 (= lt!390988 (checkBitsLoopPure!0 (_1!11724 lt!390994) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!251627 (validate_offset_bits!1 ((_ sign_extend 32) (size!6003 (buf!6505 (_2!11722 lt!391002)))) ((_ sign_extend 32) (currentByte!11960 (_2!11722 lt!390987))) ((_ sign_extend 32) (currentBit!11955 (_2!11722 lt!390987))) lt!390993)))

(declare-fun lt!391000 () Unit!18154)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10928 array!13688 (_ BitVec 64)) Unit!18154)

(assert (=> b!251627 (= lt!391000 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11722 lt!390987) (buf!6505 (_2!11722 lt!391002)) lt!390993))))

(declare-fun reader!0 (BitStream!10928 BitStream!10928) tuple2!21592)

(assert (=> b!251627 (= lt!390994 (reader!0 (_2!11722 lt!390987) (_2!11722 lt!391002)))))

(declare-fun b!251628 () Bool)

(assert (=> b!251628 (= e!174349 e!174350)))

(declare-fun res!210739 () Bool)

(assert (=> b!251628 (=> (not res!210739) (not e!174350))))

(assert (=> b!251628 (= res!210739 (and (= (_2!11723 lt!390996) bit!26) (= (_1!11723 lt!390996) (_2!11722 lt!390987))))))

(declare-fun readBitPure!0 (BitStream!10928) tuple2!21590)

(declare-fun readerFrom!0 (BitStream!10928 (_ BitVec 32) (_ BitVec 32)) BitStream!10928)

(assert (=> b!251628 (= lt!390996 (readBitPure!0 (readerFrom!0 (_2!11722 lt!390987) (currentBit!11955 thiss!1005) (currentByte!11960 thiss!1005))))))

(declare-fun b!251629 () Bool)

(declare-fun res!210744 () Bool)

(assert (=> b!251629 (=> (not res!210744) (not e!174343))))

(assert (=> b!251629 (= res!210744 (bvslt from!289 nBits!297))))

(declare-fun b!251630 () Bool)

(declare-fun res!210736 () Bool)

(declare-fun e!174348 () Bool)

(assert (=> b!251630 (=> (not res!210736) (not e!174348))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!251630 (= res!210736 (invariant!0 (currentBit!11955 thiss!1005) (currentByte!11960 thiss!1005) (size!6003 (buf!6505 (_2!11722 lt!390987)))))))

(declare-fun b!251631 () Bool)

(assert (=> b!251631 (= e!174343 (not (= (size!6003 (buf!6505 thiss!1005)) (size!6003 (buf!6505 (_2!11722 lt!391002))))))))

(declare-fun lt!390999 () tuple2!21592)

(assert (=> b!251631 (= (_2!11723 (readBitPure!0 (_1!11724 lt!390999))) bit!26)))

(declare-fun lt!390991 () tuple2!21592)

(assert (=> b!251631 (= lt!390991 (reader!0 (_2!11722 lt!390987) (_2!11722 lt!391002)))))

(assert (=> b!251631 (= lt!390999 (reader!0 thiss!1005 (_2!11722 lt!391002)))))

(assert (=> b!251631 e!174347))

(declare-fun res!210741 () Bool)

(assert (=> b!251631 (=> (not res!210741) (not e!174347))))

(assert (=> b!251631 (= res!210741 (= (bitIndex!0 (size!6003 (buf!6505 (_1!11723 lt!390998))) (currentByte!11960 (_1!11723 lt!390998)) (currentBit!11955 (_1!11723 lt!390998))) (bitIndex!0 (size!6003 (buf!6505 (_1!11723 lt!390992))) (currentByte!11960 (_1!11723 lt!390992)) (currentBit!11955 (_1!11723 lt!390992)))))))

(declare-fun lt!390989 () Unit!18154)

(declare-fun lt!390986 () BitStream!10928)

(declare-fun readBitPrefixLemma!0 (BitStream!10928 BitStream!10928) Unit!18154)

(assert (=> b!251631 (= lt!390989 (readBitPrefixLemma!0 lt!390986 (_2!11722 lt!391002)))))

(assert (=> b!251631 (= lt!390992 (readBitPure!0 (BitStream!10929 (buf!6505 (_2!11722 lt!391002)) (currentByte!11960 thiss!1005) (currentBit!11955 thiss!1005))))))

(assert (=> b!251631 (= lt!390998 (readBitPure!0 lt!390986))))

(assert (=> b!251631 (= lt!390986 (BitStream!10929 (buf!6505 (_2!11722 lt!390987)) (currentByte!11960 thiss!1005) (currentBit!11955 thiss!1005)))))

(assert (=> b!251631 e!174348))

(declare-fun res!210742 () Bool)

(assert (=> b!251631 (=> (not res!210742) (not e!174348))))

(assert (=> b!251631 (= res!210742 (isPrefixOf!0 thiss!1005 (_2!11722 lt!391002)))))

(declare-fun lt!391001 () Unit!18154)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10928 BitStream!10928 BitStream!10928) Unit!18154)

(assert (=> b!251631 (= lt!391001 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11722 lt!390987) (_2!11722 lt!391002)))))

(assert (=> b!251631 e!174341))

(declare-fun res!210733 () Bool)

(assert (=> b!251631 (=> (not res!210733) (not e!174341))))

(assert (=> b!251631 (= res!210733 (= (size!6003 (buf!6505 (_2!11722 lt!390987))) (size!6003 (buf!6505 (_2!11722 lt!391002)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10928 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21588)

(assert (=> b!251631 (= lt!391002 (appendNBitsLoop!0 (_2!11722 lt!390987) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!251631 (validate_offset_bits!1 ((_ sign_extend 32) (size!6003 (buf!6505 (_2!11722 lt!390987)))) ((_ sign_extend 32) (currentByte!11960 (_2!11722 lt!390987))) ((_ sign_extend 32) (currentBit!11955 (_2!11722 lt!390987))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!390990 () Unit!18154)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10928 BitStream!10928 (_ BitVec 64) (_ BitVec 64)) Unit!18154)

(assert (=> b!251631 (= lt!390990 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11722 lt!390987) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!174346 () Bool)

(assert (=> b!251631 e!174346))

(declare-fun res!210735 () Bool)

(assert (=> b!251631 (=> (not res!210735) (not e!174346))))

(assert (=> b!251631 (= res!210735 (= (size!6003 (buf!6505 thiss!1005)) (size!6003 (buf!6505 (_2!11722 lt!390987)))))))

(declare-fun appendBit!0 (BitStream!10928 Bool) tuple2!21588)

(assert (=> b!251631 (= lt!390987 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!251632 () Bool)

(assert (=> b!251632 (= e!174346 e!174349)))

(declare-fun res!210732 () Bool)

(assert (=> b!251632 (=> (not res!210732) (not e!174349))))

(declare-fun lt!390995 () (_ BitVec 64))

(assert (=> b!251632 (= res!210732 (= lt!390997 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!390995)))))

(assert (=> b!251632 (= lt!390997 (bitIndex!0 (size!6003 (buf!6505 (_2!11722 lt!390987))) (currentByte!11960 (_2!11722 lt!390987)) (currentBit!11955 (_2!11722 lt!390987))))))

(assert (=> b!251632 (= lt!390995 (bitIndex!0 (size!6003 (buf!6505 thiss!1005)) (currentByte!11960 thiss!1005) (currentBit!11955 thiss!1005)))))

(declare-fun b!251633 () Bool)

(assert (=> b!251633 (= e!174348 (invariant!0 (currentBit!11955 thiss!1005) (currentByte!11960 thiss!1005) (size!6003 (buf!6505 (_2!11722 lt!391002)))))))

(assert (= (and start!54064 res!210734) b!251622))

(assert (= (and b!251622 res!210737) b!251629))

(assert (= (and b!251629 res!210744) b!251631))

(assert (= (and b!251631 res!210735) b!251632))

(assert (= (and b!251632 res!210732) b!251623))

(assert (= (and b!251623 res!210740) b!251628))

(assert (= (and b!251628 res!210739) b!251621))

(assert (= (and b!251631 res!210733) b!251620))

(assert (= (and b!251620 res!210738) b!251626))

(assert (= (and b!251626 res!210743) b!251627))

(assert (= (and b!251631 res!210742) b!251630))

(assert (= (and b!251630 res!210736) b!251633))

(assert (= (and b!251631 res!210741) b!251624))

(assert (= start!54064 b!251625))

(declare-fun m!378567 () Bool)

(assert (=> b!251620 m!378567))

(declare-fun m!378569 () Bool)

(assert (=> b!251620 m!378569))

(declare-fun m!378571 () Bool)

(assert (=> b!251622 m!378571))

(assert (=> b!251632 m!378569))

(declare-fun m!378573 () Bool)

(assert (=> b!251632 m!378573))

(declare-fun m!378575 () Bool)

(assert (=> b!251630 m!378575))

(declare-fun m!378577 () Bool)

(assert (=> b!251623 m!378577))

(declare-fun m!378579 () Bool)

(assert (=> b!251627 m!378579))

(declare-fun m!378581 () Bool)

(assert (=> b!251627 m!378581))

(declare-fun m!378583 () Bool)

(assert (=> b!251627 m!378583))

(declare-fun m!378585 () Bool)

(assert (=> b!251627 m!378585))

(declare-fun m!378587 () Bool)

(assert (=> b!251628 m!378587))

(assert (=> b!251628 m!378587))

(declare-fun m!378589 () Bool)

(assert (=> b!251628 m!378589))

(declare-fun m!378591 () Bool)

(assert (=> b!251633 m!378591))

(declare-fun m!378593 () Bool)

(assert (=> start!54064 m!378593))

(declare-fun m!378595 () Bool)

(assert (=> b!251626 m!378595))

(declare-fun m!378597 () Bool)

(assert (=> b!251621 m!378597))

(declare-fun m!378599 () Bool)

(assert (=> b!251625 m!378599))

(declare-fun m!378601 () Bool)

(assert (=> b!251631 m!378601))

(declare-fun m!378603 () Bool)

(assert (=> b!251631 m!378603))

(declare-fun m!378605 () Bool)

(assert (=> b!251631 m!378605))

(declare-fun m!378607 () Bool)

(assert (=> b!251631 m!378607))

(declare-fun m!378609 () Bool)

(assert (=> b!251631 m!378609))

(declare-fun m!378611 () Bool)

(assert (=> b!251631 m!378611))

(declare-fun m!378613 () Bool)

(assert (=> b!251631 m!378613))

(declare-fun m!378615 () Bool)

(assert (=> b!251631 m!378615))

(declare-fun m!378617 () Bool)

(assert (=> b!251631 m!378617))

(assert (=> b!251631 m!378585))

(declare-fun m!378619 () Bool)

(assert (=> b!251631 m!378619))

(declare-fun m!378621 () Bool)

(assert (=> b!251631 m!378621))

(declare-fun m!378623 () Bool)

(assert (=> b!251631 m!378623))

(declare-fun m!378625 () Bool)

(assert (=> b!251631 m!378625))

(push 1)

