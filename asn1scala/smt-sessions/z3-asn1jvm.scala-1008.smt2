; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28754 () Bool)

(assert start!28754)

(declare-fun b!148886 () Bool)

(declare-fun res!124653 () Bool)

(declare-fun e!99363 () Bool)

(assert (=> b!148886 (=> (not res!124653) (not e!99363))))

(declare-datatypes ((array!6676 0))(
  ( (array!6677 (arr!3804 (Array (_ BitVec 32) (_ BitVec 8))) (size!3020 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5298 0))(
  ( (BitStream!5299 (buf!3495 array!6676) (currentByte!6409 (_ BitVec 32)) (currentBit!6404 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5298)

(declare-datatypes ((Unit!9431 0))(
  ( (Unit!9432) )
))
(declare-datatypes ((tuple2!13238 0))(
  ( (tuple2!13239 (_1!6983 Unit!9431) (_2!6983 BitStream!5298)) )
))
(declare-fun lt!232184 () tuple2!13238)

(declare-fun isPrefixOf!0 (BitStream!5298 BitStream!5298) Bool)

(assert (=> b!148886 (= res!124653 (isPrefixOf!0 thiss!1634 (_2!6983 lt!232184)))))

(declare-fun b!148887 () Bool)

(declare-fun res!124666 () Bool)

(declare-fun e!99359 () Bool)

(assert (=> b!148887 (=> (not res!124666) (not e!99359))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!148887 (= res!124666 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3020 (buf!3495 thiss!1634))) ((_ sign_extend 32) (currentByte!6409 thiss!1634)) ((_ sign_extend 32) (currentBit!6404 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!148888 () Bool)

(declare-fun e!99362 () Bool)

(declare-fun e!99356 () Bool)

(assert (=> b!148888 (= e!99362 (not e!99356))))

(declare-fun res!124656 () Bool)

(assert (=> b!148888 (=> res!124656 e!99356)))

(declare-datatypes ((tuple2!13240 0))(
  ( (tuple2!13241 (_1!6984 BitStream!5298) (_2!6984 array!6676)) )
))
(declare-fun lt!232197 () tuple2!13240)

(declare-datatypes ((tuple2!13242 0))(
  ( (tuple2!13243 (_1!6985 BitStream!5298) (_2!6985 BitStream!5298)) )
))
(declare-fun lt!232206 () tuple2!13242)

(declare-fun arr!237 () array!6676)

(assert (=> b!148888 (= res!124656 (or (not (= (size!3020 (_2!6984 lt!232197)) (size!3020 arr!237))) (not (= (_1!6984 lt!232197) (_2!6985 lt!232206)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5298 array!6676 (_ BitVec 32) (_ BitVec 32)) tuple2!13240)

(assert (=> b!148888 (= lt!232197 (readByteArrayLoopPure!0 (_1!6985 lt!232206) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!232207 () tuple2!13238)

(declare-fun lt!232196 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!148888 (validate_offset_bits!1 ((_ sign_extend 32) (size!3020 (buf!3495 (_2!6983 lt!232207)))) ((_ sign_extend 32) (currentByte!6409 (_2!6983 lt!232184))) ((_ sign_extend 32) (currentBit!6404 (_2!6983 lt!232184))) lt!232196)))

(declare-fun lt!232185 () Unit!9431)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5298 array!6676 (_ BitVec 64)) Unit!9431)

(assert (=> b!148888 (= lt!232185 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6983 lt!232184) (buf!3495 (_2!6983 lt!232207)) lt!232196))))

(declare-fun reader!0 (BitStream!5298 BitStream!5298) tuple2!13242)

(assert (=> b!148888 (= lt!232206 (reader!0 (_2!6983 lt!232184) (_2!6983 lt!232207)))))

(declare-fun res!124659 () Bool)

(assert (=> start!28754 (=> (not res!124659) (not e!99359))))

(assert (=> start!28754 (= res!124659 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3020 arr!237))))))

(assert (=> start!28754 e!99359))

(assert (=> start!28754 true))

(declare-fun array_inv!2809 (array!6676) Bool)

(assert (=> start!28754 (array_inv!2809 arr!237)))

(declare-fun e!99355 () Bool)

(declare-fun inv!12 (BitStream!5298) Bool)

(assert (=> start!28754 (and (inv!12 thiss!1634) e!99355)))

(declare-fun b!148889 () Bool)

(declare-fun arrayRangesEq!336 (array!6676 array!6676 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!148889 (= e!99356 (not (arrayRangesEq!336 arr!237 (_2!6984 lt!232197) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!148890 () Bool)

(assert (=> b!148890 (= e!99355 (array_inv!2809 (buf!3495 thiss!1634)))))

(declare-fun b!148891 () Bool)

(declare-fun e!99353 () Bool)

(declare-datatypes ((tuple2!13244 0))(
  ( (tuple2!13245 (_1!6986 BitStream!5298) (_2!6986 (_ BitVec 8))) )
))
(declare-fun lt!232186 () tuple2!13244)

(declare-fun lt!232198 () tuple2!13244)

(assert (=> b!148891 (= e!99353 (= (_2!6986 lt!232186) (_2!6986 lt!232198)))))

(declare-fun b!148892 () Bool)

(declare-fun e!99361 () Bool)

(assert (=> b!148892 (= e!99359 (not e!99361))))

(declare-fun res!124658 () Bool)

(assert (=> b!148892 (=> res!124658 e!99361)))

(declare-fun lt!232191 () tuple2!13240)

(declare-fun lt!232204 () tuple2!13240)

(assert (=> b!148892 (= res!124658 (not (arrayRangesEq!336 (_2!6984 lt!232191) (_2!6984 lt!232204) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!232192 () tuple2!13240)

(assert (=> b!148892 (arrayRangesEq!336 (_2!6984 lt!232191) (_2!6984 lt!232192) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!232195 () tuple2!13242)

(declare-fun lt!232203 () Unit!9431)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5298 array!6676 (_ BitVec 32) (_ BitVec 32)) Unit!9431)

(assert (=> b!148892 (= lt!232203 (readByteArrayLoopArrayPrefixLemma!0 (_1!6985 lt!232195) arr!237 from!447 to!404))))

(declare-fun lt!232188 () array!6676)

(declare-fun withMovedByteIndex!0 (BitStream!5298 (_ BitVec 32)) BitStream!5298)

(assert (=> b!148892 (= lt!232192 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6985 lt!232195) #b00000000000000000000000000000001) lt!232188 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!232190 () tuple2!13242)

(assert (=> b!148892 (= lt!232204 (readByteArrayLoopPure!0 (_1!6985 lt!232190) lt!232188 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!232194 () tuple2!13244)

(assert (=> b!148892 (= lt!232188 (array!6677 (store (arr!3804 arr!237) from!447 (_2!6986 lt!232194)) (size!3020 arr!237)))))

(declare-fun lt!232205 () (_ BitVec 32))

(assert (=> b!148892 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3020 (buf!3495 (_2!6983 lt!232207)))) ((_ sign_extend 32) (currentByte!6409 (_2!6983 lt!232184))) ((_ sign_extend 32) (currentBit!6404 (_2!6983 lt!232184))) lt!232205)))

(declare-fun lt!232208 () Unit!9431)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5298 array!6676 (_ BitVec 32)) Unit!9431)

(assert (=> b!148892 (= lt!232208 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6983 lt!232184) (buf!3495 (_2!6983 lt!232207)) lt!232205))))

(assert (=> b!148892 (= (_1!6984 lt!232191) (_2!6985 lt!232195))))

(assert (=> b!148892 (= lt!232191 (readByteArrayLoopPure!0 (_1!6985 lt!232195) arr!237 from!447 to!404))))

(assert (=> b!148892 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3020 (buf!3495 (_2!6983 lt!232207)))) ((_ sign_extend 32) (currentByte!6409 thiss!1634)) ((_ sign_extend 32) (currentBit!6404 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!232201 () Unit!9431)

(assert (=> b!148892 (= lt!232201 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3495 (_2!6983 lt!232207)) (bvsub to!404 from!447)))))

(assert (=> b!148892 (= (_2!6986 lt!232194) (select (arr!3804 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!5298) tuple2!13244)

(assert (=> b!148892 (= lt!232194 (readBytePure!0 (_1!6985 lt!232195)))))

(assert (=> b!148892 (= lt!232190 (reader!0 (_2!6983 lt!232184) (_2!6983 lt!232207)))))

(assert (=> b!148892 (= lt!232195 (reader!0 thiss!1634 (_2!6983 lt!232207)))))

(assert (=> b!148892 e!99353))

(declare-fun res!124662 () Bool)

(assert (=> b!148892 (=> (not res!124662) (not e!99353))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!148892 (= res!124662 (= (bitIndex!0 (size!3020 (buf!3495 (_1!6986 lt!232186))) (currentByte!6409 (_1!6986 lt!232186)) (currentBit!6404 (_1!6986 lt!232186))) (bitIndex!0 (size!3020 (buf!3495 (_1!6986 lt!232198))) (currentByte!6409 (_1!6986 lt!232198)) (currentBit!6404 (_1!6986 lt!232198)))))))

(declare-fun lt!232200 () Unit!9431)

(declare-fun lt!232187 () BitStream!5298)

(declare-fun readBytePrefixLemma!0 (BitStream!5298 BitStream!5298) Unit!9431)

(assert (=> b!148892 (= lt!232200 (readBytePrefixLemma!0 lt!232187 (_2!6983 lt!232207)))))

(assert (=> b!148892 (= lt!232198 (readBytePure!0 (BitStream!5299 (buf!3495 (_2!6983 lt!232207)) (currentByte!6409 thiss!1634) (currentBit!6404 thiss!1634))))))

(assert (=> b!148892 (= lt!232186 (readBytePure!0 lt!232187))))

(assert (=> b!148892 (= lt!232187 (BitStream!5299 (buf!3495 (_2!6983 lt!232184)) (currentByte!6409 thiss!1634) (currentBit!6404 thiss!1634)))))

(declare-fun e!99360 () Bool)

(assert (=> b!148892 e!99360))

(declare-fun res!124660 () Bool)

(assert (=> b!148892 (=> (not res!124660) (not e!99360))))

(assert (=> b!148892 (= res!124660 (isPrefixOf!0 thiss!1634 (_2!6983 lt!232207)))))

(declare-fun lt!232209 () Unit!9431)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5298 BitStream!5298 BitStream!5298) Unit!9431)

(assert (=> b!148892 (= lt!232209 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6983 lt!232184) (_2!6983 lt!232207)))))

(declare-fun e!99364 () Bool)

(assert (=> b!148892 e!99364))

(declare-fun res!124665 () Bool)

(assert (=> b!148892 (=> (not res!124665) (not e!99364))))

(assert (=> b!148892 (= res!124665 (= (size!3020 (buf!3495 (_2!6983 lt!232184))) (size!3020 (buf!3495 (_2!6983 lt!232207)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5298 array!6676 (_ BitVec 32) (_ BitVec 32)) tuple2!13238)

(assert (=> b!148892 (= lt!232207 (appendByteArrayLoop!0 (_2!6983 lt!232184) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!148892 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3020 (buf!3495 (_2!6983 lt!232184)))) ((_ sign_extend 32) (currentByte!6409 (_2!6983 lt!232184))) ((_ sign_extend 32) (currentBit!6404 (_2!6983 lt!232184))) lt!232205)))

(assert (=> b!148892 (= lt!232205 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!232189 () Unit!9431)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5298 BitStream!5298 (_ BitVec 64) (_ BitVec 32)) Unit!9431)

(assert (=> b!148892 (= lt!232189 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6983 lt!232184) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!148892 e!99363))

(declare-fun res!124655 () Bool)

(assert (=> b!148892 (=> (not res!124655) (not e!99363))))

(assert (=> b!148892 (= res!124655 (= (size!3020 (buf!3495 thiss!1634)) (size!3020 (buf!3495 (_2!6983 lt!232184)))))))

(declare-fun appendByte!0 (BitStream!5298 (_ BitVec 8)) tuple2!13238)

(assert (=> b!148892 (= lt!232184 (appendByte!0 thiss!1634 (select (arr!3804 arr!237) from!447)))))

(declare-fun b!148893 () Bool)

(declare-fun res!124657 () Bool)

(assert (=> b!148893 (=> (not res!124657) (not e!99359))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!148893 (= res!124657 (invariant!0 (currentBit!6404 thiss!1634) (currentByte!6409 thiss!1634) (size!3020 (buf!3495 thiss!1634))))))

(declare-fun b!148894 () Bool)

(declare-fun res!124667 () Bool)

(assert (=> b!148894 (=> (not res!124667) (not e!99359))))

(assert (=> b!148894 (= res!124667 (bvslt from!447 to!404))))

(declare-fun lt!232202 () tuple2!13242)

(declare-fun lt!232193 () tuple2!13244)

(declare-fun b!148895 () Bool)

(assert (=> b!148895 (= e!99363 (and (= (_2!6986 lt!232193) (select (arr!3804 arr!237) from!447)) (= (_1!6986 lt!232193) (_2!6985 lt!232202))))))

(assert (=> b!148895 (= lt!232193 (readBytePure!0 (_1!6985 lt!232202)))))

(assert (=> b!148895 (= lt!232202 (reader!0 thiss!1634 (_2!6983 lt!232184)))))

(declare-fun b!148896 () Bool)

(declare-fun e!99358 () Bool)

(assert (=> b!148896 (= e!99361 e!99358)))

(declare-fun res!124664 () Bool)

(assert (=> b!148896 (=> res!124664 e!99358)))

(assert (=> b!148896 (= res!124664 (or (bvsgt #b00000000000000000000000000000000 to!404) (bvsgt (size!3020 arr!237) (size!3020 (_2!6984 lt!232204))) (bvsgt (size!3020 (_2!6984 lt!232204)) (size!3020 (_2!6984 lt!232191))) (bvsgt to!404 (size!3020 (_2!6984 lt!232204)))))))

(assert (=> b!148896 (arrayRangesEq!336 (_2!6984 lt!232204) (_2!6984 lt!232191) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!232199 () Unit!9431)

(declare-fun arrayRangesEqSymmetricLemma!68 (array!6676 array!6676 (_ BitVec 32) (_ BitVec 32)) Unit!9431)

(assert (=> b!148896 (= lt!232199 (arrayRangesEqSymmetricLemma!68 (_2!6984 lt!232191) (_2!6984 lt!232204) #b00000000000000000000000000000000 to!404))))

(declare-fun b!148897 () Bool)

(declare-fun res!124661 () Bool)

(assert (=> b!148897 (=> (not res!124661) (not e!99363))))

(assert (=> b!148897 (= res!124661 (= (bitIndex!0 (size!3020 (buf!3495 (_2!6983 lt!232184))) (currentByte!6409 (_2!6983 lt!232184)) (currentBit!6404 (_2!6983 lt!232184))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3020 (buf!3495 thiss!1634)) (currentByte!6409 thiss!1634) (currentBit!6404 thiss!1634)))))))

(declare-fun b!148898 () Bool)

(assert (=> b!148898 (= e!99364 e!99362)))

(declare-fun res!124654 () Bool)

(assert (=> b!148898 (=> (not res!124654) (not e!99362))))

(assert (=> b!148898 (= res!124654 (= (bitIndex!0 (size!3020 (buf!3495 (_2!6983 lt!232207))) (currentByte!6409 (_2!6983 lt!232207)) (currentBit!6404 (_2!6983 lt!232207))) (bvadd (bitIndex!0 (size!3020 (buf!3495 (_2!6983 lt!232184))) (currentByte!6409 (_2!6983 lt!232184)) (currentBit!6404 (_2!6983 lt!232184))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!232196))))))

(assert (=> b!148898 (= lt!232196 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!148899 () Bool)

(assert (=> b!148899 (= e!99358 (arrayRangesEq!336 arr!237 (_2!6984 lt!232204) #b00000000000000000000000000000000 to!404))))

(declare-fun b!148900 () Bool)

(assert (=> b!148900 (= e!99360 (invariant!0 (currentBit!6404 thiss!1634) (currentByte!6409 thiss!1634) (size!3020 (buf!3495 (_2!6983 lt!232184)))))))

(declare-fun b!148901 () Bool)

(declare-fun res!124663 () Bool)

(assert (=> b!148901 (=> (not res!124663) (not e!99362))))

(assert (=> b!148901 (= res!124663 (isPrefixOf!0 (_2!6983 lt!232184) (_2!6983 lt!232207)))))

(assert (= (and start!28754 res!124659) b!148887))

(assert (= (and b!148887 res!124666) b!148894))

(assert (= (and b!148894 res!124667) b!148893))

(assert (= (and b!148893 res!124657) b!148892))

(assert (= (and b!148892 res!124655) b!148897))

(assert (= (and b!148897 res!124661) b!148886))

(assert (= (and b!148886 res!124653) b!148895))

(assert (= (and b!148892 res!124665) b!148898))

(assert (= (and b!148898 res!124654) b!148901))

(assert (= (and b!148901 res!124663) b!148888))

(assert (= (and b!148888 (not res!124656)) b!148889))

(assert (= (and b!148892 res!124660) b!148900))

(assert (= (and b!148892 res!124662) b!148891))

(assert (= (and b!148892 (not res!124658)) b!148896))

(assert (= (and b!148896 (not res!124664)) b!148899))

(assert (= start!28754 b!148890))

(declare-fun m!231391 () Bool)

(assert (=> b!148887 m!231391))

(declare-fun m!231393 () Bool)

(assert (=> b!148899 m!231393))

(declare-fun m!231395 () Bool)

(assert (=> b!148888 m!231395))

(declare-fun m!231397 () Bool)

(assert (=> b!148888 m!231397))

(declare-fun m!231399 () Bool)

(assert (=> b!148888 m!231399))

(declare-fun m!231401 () Bool)

(assert (=> b!148888 m!231401))

(declare-fun m!231403 () Bool)

(assert (=> b!148896 m!231403))

(declare-fun m!231405 () Bool)

(assert (=> b!148896 m!231405))

(declare-fun m!231407 () Bool)

(assert (=> b!148892 m!231407))

(declare-fun m!231409 () Bool)

(assert (=> b!148892 m!231409))

(declare-fun m!231411 () Bool)

(assert (=> b!148892 m!231411))

(declare-fun m!231413 () Bool)

(assert (=> b!148892 m!231413))

(declare-fun m!231415 () Bool)

(assert (=> b!148892 m!231415))

(declare-fun m!231417 () Bool)

(assert (=> b!148892 m!231417))

(declare-fun m!231419 () Bool)

(assert (=> b!148892 m!231419))

(declare-fun m!231421 () Bool)

(assert (=> b!148892 m!231421))

(declare-fun m!231423 () Bool)

(assert (=> b!148892 m!231423))

(declare-fun m!231425 () Bool)

(assert (=> b!148892 m!231425))

(declare-fun m!231427 () Bool)

(assert (=> b!148892 m!231427))

(declare-fun m!231429 () Bool)

(assert (=> b!148892 m!231429))

(declare-fun m!231431 () Bool)

(assert (=> b!148892 m!231431))

(declare-fun m!231433 () Bool)

(assert (=> b!148892 m!231433))

(declare-fun m!231435 () Bool)

(assert (=> b!148892 m!231435))

(declare-fun m!231437 () Bool)

(assert (=> b!148892 m!231437))

(declare-fun m!231439 () Bool)

(assert (=> b!148892 m!231439))

(declare-fun m!231441 () Bool)

(assert (=> b!148892 m!231441))

(assert (=> b!148892 m!231401))

(declare-fun m!231443 () Bool)

(assert (=> b!148892 m!231443))

(declare-fun m!231445 () Bool)

(assert (=> b!148892 m!231445))

(declare-fun m!231447 () Bool)

(assert (=> b!148892 m!231447))

(declare-fun m!231449 () Bool)

(assert (=> b!148892 m!231449))

(declare-fun m!231451 () Bool)

(assert (=> b!148892 m!231451))

(declare-fun m!231453 () Bool)

(assert (=> b!148892 m!231453))

(declare-fun m!231455 () Bool)

(assert (=> b!148892 m!231455))

(declare-fun m!231457 () Bool)

(assert (=> b!148892 m!231457))

(assert (=> b!148892 m!231437))

(assert (=> b!148892 m!231453))

(declare-fun m!231459 () Bool)

(assert (=> b!148893 m!231459))

(declare-fun m!231461 () Bool)

(assert (=> start!28754 m!231461))

(declare-fun m!231463 () Bool)

(assert (=> start!28754 m!231463))

(declare-fun m!231465 () Bool)

(assert (=> b!148900 m!231465))

(declare-fun m!231467 () Bool)

(assert (=> b!148886 m!231467))

(declare-fun m!231469 () Bool)

(assert (=> b!148889 m!231469))

(declare-fun m!231471 () Bool)

(assert (=> b!148901 m!231471))

(assert (=> b!148895 m!231453))

(declare-fun m!231473 () Bool)

(assert (=> b!148895 m!231473))

(declare-fun m!231475 () Bool)

(assert (=> b!148895 m!231475))

(declare-fun m!231477 () Bool)

(assert (=> b!148898 m!231477))

(declare-fun m!231479 () Bool)

(assert (=> b!148898 m!231479))

(declare-fun m!231481 () Bool)

(assert (=> b!148890 m!231481))

(assert (=> b!148897 m!231479))

(declare-fun m!231483 () Bool)

(assert (=> b!148897 m!231483))

(check-sat (not b!148899) (not b!148890) (not b!148901) (not b!148900) (not b!148892) (not b!148896) (not start!28754) (not b!148888) (not b!148898) (not b!148895) (not b!148893) (not b!148889) (not b!148887) (not b!148897) (not b!148886))
(check-sat)
