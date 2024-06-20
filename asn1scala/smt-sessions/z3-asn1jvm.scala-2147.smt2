; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54650 () Bool)

(assert start!54650)

(declare-fun b!255987 () Bool)

(declare-fun res!214615 () Bool)

(declare-fun e!177340 () Bool)

(assert (=> b!255987 (=> (not res!214615) (not e!177340))))

(declare-fun from!289 () (_ BitVec 64))

(declare-datatypes ((array!13797 0))(
  ( (array!13798 (arr!7040 (Array (_ BitVec 32) (_ BitVec 8))) (size!6053 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11028 0))(
  ( (BitStream!11029 (buf!6570 array!13797) (currentByte!12049 (_ BitVec 32)) (currentBit!12044 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!18314 0))(
  ( (Unit!18315) )
))
(declare-datatypes ((tuple2!21906 0))(
  ( (tuple2!21907 (_1!11887 Unit!18314) (_2!11887 BitStream!11028)) )
))
(declare-fun lt!397508 () tuple2!21906)

(declare-fun thiss!1005 () BitStream!11028)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!255987 (= res!214615 (= (bitIndex!0 (size!6053 (buf!6570 (_2!11887 lt!397508))) (currentByte!12049 (_2!11887 lt!397508)) (currentBit!12044 (_2!11887 lt!397508))) (bvadd (bitIndex!0 (size!6053 (buf!6570 thiss!1005)) (currentByte!12049 thiss!1005) (currentBit!12044 thiss!1005)) (bvsub nBits!297 from!289))))))

(declare-fun b!255988 () Bool)

(declare-fun e!177348 () Bool)

(declare-datatypes ((tuple2!21908 0))(
  ( (tuple2!21909 (_1!11888 BitStream!11028) (_2!11888 Bool)) )
))
(declare-fun lt!397504 () tuple2!21908)

(declare-datatypes ((tuple2!21910 0))(
  ( (tuple2!21911 (_1!11889 BitStream!11028) (_2!11889 BitStream!11028)) )
))
(declare-fun lt!397509 () tuple2!21910)

(assert (=> b!255988 (= e!177348 (not (or (not (_2!11888 lt!397504)) (not (= (_1!11888 lt!397504) (_2!11889 lt!397509))))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!11028 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21908)

(assert (=> b!255988 (= lt!397504 (checkBitsLoopPure!0 (_1!11889 lt!397509) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!397495 () tuple2!21906)

(declare-fun lt!397507 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!255988 (validate_offset_bits!1 ((_ sign_extend 32) (size!6053 (buf!6570 (_2!11887 lt!397508)))) ((_ sign_extend 32) (currentByte!12049 (_2!11887 lt!397495))) ((_ sign_extend 32) (currentBit!12044 (_2!11887 lt!397495))) lt!397507)))

(declare-fun lt!397505 () Unit!18314)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!11028 array!13797 (_ BitVec 64)) Unit!18314)

(assert (=> b!255988 (= lt!397505 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11887 lt!397495) (buf!6570 (_2!11887 lt!397508)) lt!397507))))

(declare-fun reader!0 (BitStream!11028 BitStream!11028) tuple2!21910)

(assert (=> b!255988 (= lt!397509 (reader!0 (_2!11887 lt!397495) (_2!11887 lt!397508)))))

(declare-fun b!255989 () Bool)

(declare-fun e!177343 () Bool)

(declare-fun e!177341 () Bool)

(assert (=> b!255989 (= e!177343 e!177341)))

(declare-fun res!214629 () Bool)

(assert (=> b!255989 (=> (not res!214629) (not e!177341))))

(declare-fun lt!397498 () tuple2!21908)

(assert (=> b!255989 (= res!214629 (and (= (_2!11888 lt!397498) bit!26) (= (_1!11888 lt!397498) (_2!11887 lt!397495))))))

(declare-fun readBitPure!0 (BitStream!11028) tuple2!21908)

(declare-fun readerFrom!0 (BitStream!11028 (_ BitVec 32) (_ BitVec 32)) BitStream!11028)

(assert (=> b!255989 (= lt!397498 (readBitPure!0 (readerFrom!0 (_2!11887 lt!397495) (currentBit!12044 thiss!1005) (currentByte!12049 thiss!1005))))))

(declare-fun b!255990 () Bool)

(declare-fun res!214617 () Bool)

(assert (=> b!255990 (=> (not res!214617) (not e!177343))))

(declare-fun isPrefixOf!0 (BitStream!11028 BitStream!11028) Bool)

(assert (=> b!255990 (= res!214617 (isPrefixOf!0 thiss!1005 (_2!11887 lt!397495)))))

(declare-fun b!255991 () Bool)

(declare-fun e!177349 () Bool)

(declare-fun e!177339 () Bool)

(assert (=> b!255991 (= e!177349 (not e!177339))))

(declare-fun res!214614 () Bool)

(assert (=> b!255991 (=> res!214614 e!177339)))

(declare-fun lt!397491 () tuple2!21908)

(declare-fun lt!397499 () tuple2!21910)

(assert (=> b!255991 (= res!214614 (not (= (_1!11888 lt!397491) (_2!11889 lt!397499))))))

(assert (=> b!255991 (= lt!397491 (checkBitsLoopPure!0 (_1!11889 lt!397499) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!397494 () (_ BitVec 64))

(assert (=> b!255991 (validate_offset_bits!1 ((_ sign_extend 32) (size!6053 (buf!6570 (_2!11887 lt!397508)))) ((_ sign_extend 32) (currentByte!12049 (_2!11887 lt!397495))) ((_ sign_extend 32) (currentBit!12044 (_2!11887 lt!397495))) lt!397494)))

(declare-fun lt!397497 () Unit!18314)

(assert (=> b!255991 (= lt!397497 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11887 lt!397495) (buf!6570 (_2!11887 lt!397508)) lt!397494))))

(declare-fun lt!397500 () tuple2!21910)

(declare-fun lt!397490 () tuple2!21908)

(assert (=> b!255991 (= lt!397490 (checkBitsLoopPure!0 (_1!11889 lt!397500) nBits!297 bit!26 from!289))))

(assert (=> b!255991 (validate_offset_bits!1 ((_ sign_extend 32) (size!6053 (buf!6570 (_2!11887 lt!397508)))) ((_ sign_extend 32) (currentByte!12049 thiss!1005)) ((_ sign_extend 32) (currentBit!12044 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!397502 () Unit!18314)

(assert (=> b!255991 (= lt!397502 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6570 (_2!11887 lt!397508)) (bvsub nBits!297 from!289)))))

(assert (=> b!255991 (= (_2!11888 (readBitPure!0 (_1!11889 lt!397500))) bit!26)))

(assert (=> b!255991 (= lt!397499 (reader!0 (_2!11887 lt!397495) (_2!11887 lt!397508)))))

(assert (=> b!255991 (= lt!397500 (reader!0 thiss!1005 (_2!11887 lt!397508)))))

(declare-fun e!177345 () Bool)

(assert (=> b!255991 e!177345))

(declare-fun res!214618 () Bool)

(assert (=> b!255991 (=> (not res!214618) (not e!177345))))

(declare-fun lt!397503 () tuple2!21908)

(declare-fun lt!397506 () tuple2!21908)

(assert (=> b!255991 (= res!214618 (= (bitIndex!0 (size!6053 (buf!6570 (_1!11888 lt!397503))) (currentByte!12049 (_1!11888 lt!397503)) (currentBit!12044 (_1!11888 lt!397503))) (bitIndex!0 (size!6053 (buf!6570 (_1!11888 lt!397506))) (currentByte!12049 (_1!11888 lt!397506)) (currentBit!12044 (_1!11888 lt!397506)))))))

(declare-fun lt!397488 () Unit!18314)

(declare-fun lt!397496 () BitStream!11028)

(declare-fun readBitPrefixLemma!0 (BitStream!11028 BitStream!11028) Unit!18314)

(assert (=> b!255991 (= lt!397488 (readBitPrefixLemma!0 lt!397496 (_2!11887 lt!397508)))))

(assert (=> b!255991 (= lt!397506 (readBitPure!0 (BitStream!11029 (buf!6570 (_2!11887 lt!397508)) (currentByte!12049 thiss!1005) (currentBit!12044 thiss!1005))))))

(assert (=> b!255991 (= lt!397503 (readBitPure!0 lt!397496))))

(assert (=> b!255991 (= lt!397496 (BitStream!11029 (buf!6570 (_2!11887 lt!397495)) (currentByte!12049 thiss!1005) (currentBit!12044 thiss!1005)))))

(declare-fun e!177347 () Bool)

(assert (=> b!255991 e!177347))

(declare-fun res!214619 () Bool)

(assert (=> b!255991 (=> (not res!214619) (not e!177347))))

(assert (=> b!255991 (= res!214619 (isPrefixOf!0 thiss!1005 (_2!11887 lt!397508)))))

(declare-fun lt!397501 () Unit!18314)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11028 BitStream!11028 BitStream!11028) Unit!18314)

(assert (=> b!255991 (= lt!397501 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11887 lt!397495) (_2!11887 lt!397508)))))

(declare-fun e!177346 () Bool)

(assert (=> b!255991 e!177346))

(declare-fun res!214624 () Bool)

(assert (=> b!255991 (=> (not res!214624) (not e!177346))))

(assert (=> b!255991 (= res!214624 (= (size!6053 (buf!6570 (_2!11887 lt!397495))) (size!6053 (buf!6570 (_2!11887 lt!397508)))))))

(declare-fun appendNBitsLoop!0 (BitStream!11028 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21906)

(assert (=> b!255991 (= lt!397508 (appendNBitsLoop!0 (_2!11887 lt!397495) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!255991 (validate_offset_bits!1 ((_ sign_extend 32) (size!6053 (buf!6570 (_2!11887 lt!397495)))) ((_ sign_extend 32) (currentByte!12049 (_2!11887 lt!397495))) ((_ sign_extend 32) (currentBit!12044 (_2!11887 lt!397495))) lt!397494)))

(assert (=> b!255991 (= lt!397494 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!397493 () Unit!18314)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11028 BitStream!11028 (_ BitVec 64) (_ BitVec 64)) Unit!18314)

(assert (=> b!255991 (= lt!397493 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11887 lt!397495) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!177350 () Bool)

(assert (=> b!255991 e!177350))

(declare-fun res!214621 () Bool)

(assert (=> b!255991 (=> (not res!214621) (not e!177350))))

(assert (=> b!255991 (= res!214621 (= (size!6053 (buf!6570 thiss!1005)) (size!6053 (buf!6570 (_2!11887 lt!397495)))))))

(declare-fun appendBit!0 (BitStream!11028 Bool) tuple2!21906)

(assert (=> b!255991 (= lt!397495 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!255993 () Bool)

(declare-fun res!214622 () Bool)

(assert (=> b!255993 (=> res!214622 e!177339)))

(declare-fun withMovedBitIndex!0 (BitStream!11028 (_ BitVec 64)) BitStream!11028)

(assert (=> b!255993 (= res!214622 (not (= (_1!11889 lt!397499) (withMovedBitIndex!0 (_1!11889 lt!397500) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!255994 () Bool)

(assert (=> b!255994 (= e!177339 e!177340)))

(declare-fun res!214616 () Bool)

(assert (=> b!255994 (=> (not res!214616) (not e!177340))))

(assert (=> b!255994 (= res!214616 (= (size!6053 (buf!6570 thiss!1005)) (size!6053 (buf!6570 (_2!11887 lt!397508)))))))

(assert (=> b!255994 (and (= (_2!11888 lt!397490) (_2!11888 lt!397491)) (= (_1!11888 lt!397490) (_2!11889 lt!397500)))))

(declare-fun b!255995 () Bool)

(declare-fun res!214613 () Bool)

(assert (=> b!255995 (=> (not res!214613) (not e!177347))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!255995 (= res!214613 (invariant!0 (currentBit!12044 thiss!1005) (currentByte!12049 thiss!1005) (size!6053 (buf!6570 (_2!11887 lt!397495)))))))

(declare-fun b!255996 () Bool)

(declare-fun lt!397489 () (_ BitVec 64))

(assert (=> b!255996 (= e!177341 (= (bitIndex!0 (size!6053 (buf!6570 (_1!11888 lt!397498))) (currentByte!12049 (_1!11888 lt!397498)) (currentBit!12044 (_1!11888 lt!397498))) lt!397489))))

(declare-fun b!255997 () Bool)

(declare-fun res!214620 () Bool)

(assert (=> b!255997 (=> (not res!214620) (not e!177348))))

(assert (=> b!255997 (= res!214620 (isPrefixOf!0 (_2!11887 lt!397495) (_2!11887 lt!397508)))))

(declare-fun b!255998 () Bool)

(assert (=> b!255998 (= e!177345 (= (_2!11888 lt!397503) (_2!11888 lt!397506)))))

(declare-fun b!255999 () Bool)

(declare-fun res!214627 () Bool)

(assert (=> b!255999 (=> (not res!214627) (not e!177349))))

(assert (=> b!255999 (= res!214627 (bvslt from!289 nBits!297))))

(declare-fun b!256000 () Bool)

(declare-fun e!177342 () Bool)

(declare-fun array_inv!5794 (array!13797) Bool)

(assert (=> b!256000 (= e!177342 (array_inv!5794 (buf!6570 thiss!1005)))))

(declare-fun b!256001 () Bool)

(assert (=> b!256001 (= e!177340 (_2!11888 lt!397490))))

(declare-fun b!256002 () Bool)

(assert (=> b!256002 (= e!177350 e!177343)))

(declare-fun res!214623 () Bool)

(assert (=> b!256002 (=> (not res!214623) (not e!177343))))

(declare-fun lt!397492 () (_ BitVec 64))

(assert (=> b!256002 (= res!214623 (= lt!397489 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!397492)))))

(assert (=> b!256002 (= lt!397489 (bitIndex!0 (size!6053 (buf!6570 (_2!11887 lt!397495))) (currentByte!12049 (_2!11887 lt!397495)) (currentBit!12044 (_2!11887 lt!397495))))))

(assert (=> b!256002 (= lt!397492 (bitIndex!0 (size!6053 (buf!6570 thiss!1005)) (currentByte!12049 thiss!1005) (currentBit!12044 thiss!1005)))))

(declare-fun b!255992 () Bool)

(assert (=> b!255992 (= e!177347 (invariant!0 (currentBit!12044 thiss!1005) (currentByte!12049 thiss!1005) (size!6053 (buf!6570 (_2!11887 lt!397508)))))))

(declare-fun res!214626 () Bool)

(assert (=> start!54650 (=> (not res!214626) (not e!177349))))

(assert (=> start!54650 (= res!214626 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54650 e!177349))

(assert (=> start!54650 true))

(declare-fun inv!12 (BitStream!11028) Bool)

(assert (=> start!54650 (and (inv!12 thiss!1005) e!177342)))

(declare-fun b!256003 () Bool)

(declare-fun res!214628 () Bool)

(assert (=> b!256003 (=> (not res!214628) (not e!177349))))

(assert (=> b!256003 (= res!214628 (validate_offset_bits!1 ((_ sign_extend 32) (size!6053 (buf!6570 thiss!1005))) ((_ sign_extend 32) (currentByte!12049 thiss!1005)) ((_ sign_extend 32) (currentBit!12044 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!256004 () Bool)

(assert (=> b!256004 (= e!177346 e!177348)))

(declare-fun res!214625 () Bool)

(assert (=> b!256004 (=> (not res!214625) (not e!177348))))

(assert (=> b!256004 (= res!214625 (= (bitIndex!0 (size!6053 (buf!6570 (_2!11887 lt!397508))) (currentByte!12049 (_2!11887 lt!397508)) (currentBit!12044 (_2!11887 lt!397508))) (bvadd (bitIndex!0 (size!6053 (buf!6570 (_2!11887 lt!397495))) (currentByte!12049 (_2!11887 lt!397495)) (currentBit!12044 (_2!11887 lt!397495))) lt!397507)))))

(assert (=> b!256004 (= lt!397507 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (= (and start!54650 res!214626) b!256003))

(assert (= (and b!256003 res!214628) b!255999))

(assert (= (and b!255999 res!214627) b!255991))

(assert (= (and b!255991 res!214621) b!256002))

(assert (= (and b!256002 res!214623) b!255990))

(assert (= (and b!255990 res!214617) b!255989))

(assert (= (and b!255989 res!214629) b!255996))

(assert (= (and b!255991 res!214624) b!256004))

(assert (= (and b!256004 res!214625) b!255997))

(assert (= (and b!255997 res!214620) b!255988))

(assert (= (and b!255991 res!214619) b!255995))

(assert (= (and b!255995 res!214613) b!255992))

(assert (= (and b!255991 res!214618) b!255998))

(assert (= (and b!255991 (not res!214614)) b!255993))

(assert (= (and b!255993 (not res!214622)) b!255994))

(assert (= (and b!255994 res!214616) b!255987))

(assert (= (and b!255987 res!214615) b!256001))

(assert (= start!54650 b!256000))

(declare-fun m!385577 () Bool)

(assert (=> b!255995 m!385577))

(declare-fun m!385579 () Bool)

(assert (=> b!256002 m!385579))

(declare-fun m!385581 () Bool)

(assert (=> b!256002 m!385581))

(declare-fun m!385583 () Bool)

(assert (=> b!255990 m!385583))

(declare-fun m!385585 () Bool)

(assert (=> b!255997 m!385585))

(declare-fun m!385587 () Bool)

(assert (=> b!255989 m!385587))

(assert (=> b!255989 m!385587))

(declare-fun m!385589 () Bool)

(assert (=> b!255989 m!385589))

(declare-fun m!385591 () Bool)

(assert (=> b!256000 m!385591))

(declare-fun m!385593 () Bool)

(assert (=> b!255988 m!385593))

(declare-fun m!385595 () Bool)

(assert (=> b!255988 m!385595))

(declare-fun m!385597 () Bool)

(assert (=> b!255988 m!385597))

(declare-fun m!385599 () Bool)

(assert (=> b!255988 m!385599))

(declare-fun m!385601 () Bool)

(assert (=> b!256003 m!385601))

(declare-fun m!385603 () Bool)

(assert (=> b!255991 m!385603))

(declare-fun m!385605 () Bool)

(assert (=> b!255991 m!385605))

(declare-fun m!385607 () Bool)

(assert (=> b!255991 m!385607))

(declare-fun m!385609 () Bool)

(assert (=> b!255991 m!385609))

(declare-fun m!385611 () Bool)

(assert (=> b!255991 m!385611))

(declare-fun m!385613 () Bool)

(assert (=> b!255991 m!385613))

(declare-fun m!385615 () Bool)

(assert (=> b!255991 m!385615))

(declare-fun m!385617 () Bool)

(assert (=> b!255991 m!385617))

(declare-fun m!385619 () Bool)

(assert (=> b!255991 m!385619))

(declare-fun m!385621 () Bool)

(assert (=> b!255991 m!385621))

(declare-fun m!385623 () Bool)

(assert (=> b!255991 m!385623))

(declare-fun m!385625 () Bool)

(assert (=> b!255991 m!385625))

(declare-fun m!385627 () Bool)

(assert (=> b!255991 m!385627))

(declare-fun m!385629 () Bool)

(assert (=> b!255991 m!385629))

(declare-fun m!385631 () Bool)

(assert (=> b!255991 m!385631))

(declare-fun m!385633 () Bool)

(assert (=> b!255991 m!385633))

(declare-fun m!385635 () Bool)

(assert (=> b!255991 m!385635))

(declare-fun m!385637 () Bool)

(assert (=> b!255991 m!385637))

(declare-fun m!385639 () Bool)

(assert (=> b!255991 m!385639))

(assert (=> b!255991 m!385599))

(declare-fun m!385641 () Bool)

(assert (=> b!255992 m!385641))

(declare-fun m!385643 () Bool)

(assert (=> start!54650 m!385643))

(declare-fun m!385645 () Bool)

(assert (=> b!256004 m!385645))

(assert (=> b!256004 m!385579))

(declare-fun m!385647 () Bool)

(assert (=> b!255993 m!385647))

(declare-fun m!385649 () Bool)

(assert (=> b!255996 m!385649))

(assert (=> b!255987 m!385645))

(assert (=> b!255987 m!385581))

(check-sat (not b!256003) (not b!255993) (not b!256004) (not b!255989) (not b!256000) (not b!255992) (not b!255991) (not b!255990) (not b!255987) (not b!255995) (not b!255996) (not b!255988) (not b!255997) (not b!256002) (not start!54650))
(check-sat)
