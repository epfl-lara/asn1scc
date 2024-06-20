; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5664 () Bool)

(assert start!5664)

(declare-fun res!20292 () Bool)

(declare-fun e!15985 () Bool)

(assert (=> start!5664 (=> (not res!20292) (not e!15985))))

(declare-datatypes ((array!1587 0))(
  ( (array!1588 (arr!1135 (Array (_ BitVec 32) (_ BitVec 8))) (size!679 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1587)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!5664 (= res!20292 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!679 srcBuffer!2))))))))

(assert (=> start!5664 e!15985))

(assert (=> start!5664 true))

(declare-fun array_inv!648 (array!1587) Bool)

(assert (=> start!5664 (array_inv!648 srcBuffer!2)))

(declare-datatypes ((BitStream!1190 0))(
  ( (BitStream!1191 (buf!1000 array!1587) (currentByte!2313 (_ BitVec 32)) (currentBit!2308 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1190)

(declare-fun e!15987 () Bool)

(declare-fun inv!12 (BitStream!1190) Bool)

(assert (=> start!5664 (and (inv!12 thiss!1379) e!15987)))

(declare-fun b!23580 () Bool)

(assert (=> b!23580 (= e!15987 (array_inv!648 (buf!1000 thiss!1379)))))

(declare-fun b!23581 () Bool)

(declare-fun e!15980 () Bool)

(declare-fun e!15979 () Bool)

(assert (=> b!23581 (= e!15980 e!15979)))

(declare-fun res!20295 () Bool)

(assert (=> b!23581 (=> res!20295 e!15979)))

(declare-datatypes ((Unit!2001 0))(
  ( (Unit!2002) )
))
(declare-datatypes ((tuple2!2698 0))(
  ( (tuple2!2699 (_1!1436 Unit!2001) (_2!1436 BitStream!1190)) )
))
(declare-fun lt!34095 () tuple2!2698)

(declare-fun lt!34100 () tuple2!2698)

(assert (=> b!23581 (= res!20295 (not (= (size!679 (buf!1000 (_2!1436 lt!34095))) (size!679 (buf!1000 (_2!1436 lt!34100))))))))

(declare-fun e!15986 () Bool)

(assert (=> b!23581 e!15986))

(declare-fun res!20303 () Bool)

(assert (=> b!23581 (=> (not res!20303) (not e!15986))))

(assert (=> b!23581 (= res!20303 (= (size!679 (buf!1000 (_2!1436 lt!34100))) (size!679 (buf!1000 thiss!1379))))))

(declare-fun b!23582 () Bool)

(declare-fun e!15982 () Bool)

(declare-fun e!15988 () Bool)

(assert (=> b!23582 (= e!15982 e!15988)))

(declare-fun res!20298 () Bool)

(assert (=> b!23582 (=> res!20298 e!15988)))

(declare-fun isPrefixOf!0 (BitStream!1190 BitStream!1190) Bool)

(assert (=> b!23582 (= res!20298 (not (isPrefixOf!0 (_2!1436 lt!34095) (_2!1436 lt!34100))))))

(assert (=> b!23582 (isPrefixOf!0 thiss!1379 (_2!1436 lt!34100))))

(declare-fun lt!34094 () Unit!2001)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1190 BitStream!1190 BitStream!1190) Unit!2001)

(assert (=> b!23582 (= lt!34094 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1436 lt!34095) (_2!1436 lt!34100)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1190 array!1587 (_ BitVec 64) (_ BitVec 64)) tuple2!2698)

(assert (=> b!23582 (= lt!34100 (appendBitsMSBFirstLoop!0 (_2!1436 lt!34095) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!15984 () Bool)

(assert (=> b!23582 e!15984))

(declare-fun res!20304 () Bool)

(assert (=> b!23582 (=> (not res!20304) (not e!15984))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!23582 (= res!20304 (validate_offset_bits!1 ((_ sign_extend 32) (size!679 (buf!1000 (_2!1436 lt!34095)))) ((_ sign_extend 32) (currentByte!2313 thiss!1379)) ((_ sign_extend 32) (currentBit!2308 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34102 () Unit!2001)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1190 array!1587 (_ BitVec 64)) Unit!2001)

(assert (=> b!23582 (= lt!34102 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1000 (_2!1436 lt!34095)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2700 0))(
  ( (tuple2!2701 (_1!1437 BitStream!1190) (_2!1437 BitStream!1190)) )
))
(declare-fun lt!34099 () tuple2!2700)

(declare-fun reader!0 (BitStream!1190 BitStream!1190) tuple2!2700)

(assert (=> b!23582 (= lt!34099 (reader!0 thiss!1379 (_2!1436 lt!34095)))))

(declare-fun b!23583 () Bool)

(declare-fun res!20297 () Bool)

(assert (=> b!23583 (=> res!20297 e!15979)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!23583 (= res!20297 (not (invariant!0 (currentBit!2308 (_2!1436 lt!34095)) (currentByte!2313 (_2!1436 lt!34095)) (size!679 (buf!1000 (_2!1436 lt!34100))))))))

(declare-fun b!23584 () Bool)

(assert (=> b!23584 (= e!15988 e!15980)))

(declare-fun res!20299 () Bool)

(assert (=> b!23584 (=> res!20299 e!15980)))

(declare-fun lt!34104 () (_ BitVec 64))

(declare-fun lt!34101 () (_ BitVec 64))

(assert (=> b!23584 (= res!20299 (not (= lt!34101 (bvsub (bvadd lt!34104 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!23584 (= lt!34101 (bitIndex!0 (size!679 (buf!1000 (_2!1436 lt!34100))) (currentByte!2313 (_2!1436 lt!34100)) (currentBit!2308 (_2!1436 lt!34100))))))

(declare-fun b!23585 () Bool)

(declare-fun res!20300 () Bool)

(assert (=> b!23585 (=> res!20300 e!15979)))

(assert (=> b!23585 (= res!20300 (not (invariant!0 (currentBit!2308 (_2!1436 lt!34095)) (currentByte!2313 (_2!1436 lt!34095)) (size!679 (buf!1000 (_2!1436 lt!34095))))))))

(declare-fun b!23586 () Bool)

(declare-fun e!15983 () Bool)

(assert (=> b!23586 (= e!15985 (not e!15983))))

(declare-fun res!20302 () Bool)

(assert (=> b!23586 (=> res!20302 e!15983)))

(assert (=> b!23586 (= res!20302 (bvsge i!635 to!314))))

(assert (=> b!23586 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!34103 () Unit!2001)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1190) Unit!2001)

(assert (=> b!23586 (= lt!34103 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!23586 (= lt!34104 (bitIndex!0 (size!679 (buf!1000 thiss!1379)) (currentByte!2313 thiss!1379) (currentBit!2308 thiss!1379)))))

(declare-fun b!23587 () Bool)

(declare-datatypes ((List!296 0))(
  ( (Nil!293) (Cons!292 (h!411 Bool) (t!1046 List!296)) )
))
(declare-fun head!133 (List!296) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1190 array!1587 (_ BitVec 64) (_ BitVec 64)) List!296)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1190 BitStream!1190 (_ BitVec 64)) List!296)

(assert (=> b!23587 (= e!15984 (= (head!133 (byteArrayBitContentToList!0 (_2!1436 lt!34095) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!133 (bitStreamReadBitsIntoList!0 (_2!1436 lt!34095) (_1!1437 lt!34099) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!23588 () Bool)

(declare-fun res!20293 () Bool)

(assert (=> b!23588 (=> res!20293 e!15980)))

(assert (=> b!23588 (= res!20293 (not (invariant!0 (currentBit!2308 (_2!1436 lt!34100)) (currentByte!2313 (_2!1436 lt!34100)) (size!679 (buf!1000 (_2!1436 lt!34100))))))))

(declare-fun b!23589 () Bool)

(assert (=> b!23589 (= e!15983 e!15982)))

(declare-fun res!20296 () Bool)

(assert (=> b!23589 (=> res!20296 e!15982)))

(assert (=> b!23589 (= res!20296 (not (isPrefixOf!0 thiss!1379 (_2!1436 lt!34095))))))

(assert (=> b!23589 (validate_offset_bits!1 ((_ sign_extend 32) (size!679 (buf!1000 (_2!1436 lt!34095)))) ((_ sign_extend 32) (currentByte!2313 (_2!1436 lt!34095))) ((_ sign_extend 32) (currentBit!2308 (_2!1436 lt!34095))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34097 () Unit!2001)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1190 BitStream!1190 (_ BitVec 64) (_ BitVec 64)) Unit!2001)

(assert (=> b!23589 (= lt!34097 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1436 lt!34095) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1190 (_ BitVec 8) (_ BitVec 32)) tuple2!2698)

(assert (=> b!23589 (= lt!34095 (appendBitFromByte!0 thiss!1379 (select (arr!1135 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!23590 () Bool)

(declare-fun res!20301 () Bool)

(assert (=> b!23590 (=> (not res!20301) (not e!15985))))

(assert (=> b!23590 (= res!20301 (validate_offset_bits!1 ((_ sign_extend 32) (size!679 (buf!1000 thiss!1379))) ((_ sign_extend 32) (currentByte!2313 thiss!1379)) ((_ sign_extend 32) (currentBit!2308 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!23591 () Bool)

(declare-fun res!20294 () Bool)

(assert (=> b!23591 (=> res!20294 e!15980)))

(assert (=> b!23591 (= res!20294 (not (= (size!679 (buf!1000 thiss!1379)) (size!679 (buf!1000 (_2!1436 lt!34100))))))))

(declare-fun b!23592 () Bool)

(assert (=> b!23592 (= e!15986 (= lt!34101 (bvsub (bvsub (bvadd (bitIndex!0 (size!679 (buf!1000 (_2!1436 lt!34095))) (currentByte!2313 (_2!1436 lt!34095)) (currentBit!2308 (_2!1436 lt!34095))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!23593 () Bool)

(assert (=> b!23593 (= e!15979 true)))

(declare-fun lt!34098 () tuple2!2700)

(assert (=> b!23593 (= lt!34098 (reader!0 (_2!1436 lt!34095) (_2!1436 lt!34100)))))

(assert (=> b!23593 (validate_offset_bits!1 ((_ sign_extend 32) (size!679 (buf!1000 (_2!1436 lt!34100)))) ((_ sign_extend 32) (currentByte!2313 thiss!1379)) ((_ sign_extend 32) (currentBit!2308 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!34105 () Unit!2001)

(assert (=> b!23593 (= lt!34105 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1000 (_2!1436 lt!34100)) (bvsub to!314 i!635)))))

(declare-fun lt!34096 () tuple2!2700)

(assert (=> b!23593 (= lt!34096 (reader!0 thiss!1379 (_2!1436 lt!34100)))))

(assert (= (and start!5664 res!20292) b!23590))

(assert (= (and b!23590 res!20301) b!23586))

(assert (= (and b!23586 (not res!20302)) b!23589))

(assert (= (and b!23589 (not res!20296)) b!23582))

(assert (= (and b!23582 res!20304) b!23587))

(assert (= (and b!23582 (not res!20298)) b!23584))

(assert (= (and b!23584 (not res!20299)) b!23588))

(assert (= (and b!23588 (not res!20293)) b!23591))

(assert (= (and b!23591 (not res!20294)) b!23581))

(assert (= (and b!23581 res!20303) b!23592))

(assert (= (and b!23581 (not res!20295)) b!23585))

(assert (= (and b!23585 (not res!20300)) b!23583))

(assert (= (and b!23583 (not res!20297)) b!23593))

(assert (= start!5664 b!23580))

(declare-fun m!33149 () Bool)

(assert (=> b!23589 m!33149))

(declare-fun m!33151 () Bool)

(assert (=> b!23589 m!33151))

(declare-fun m!33153 () Bool)

(assert (=> b!23589 m!33153))

(declare-fun m!33155 () Bool)

(assert (=> b!23589 m!33155))

(assert (=> b!23589 m!33149))

(declare-fun m!33157 () Bool)

(assert (=> b!23589 m!33157))

(declare-fun m!33159 () Bool)

(assert (=> b!23584 m!33159))

(declare-fun m!33161 () Bool)

(assert (=> b!23592 m!33161))

(declare-fun m!33163 () Bool)

(assert (=> b!23582 m!33163))

(declare-fun m!33165 () Bool)

(assert (=> b!23582 m!33165))

(declare-fun m!33167 () Bool)

(assert (=> b!23582 m!33167))

(declare-fun m!33169 () Bool)

(assert (=> b!23582 m!33169))

(declare-fun m!33171 () Bool)

(assert (=> b!23582 m!33171))

(declare-fun m!33173 () Bool)

(assert (=> b!23582 m!33173))

(declare-fun m!33175 () Bool)

(assert (=> b!23582 m!33175))

(declare-fun m!33177 () Bool)

(assert (=> b!23583 m!33177))

(declare-fun m!33179 () Bool)

(assert (=> b!23588 m!33179))

(declare-fun m!33181 () Bool)

(assert (=> b!23586 m!33181))

(declare-fun m!33183 () Bool)

(assert (=> b!23586 m!33183))

(declare-fun m!33185 () Bool)

(assert (=> b!23586 m!33185))

(declare-fun m!33187 () Bool)

(assert (=> b!23587 m!33187))

(assert (=> b!23587 m!33187))

(declare-fun m!33189 () Bool)

(assert (=> b!23587 m!33189))

(declare-fun m!33191 () Bool)

(assert (=> b!23587 m!33191))

(assert (=> b!23587 m!33191))

(declare-fun m!33193 () Bool)

(assert (=> b!23587 m!33193))

(declare-fun m!33195 () Bool)

(assert (=> b!23593 m!33195))

(declare-fun m!33197 () Bool)

(assert (=> b!23593 m!33197))

(declare-fun m!33199 () Bool)

(assert (=> b!23593 m!33199))

(declare-fun m!33201 () Bool)

(assert (=> b!23593 m!33201))

(declare-fun m!33203 () Bool)

(assert (=> start!5664 m!33203))

(declare-fun m!33205 () Bool)

(assert (=> start!5664 m!33205))

(declare-fun m!33207 () Bool)

(assert (=> b!23585 m!33207))

(declare-fun m!33209 () Bool)

(assert (=> b!23590 m!33209))

(declare-fun m!33211 () Bool)

(assert (=> b!23580 m!33211))

(push 1)

(assert (not b!23585))

(assert (not b!23589))

(assert (not b!23580))

(assert (not b!23588))

(assert (not start!5664))

