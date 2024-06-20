; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54068 () Bool)

(assert start!54068)

(declare-fun b!251704 () Bool)

(declare-fun e!174403 () Bool)

(declare-fun e!174406 () Bool)

(assert (=> b!251704 (= e!174403 e!174406)))

(declare-fun res!210822 () Bool)

(assert (=> b!251704 (=> (not res!210822) (not e!174406))))

(declare-datatypes ((array!13692 0))(
  ( (array!13693 (arr!6992 (Array (_ BitVec 32) (_ BitVec 8))) (size!6005 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10932 0))(
  ( (BitStream!10933 (buf!6507 array!13692) (currentByte!11962 (_ BitVec 32)) (currentBit!11957 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!18158 0))(
  ( (Unit!18159) )
))
(declare-datatypes ((tuple2!21600 0))(
  ( (tuple2!21601 (_1!11728 Unit!18158) (_2!11728 BitStream!10932)) )
))
(declare-fun lt!391103 () tuple2!21600)

(declare-fun lt!391096 () tuple2!21600)

(declare-fun lt!391090 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!251704 (= res!210822 (= (bitIndex!0 (size!6005 (buf!6507 (_2!11728 lt!391096))) (currentByte!11962 (_2!11728 lt!391096)) (currentBit!11957 (_2!11728 lt!391096))) (bvadd (bitIndex!0 (size!6005 (buf!6507 (_2!11728 lt!391103))) (currentByte!11962 (_2!11728 lt!391103)) (currentBit!11957 (_2!11728 lt!391103))) lt!391090)))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!251704 (= lt!391090 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun res!210818 () Bool)

(declare-fun e!174405 () Bool)

(assert (=> start!54068 (=> (not res!210818) (not e!174405))))

(assert (=> start!54068 (= res!210818 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54068 e!174405))

(assert (=> start!54068 true))

(declare-fun thiss!1005 () BitStream!10932)

(declare-fun e!174404 () Bool)

(declare-fun inv!12 (BitStream!10932) Bool)

(assert (=> start!54068 (and (inv!12 thiss!1005) e!174404)))

(declare-fun b!251705 () Bool)

(declare-fun res!210813 () Bool)

(assert (=> b!251705 (=> (not res!210813) (not e!174406))))

(declare-fun isPrefixOf!0 (BitStream!10932 BitStream!10932) Bool)

(assert (=> b!251705 (= res!210813 (isPrefixOf!0 (_2!11728 lt!391103) (_2!11728 lt!391096)))))

(declare-fun b!251706 () Bool)

(declare-fun e!174409 () Bool)

(declare-datatypes ((tuple2!21602 0))(
  ( (tuple2!21603 (_1!11729 BitStream!10932) (_2!11729 Bool)) )
))
(declare-fun lt!391100 () tuple2!21602)

(declare-fun lt!391094 () (_ BitVec 64))

(assert (=> b!251706 (= e!174409 (= (bitIndex!0 (size!6005 (buf!6507 (_1!11729 lt!391100))) (currentByte!11962 (_1!11729 lt!391100)) (currentBit!11957 (_1!11729 lt!391100))) lt!391094))))

(declare-fun b!251707 () Bool)

(assert (=> b!251707 (= e!174405 (not true))))

(declare-datatypes ((tuple2!21604 0))(
  ( (tuple2!21605 (_1!11730 BitStream!10932) (_2!11730 BitStream!10932)) )
))
(declare-fun lt!391095 () tuple2!21604)

(declare-fun bit!26 () Bool)

(declare-fun readBitPure!0 (BitStream!10932) tuple2!21602)

(assert (=> b!251707 (= (_2!11729 (readBitPure!0 (_1!11730 lt!391095))) bit!26)))

(declare-fun lt!391104 () tuple2!21604)

(declare-fun reader!0 (BitStream!10932 BitStream!10932) tuple2!21604)

(assert (=> b!251707 (= lt!391104 (reader!0 (_2!11728 lt!391103) (_2!11728 lt!391096)))))

(assert (=> b!251707 (= lt!391095 (reader!0 thiss!1005 (_2!11728 lt!391096)))))

(declare-fun e!174410 () Bool)

(assert (=> b!251707 e!174410))

(declare-fun res!210815 () Bool)

(assert (=> b!251707 (=> (not res!210815) (not e!174410))))

(declare-fun lt!391092 () tuple2!21602)

(declare-fun lt!391091 () tuple2!21602)

(assert (=> b!251707 (= res!210815 (= (bitIndex!0 (size!6005 (buf!6507 (_1!11729 lt!391092))) (currentByte!11962 (_1!11729 lt!391092)) (currentBit!11957 (_1!11729 lt!391092))) (bitIndex!0 (size!6005 (buf!6507 (_1!11729 lt!391091))) (currentByte!11962 (_1!11729 lt!391091)) (currentBit!11957 (_1!11729 lt!391091)))))))

(declare-fun lt!391098 () Unit!18158)

(declare-fun lt!391097 () BitStream!10932)

(declare-fun readBitPrefixLemma!0 (BitStream!10932 BitStream!10932) Unit!18158)

(assert (=> b!251707 (= lt!391098 (readBitPrefixLemma!0 lt!391097 (_2!11728 lt!391096)))))

(assert (=> b!251707 (= lt!391091 (readBitPure!0 (BitStream!10933 (buf!6507 (_2!11728 lt!391096)) (currentByte!11962 thiss!1005) (currentBit!11957 thiss!1005))))))

(assert (=> b!251707 (= lt!391092 (readBitPure!0 lt!391097))))

(assert (=> b!251707 (= lt!391097 (BitStream!10933 (buf!6507 (_2!11728 lt!391103)) (currentByte!11962 thiss!1005) (currentBit!11957 thiss!1005)))))

(declare-fun e!174402 () Bool)

(assert (=> b!251707 e!174402))

(declare-fun res!210820 () Bool)

(assert (=> b!251707 (=> (not res!210820) (not e!174402))))

(assert (=> b!251707 (= res!210820 (isPrefixOf!0 thiss!1005 (_2!11728 lt!391096)))))

(declare-fun lt!391101 () Unit!18158)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10932 BitStream!10932 BitStream!10932) Unit!18158)

(assert (=> b!251707 (= lt!391101 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11728 lt!391103) (_2!11728 lt!391096)))))

(assert (=> b!251707 e!174403))

(declare-fun res!210821 () Bool)

(assert (=> b!251707 (=> (not res!210821) (not e!174403))))

(assert (=> b!251707 (= res!210821 (= (size!6005 (buf!6507 (_2!11728 lt!391103))) (size!6005 (buf!6507 (_2!11728 lt!391096)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10932 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21600)

(assert (=> b!251707 (= lt!391096 (appendNBitsLoop!0 (_2!11728 lt!391103) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!251707 (validate_offset_bits!1 ((_ sign_extend 32) (size!6005 (buf!6507 (_2!11728 lt!391103)))) ((_ sign_extend 32) (currentByte!11962 (_2!11728 lt!391103))) ((_ sign_extend 32) (currentBit!11957 (_2!11728 lt!391103))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!391099 () Unit!18158)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10932 BitStream!10932 (_ BitVec 64) (_ BitVec 64)) Unit!18158)

(assert (=> b!251707 (= lt!391099 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11728 lt!391103) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!174407 () Bool)

(assert (=> b!251707 e!174407))

(declare-fun res!210811 () Bool)

(assert (=> b!251707 (=> (not res!210811) (not e!174407))))

(assert (=> b!251707 (= res!210811 (= (size!6005 (buf!6507 thiss!1005)) (size!6005 (buf!6507 (_2!11728 lt!391103)))))))

(declare-fun appendBit!0 (BitStream!10932 Bool) tuple2!21600)

(assert (=> b!251707 (= lt!391103 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!251708 () Bool)

(declare-fun res!210819 () Bool)

(assert (=> b!251708 (=> (not res!210819) (not e!174405))))

(assert (=> b!251708 (= res!210819 (validate_offset_bits!1 ((_ sign_extend 32) (size!6005 (buf!6507 thiss!1005))) ((_ sign_extend 32) (currentByte!11962 thiss!1005)) ((_ sign_extend 32) (currentBit!11957 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!251709 () Bool)

(assert (=> b!251709 (= e!174410 (= (_2!11729 lt!391092) (_2!11729 lt!391091)))))

(declare-fun b!251710 () Bool)

(declare-fun res!210814 () Bool)

(declare-fun e!174401 () Bool)

(assert (=> b!251710 (=> (not res!210814) (not e!174401))))

(assert (=> b!251710 (= res!210814 (isPrefixOf!0 thiss!1005 (_2!11728 lt!391103)))))

(declare-fun b!251711 () Bool)

(declare-fun lt!391089 () tuple2!21602)

(declare-fun lt!391093 () tuple2!21604)

(assert (=> b!251711 (= e!174406 (not (or (not (_2!11729 lt!391089)) (not (= (_1!11729 lt!391089) (_2!11730 lt!391093))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10932 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21602)

(assert (=> b!251711 (= lt!391089 (checkBitsLoopPure!0 (_1!11730 lt!391093) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!251711 (validate_offset_bits!1 ((_ sign_extend 32) (size!6005 (buf!6507 (_2!11728 lt!391096)))) ((_ sign_extend 32) (currentByte!11962 (_2!11728 lt!391103))) ((_ sign_extend 32) (currentBit!11957 (_2!11728 lt!391103))) lt!391090)))

(declare-fun lt!391088 () Unit!18158)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10932 array!13692 (_ BitVec 64)) Unit!18158)

(assert (=> b!251711 (= lt!391088 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11728 lt!391103) (buf!6507 (_2!11728 lt!391096)) lt!391090))))

(assert (=> b!251711 (= lt!391093 (reader!0 (_2!11728 lt!391103) (_2!11728 lt!391096)))))

(declare-fun b!251712 () Bool)

(declare-fun res!210817 () Bool)

(assert (=> b!251712 (=> (not res!210817) (not e!174402))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!251712 (= res!210817 (invariant!0 (currentBit!11957 thiss!1005) (currentByte!11962 thiss!1005) (size!6005 (buf!6507 (_2!11728 lt!391103)))))))

(declare-fun b!251713 () Bool)

(declare-fun array_inv!5746 (array!13692) Bool)

(assert (=> b!251713 (= e!174404 (array_inv!5746 (buf!6507 thiss!1005)))))

(declare-fun b!251714 () Bool)

(assert (=> b!251714 (= e!174402 (invariant!0 (currentBit!11957 thiss!1005) (currentByte!11962 thiss!1005) (size!6005 (buf!6507 (_2!11728 lt!391096)))))))

(declare-fun b!251715 () Bool)

(declare-fun res!210810 () Bool)

(assert (=> b!251715 (=> (not res!210810) (not e!174405))))

(assert (=> b!251715 (= res!210810 (bvslt from!289 nBits!297))))

(declare-fun b!251716 () Bool)

(assert (=> b!251716 (= e!174407 e!174401)))

(declare-fun res!210812 () Bool)

(assert (=> b!251716 (=> (not res!210812) (not e!174401))))

(declare-fun lt!391102 () (_ BitVec 64))

(assert (=> b!251716 (= res!210812 (= lt!391094 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!391102)))))

(assert (=> b!251716 (= lt!391094 (bitIndex!0 (size!6005 (buf!6507 (_2!11728 lt!391103))) (currentByte!11962 (_2!11728 lt!391103)) (currentBit!11957 (_2!11728 lt!391103))))))

(assert (=> b!251716 (= lt!391102 (bitIndex!0 (size!6005 (buf!6507 thiss!1005)) (currentByte!11962 thiss!1005) (currentBit!11957 thiss!1005)))))

(declare-fun b!251717 () Bool)

(assert (=> b!251717 (= e!174401 e!174409)))

(declare-fun res!210816 () Bool)

(assert (=> b!251717 (=> (not res!210816) (not e!174409))))

(assert (=> b!251717 (= res!210816 (and (= (_2!11729 lt!391100) bit!26) (= (_1!11729 lt!391100) (_2!11728 lt!391103))))))

(declare-fun readerFrom!0 (BitStream!10932 (_ BitVec 32) (_ BitVec 32)) BitStream!10932)

(assert (=> b!251717 (= lt!391100 (readBitPure!0 (readerFrom!0 (_2!11728 lt!391103) (currentBit!11957 thiss!1005) (currentByte!11962 thiss!1005))))))

(assert (= (and start!54068 res!210818) b!251708))

(assert (= (and b!251708 res!210819) b!251715))

(assert (= (and b!251715 res!210810) b!251707))

(assert (= (and b!251707 res!210811) b!251716))

(assert (= (and b!251716 res!210812) b!251710))

(assert (= (and b!251710 res!210814) b!251717))

(assert (= (and b!251717 res!210816) b!251706))

(assert (= (and b!251707 res!210821) b!251704))

(assert (= (and b!251704 res!210822) b!251705))

(assert (= (and b!251705 res!210813) b!251711))

(assert (= (and b!251707 res!210820) b!251712))

(assert (= (and b!251712 res!210817) b!251714))

(assert (= (and b!251707 res!210815) b!251709))

(assert (= start!54068 b!251713))

(declare-fun m!378687 () Bool)

(assert (=> b!251706 m!378687))

(declare-fun m!378689 () Bool)

(assert (=> b!251711 m!378689))

(declare-fun m!378691 () Bool)

(assert (=> b!251711 m!378691))

(declare-fun m!378693 () Bool)

(assert (=> b!251711 m!378693))

(declare-fun m!378695 () Bool)

(assert (=> b!251711 m!378695))

(declare-fun m!378697 () Bool)

(assert (=> b!251717 m!378697))

(assert (=> b!251717 m!378697))

(declare-fun m!378699 () Bool)

(assert (=> b!251717 m!378699))

(declare-fun m!378701 () Bool)

(assert (=> b!251712 m!378701))

(declare-fun m!378703 () Bool)

(assert (=> b!251713 m!378703))

(declare-fun m!378705 () Bool)

(assert (=> b!251716 m!378705))

(declare-fun m!378707 () Bool)

(assert (=> b!251716 m!378707))

(declare-fun m!378709 () Bool)

(assert (=> b!251708 m!378709))

(declare-fun m!378711 () Bool)

(assert (=> b!251714 m!378711))

(declare-fun m!378713 () Bool)

(assert (=> b!251705 m!378713))

(declare-fun m!378715 () Bool)

(assert (=> start!54068 m!378715))

(declare-fun m!378717 () Bool)

(assert (=> b!251710 m!378717))

(declare-fun m!378719 () Bool)

(assert (=> b!251704 m!378719))

(assert (=> b!251704 m!378705))

(declare-fun m!378721 () Bool)

(assert (=> b!251707 m!378721))

(declare-fun m!378723 () Bool)

(assert (=> b!251707 m!378723))

(declare-fun m!378725 () Bool)

(assert (=> b!251707 m!378725))

(declare-fun m!378727 () Bool)

(assert (=> b!251707 m!378727))

(declare-fun m!378729 () Bool)

(assert (=> b!251707 m!378729))

(declare-fun m!378731 () Bool)

(assert (=> b!251707 m!378731))

(declare-fun m!378733 () Bool)

(assert (=> b!251707 m!378733))

(declare-fun m!378735 () Bool)

(assert (=> b!251707 m!378735))

(assert (=> b!251707 m!378695))

(declare-fun m!378737 () Bool)

(assert (=> b!251707 m!378737))

(declare-fun m!378739 () Bool)

(assert (=> b!251707 m!378739))

(declare-fun m!378741 () Bool)

(assert (=> b!251707 m!378741))

(declare-fun m!378743 () Bool)

(assert (=> b!251707 m!378743))

(declare-fun m!378745 () Bool)

(assert (=> b!251707 m!378745))

(check-sat (not b!251711) (not b!251706) (not b!251705) (not b!251712) (not b!251704) (not b!251717) (not b!251707) (not b!251716) (not start!54068) (not b!251710) (not b!251708) (not b!251713) (not b!251714))
