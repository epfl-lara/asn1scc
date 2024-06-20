; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26360 () Bool)

(assert start!26360)

(declare-fun res!112213 () Bool)

(declare-fun e!89574 () Bool)

(assert (=> start!26360 (=> (not res!112213) (not e!89574))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6160 0))(
  ( (array!6161 (arr!3453 (Array (_ BitVec 32) (_ BitVec 8))) (size!2788 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6160)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!26360 (= res!112213 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2788 arr!237))))))

(assert (=> start!26360 e!89574))

(assert (=> start!26360 true))

(declare-fun array_inv!2577 (array!6160) Bool)

(assert (=> start!26360 (array_inv!2577 arr!237)))

(declare-datatypes ((BitStream!4840 0))(
  ( (BitStream!4841 (buf!3181 array!6160) (currentByte!5978 (_ BitVec 32)) (currentBit!5973 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4840)

(declare-fun e!89582 () Bool)

(declare-fun inv!12 (BitStream!4840) Bool)

(assert (=> start!26360 (and (inv!12 thiss!1634) e!89582)))

(declare-fun b!134976 () Bool)

(declare-fun e!89576 () Bool)

(declare-datatypes ((tuple2!11700 0))(
  ( (tuple2!11701 (_1!6166 BitStream!4840) (_2!6166 (_ BitVec 8))) )
))
(declare-fun lt!209445 () tuple2!11700)

(declare-fun lt!209426 () tuple2!11700)

(assert (=> b!134976 (= e!89576 (= (_2!6166 lt!209445) (_2!6166 lt!209426)))))

(declare-fun b!134977 () Bool)

(declare-fun e!89578 () Bool)

(declare-fun lt!209424 () tuple2!11700)

(declare-datatypes ((tuple2!11702 0))(
  ( (tuple2!11703 (_1!6167 BitStream!4840) (_2!6167 BitStream!4840)) )
))
(declare-fun lt!209443 () tuple2!11702)

(assert (=> b!134977 (= e!89578 (and (= (_2!6166 lt!209424) (select (arr!3453 arr!237) from!447)) (= (_1!6166 lt!209424) (_2!6167 lt!209443))))))

(declare-fun readBytePure!0 (BitStream!4840) tuple2!11700)

(assert (=> b!134977 (= lt!209424 (readBytePure!0 (_1!6167 lt!209443)))))

(declare-datatypes ((Unit!8414 0))(
  ( (Unit!8415) )
))
(declare-datatypes ((tuple2!11704 0))(
  ( (tuple2!11705 (_1!6168 Unit!8414) (_2!6168 BitStream!4840)) )
))
(declare-fun lt!209431 () tuple2!11704)

(declare-fun reader!0 (BitStream!4840 BitStream!4840) tuple2!11702)

(assert (=> b!134977 (= lt!209443 (reader!0 thiss!1634 (_2!6168 lt!209431)))))

(declare-fun b!134978 () Bool)

(declare-fun e!89583 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!134978 (= e!89583 (invariant!0 (currentBit!5973 thiss!1634) (currentByte!5978 thiss!1634) (size!2788 (buf!3181 (_2!6168 lt!209431)))))))

(declare-fun b!134979 () Bool)

(declare-fun res!112216 () Bool)

(assert (=> b!134979 (=> (not res!112216) (not e!89574))))

(assert (=> b!134979 (= res!112216 (invariant!0 (currentBit!5973 thiss!1634) (currentByte!5978 thiss!1634) (size!2788 (buf!3181 thiss!1634))))))

(declare-fun b!134980 () Bool)

(declare-fun res!112214 () Bool)

(declare-fun e!89573 () Bool)

(assert (=> b!134980 (=> (not res!112214) (not e!89573))))

(declare-fun lt!209449 () tuple2!11704)

(declare-fun isPrefixOf!0 (BitStream!4840 BitStream!4840) Bool)

(assert (=> b!134980 (= res!112214 (isPrefixOf!0 (_2!6168 lt!209431) (_2!6168 lt!209449)))))

(declare-fun b!134981 () Bool)

(declare-fun e!89577 () Bool)

(assert (=> b!134981 (= e!89573 (not e!89577))))

(declare-fun res!112217 () Bool)

(assert (=> b!134981 (=> res!112217 e!89577)))

(declare-datatypes ((tuple2!11706 0))(
  ( (tuple2!11707 (_1!6169 BitStream!4840) (_2!6169 array!6160)) )
))
(declare-fun lt!209446 () tuple2!11706)

(declare-fun lt!209439 () tuple2!11702)

(assert (=> b!134981 (= res!112217 (or (not (= (size!2788 (_2!6169 lt!209446)) (size!2788 arr!237))) (not (= (_1!6169 lt!209446) (_2!6167 lt!209439)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4840 array!6160 (_ BitVec 32) (_ BitVec 32)) tuple2!11706)

(assert (=> b!134981 (= lt!209446 (readByteArrayLoopPure!0 (_1!6167 lt!209439) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!209436 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!134981 (validate_offset_bits!1 ((_ sign_extend 32) (size!2788 (buf!3181 (_2!6168 lt!209449)))) ((_ sign_extend 32) (currentByte!5978 (_2!6168 lt!209431))) ((_ sign_extend 32) (currentBit!5973 (_2!6168 lt!209431))) lt!209436)))

(declare-fun lt!209437 () Unit!8414)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4840 array!6160 (_ BitVec 64)) Unit!8414)

(assert (=> b!134981 (= lt!209437 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6168 lt!209431) (buf!3181 (_2!6168 lt!209449)) lt!209436))))

(assert (=> b!134981 (= lt!209439 (reader!0 (_2!6168 lt!209431) (_2!6168 lt!209449)))))

(declare-fun b!134982 () Bool)

(declare-fun res!112224 () Bool)

(assert (=> b!134982 (=> (not res!112224) (not e!89574))))

(assert (=> b!134982 (= res!112224 (bvslt from!447 to!404))))

(declare-fun b!134983 () Bool)

(declare-fun res!112222 () Bool)

(assert (=> b!134983 (=> (not res!112222) (not e!89578))))

(assert (=> b!134983 (= res!112222 (isPrefixOf!0 thiss!1634 (_2!6168 lt!209431)))))

(declare-fun b!134984 () Bool)

(declare-fun e!89575 () Bool)

(assert (=> b!134984 (= e!89574 (not e!89575))))

(declare-fun res!112218 () Bool)

(assert (=> b!134984 (=> res!112218 e!89575)))

(declare-fun lt!209447 () tuple2!11706)

(declare-fun lt!209429 () tuple2!11706)

(declare-fun arrayRangesEq!191 (array!6160 array!6160 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!134984 (= res!112218 (not (arrayRangesEq!191 (_2!6169 lt!209429) (_2!6169 lt!209447) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!209435 () tuple2!11706)

(assert (=> b!134984 (arrayRangesEq!191 (_2!6169 lt!209429) (_2!6169 lt!209435) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!209425 () tuple2!11702)

(declare-fun lt!209434 () Unit!8414)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4840 array!6160 (_ BitVec 32) (_ BitVec 32)) Unit!8414)

(assert (=> b!134984 (= lt!209434 (readByteArrayLoopArrayPrefixLemma!0 (_1!6167 lt!209425) arr!237 from!447 to!404))))

(declare-fun lt!209433 () array!6160)

(declare-fun withMovedByteIndex!0 (BitStream!4840 (_ BitVec 32)) BitStream!4840)

(assert (=> b!134984 (= lt!209435 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6167 lt!209425) #b00000000000000000000000000000001) lt!209433 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!209428 () tuple2!11702)

(assert (=> b!134984 (= lt!209447 (readByteArrayLoopPure!0 (_1!6167 lt!209428) lt!209433 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!209448 () tuple2!11700)

(assert (=> b!134984 (= lt!209433 (array!6161 (store (arr!3453 arr!237) from!447 (_2!6166 lt!209448)) (size!2788 arr!237)))))

(declare-fun lt!209430 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!134984 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2788 (buf!3181 (_2!6168 lt!209449)))) ((_ sign_extend 32) (currentByte!5978 (_2!6168 lt!209431))) ((_ sign_extend 32) (currentBit!5973 (_2!6168 lt!209431))) lt!209430)))

(declare-fun lt!209442 () Unit!8414)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4840 array!6160 (_ BitVec 32)) Unit!8414)

(assert (=> b!134984 (= lt!209442 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6168 lt!209431) (buf!3181 (_2!6168 lt!209449)) lt!209430))))

(assert (=> b!134984 (= (_1!6169 lt!209429) (_2!6167 lt!209425))))

(assert (=> b!134984 (= lt!209429 (readByteArrayLoopPure!0 (_1!6167 lt!209425) arr!237 from!447 to!404))))

(assert (=> b!134984 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2788 (buf!3181 (_2!6168 lt!209449)))) ((_ sign_extend 32) (currentByte!5978 thiss!1634)) ((_ sign_extend 32) (currentBit!5973 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!209438 () Unit!8414)

(assert (=> b!134984 (= lt!209438 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3181 (_2!6168 lt!209449)) (bvsub to!404 from!447)))))

(assert (=> b!134984 (= (_2!6166 lt!209448) (select (arr!3453 arr!237) from!447))))

(assert (=> b!134984 (= lt!209448 (readBytePure!0 (_1!6167 lt!209425)))))

(assert (=> b!134984 (= lt!209428 (reader!0 (_2!6168 lt!209431) (_2!6168 lt!209449)))))

(assert (=> b!134984 (= lt!209425 (reader!0 thiss!1634 (_2!6168 lt!209449)))))

(assert (=> b!134984 e!89576))

(declare-fun res!112221 () Bool)

(assert (=> b!134984 (=> (not res!112221) (not e!89576))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!134984 (= res!112221 (= (bitIndex!0 (size!2788 (buf!3181 (_1!6166 lt!209445))) (currentByte!5978 (_1!6166 lt!209445)) (currentBit!5973 (_1!6166 lt!209445))) (bitIndex!0 (size!2788 (buf!3181 (_1!6166 lt!209426))) (currentByte!5978 (_1!6166 lt!209426)) (currentBit!5973 (_1!6166 lt!209426)))))))

(declare-fun lt!209440 () Unit!8414)

(declare-fun lt!209432 () BitStream!4840)

(declare-fun readBytePrefixLemma!0 (BitStream!4840 BitStream!4840) Unit!8414)

(assert (=> b!134984 (= lt!209440 (readBytePrefixLemma!0 lt!209432 (_2!6168 lt!209449)))))

(assert (=> b!134984 (= lt!209426 (readBytePure!0 (BitStream!4841 (buf!3181 (_2!6168 lt!209449)) (currentByte!5978 thiss!1634) (currentBit!5973 thiss!1634))))))

(assert (=> b!134984 (= lt!209445 (readBytePure!0 lt!209432))))

(assert (=> b!134984 (= lt!209432 (BitStream!4841 (buf!3181 (_2!6168 lt!209431)) (currentByte!5978 thiss!1634) (currentBit!5973 thiss!1634)))))

(assert (=> b!134984 e!89583))

(declare-fun res!112215 () Bool)

(assert (=> b!134984 (=> (not res!112215) (not e!89583))))

(assert (=> b!134984 (= res!112215 (isPrefixOf!0 thiss!1634 (_2!6168 lt!209449)))))

(declare-fun lt!209444 () Unit!8414)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4840 BitStream!4840 BitStream!4840) Unit!8414)

(assert (=> b!134984 (= lt!209444 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6168 lt!209431) (_2!6168 lt!209449)))))

(declare-fun e!89581 () Bool)

(assert (=> b!134984 e!89581))

(declare-fun res!112212 () Bool)

(assert (=> b!134984 (=> (not res!112212) (not e!89581))))

(assert (=> b!134984 (= res!112212 (= (size!2788 (buf!3181 (_2!6168 lt!209431))) (size!2788 (buf!3181 (_2!6168 lt!209449)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4840 array!6160 (_ BitVec 32) (_ BitVec 32)) tuple2!11704)

(assert (=> b!134984 (= lt!209449 (appendByteArrayLoop!0 (_2!6168 lt!209431) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!134984 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2788 (buf!3181 (_2!6168 lt!209431)))) ((_ sign_extend 32) (currentByte!5978 (_2!6168 lt!209431))) ((_ sign_extend 32) (currentBit!5973 (_2!6168 lt!209431))) lt!209430)))

(assert (=> b!134984 (= lt!209430 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!209441 () Unit!8414)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4840 BitStream!4840 (_ BitVec 64) (_ BitVec 32)) Unit!8414)

(assert (=> b!134984 (= lt!209441 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6168 lt!209431) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!134984 e!89578))

(declare-fun res!112223 () Bool)

(assert (=> b!134984 (=> (not res!112223) (not e!89578))))

(assert (=> b!134984 (= res!112223 (= (size!2788 (buf!3181 thiss!1634)) (size!2788 (buf!3181 (_2!6168 lt!209431)))))))

(declare-fun appendByte!0 (BitStream!4840 (_ BitVec 8)) tuple2!11704)

(assert (=> b!134984 (= lt!209431 (appendByte!0 thiss!1634 (select (arr!3453 arr!237) from!447)))))

(declare-fun b!134985 () Bool)

(declare-fun res!112220 () Bool)

(assert (=> b!134985 (=> (not res!112220) (not e!89578))))

(assert (=> b!134985 (= res!112220 (= (bitIndex!0 (size!2788 (buf!3181 (_2!6168 lt!209431))) (currentByte!5978 (_2!6168 lt!209431)) (currentBit!5973 (_2!6168 lt!209431))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2788 (buf!3181 thiss!1634)) (currentByte!5978 thiss!1634) (currentBit!5973 thiss!1634)))))))

(declare-fun b!134986 () Bool)

(assert (=> b!134986 (= e!89582 (array_inv!2577 (buf!3181 thiss!1634)))))

(declare-fun b!134987 () Bool)

(declare-fun res!112219 () Bool)

(assert (=> b!134987 (=> (not res!112219) (not e!89574))))

(assert (=> b!134987 (= res!112219 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2788 (buf!3181 thiss!1634))) ((_ sign_extend 32) (currentByte!5978 thiss!1634)) ((_ sign_extend 32) (currentBit!5973 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!134988 () Bool)

(assert (=> b!134988 (= e!89577 (not (arrayRangesEq!191 arr!237 (_2!6169 lt!209446) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!134989 () Bool)

(assert (=> b!134989 (= e!89575 true)))

(assert (=> b!134989 (arrayRangesEq!191 (_2!6169 lt!209447) (_2!6169 lt!209429) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!209427 () Unit!8414)

(declare-fun arrayRangesEqSymmetricLemma!4 (array!6160 array!6160 (_ BitVec 32) (_ BitVec 32)) Unit!8414)

(assert (=> b!134989 (= lt!209427 (arrayRangesEqSymmetricLemma!4 (_2!6169 lt!209429) (_2!6169 lt!209447) #b00000000000000000000000000000000 to!404))))

(declare-fun b!134990 () Bool)

(assert (=> b!134990 (= e!89581 e!89573)))

(declare-fun res!112211 () Bool)

(assert (=> b!134990 (=> (not res!112211) (not e!89573))))

(assert (=> b!134990 (= res!112211 (= (bitIndex!0 (size!2788 (buf!3181 (_2!6168 lt!209449))) (currentByte!5978 (_2!6168 lt!209449)) (currentBit!5973 (_2!6168 lt!209449))) (bvadd (bitIndex!0 (size!2788 (buf!3181 (_2!6168 lt!209431))) (currentByte!5978 (_2!6168 lt!209431)) (currentBit!5973 (_2!6168 lt!209431))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!209436))))))

(assert (=> b!134990 (= lt!209436 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (= (and start!26360 res!112213) b!134987))

(assert (= (and b!134987 res!112219) b!134982))

(assert (= (and b!134982 res!112224) b!134979))

(assert (= (and b!134979 res!112216) b!134984))

(assert (= (and b!134984 res!112223) b!134985))

(assert (= (and b!134985 res!112220) b!134983))

(assert (= (and b!134983 res!112222) b!134977))

(assert (= (and b!134984 res!112212) b!134990))

(assert (= (and b!134990 res!112211) b!134980))

(assert (= (and b!134980 res!112214) b!134981))

(assert (= (and b!134981 (not res!112217)) b!134988))

(assert (= (and b!134984 res!112215) b!134978))

(assert (= (and b!134984 res!112221) b!134976))

(assert (= (and b!134984 (not res!112218)) b!134989))

(assert (= start!26360 b!134986))

(declare-fun m!205675 () Bool)

(assert (=> b!134985 m!205675))

(declare-fun m!205677 () Bool)

(assert (=> b!134985 m!205677))

(declare-fun m!205679 () Bool)

(assert (=> b!134983 m!205679))

(declare-fun m!205681 () Bool)

(assert (=> b!134990 m!205681))

(assert (=> b!134990 m!205675))

(declare-fun m!205683 () Bool)

(assert (=> b!134989 m!205683))

(declare-fun m!205685 () Bool)

(assert (=> b!134989 m!205685))

(declare-fun m!205687 () Bool)

(assert (=> b!134981 m!205687))

(declare-fun m!205689 () Bool)

(assert (=> b!134981 m!205689))

(declare-fun m!205691 () Bool)

(assert (=> b!134981 m!205691))

(declare-fun m!205693 () Bool)

(assert (=> b!134981 m!205693))

(declare-fun m!205695 () Bool)

(assert (=> b!134986 m!205695))

(declare-fun m!205697 () Bool)

(assert (=> b!134977 m!205697))

(declare-fun m!205699 () Bool)

(assert (=> b!134977 m!205699))

(declare-fun m!205701 () Bool)

(assert (=> b!134977 m!205701))

(declare-fun m!205703 () Bool)

(assert (=> b!134980 m!205703))

(declare-fun m!205705 () Bool)

(assert (=> b!134979 m!205705))

(declare-fun m!205707 () Bool)

(assert (=> start!26360 m!205707))

(declare-fun m!205709 () Bool)

(assert (=> start!26360 m!205709))

(declare-fun m!205711 () Bool)

(assert (=> b!134978 m!205711))

(declare-fun m!205713 () Bool)

(assert (=> b!134984 m!205713))

(declare-fun m!205715 () Bool)

(assert (=> b!134984 m!205715))

(declare-fun m!205717 () Bool)

(assert (=> b!134984 m!205717))

(declare-fun m!205719 () Bool)

(assert (=> b!134984 m!205719))

(declare-fun m!205721 () Bool)

(assert (=> b!134984 m!205721))

(declare-fun m!205723 () Bool)

(assert (=> b!134984 m!205723))

(declare-fun m!205725 () Bool)

(assert (=> b!134984 m!205725))

(assert (=> b!134984 m!205697))

(declare-fun m!205727 () Bool)

(assert (=> b!134984 m!205727))

(declare-fun m!205729 () Bool)

(assert (=> b!134984 m!205729))

(declare-fun m!205731 () Bool)

(assert (=> b!134984 m!205731))

(declare-fun m!205733 () Bool)

(assert (=> b!134984 m!205733))

(declare-fun m!205735 () Bool)

(assert (=> b!134984 m!205735))

(assert (=> b!134984 m!205693))

(declare-fun m!205737 () Bool)

(assert (=> b!134984 m!205737))

(declare-fun m!205739 () Bool)

(assert (=> b!134984 m!205739))

(declare-fun m!205741 () Bool)

(assert (=> b!134984 m!205741))

(declare-fun m!205743 () Bool)

(assert (=> b!134984 m!205743))

(declare-fun m!205745 () Bool)

(assert (=> b!134984 m!205745))

(declare-fun m!205747 () Bool)

(assert (=> b!134984 m!205747))

(declare-fun m!205749 () Bool)

(assert (=> b!134984 m!205749))

(declare-fun m!205751 () Bool)

(assert (=> b!134984 m!205751))

(assert (=> b!134984 m!205729))

(declare-fun m!205753 () Bool)

(assert (=> b!134984 m!205753))

(declare-fun m!205755 () Bool)

(assert (=> b!134984 m!205755))

(declare-fun m!205757 () Bool)

(assert (=> b!134984 m!205757))

(declare-fun m!205759 () Bool)

(assert (=> b!134984 m!205759))

(declare-fun m!205761 () Bool)

(assert (=> b!134984 m!205761))

(assert (=> b!134984 m!205697))

(declare-fun m!205763 () Bool)

(assert (=> b!134988 m!205763))

(declare-fun m!205765 () Bool)

(assert (=> b!134987 m!205765))

(push 1)

(assert (not b!134977))

(assert (not b!134989))

(assert (not b!134981))

(assert (not b!134988))

(assert (not b!134979))

(assert (not b!134978))

(assert (not start!26360))

(assert (not b!134984))

(assert (not b!134983))

(assert (not b!134985))

(assert (not b!134980))

(assert (not b!134990))

(assert (not b!134987))

(assert (not b!134986))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

