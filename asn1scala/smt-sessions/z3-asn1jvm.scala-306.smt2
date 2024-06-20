; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6010 () Bool)

(assert start!6010)

(declare-fun b!28188 () Bool)

(declare-fun e!18990 () Bool)

(declare-fun e!18996 () Bool)

(assert (=> b!28188 (= e!18990 e!18996)))

(declare-fun res!24453 () Bool)

(assert (=> b!28188 (=> res!24453 e!18996)))

(declare-datatypes ((array!1747 0))(
  ( (array!1748 (arr!1218 (Array (_ BitVec 32) (_ BitVec 8))) (size!756 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1344 0))(
  ( (BitStream!1345 (buf!1083 array!1747) (currentByte!2408 (_ BitVec 32)) (currentBit!2403 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2215 0))(
  ( (Unit!2216) )
))
(declare-datatypes ((tuple2!3054 0))(
  ( (tuple2!3055 (_1!1614 Unit!2215) (_2!1614 BitStream!1344)) )
))
(declare-fun lt!39672 () tuple2!3054)

(declare-fun lt!39673 () tuple2!3054)

(assert (=> b!28188 (= res!24453 (not (= (size!756 (buf!1083 (_2!1614 lt!39672))) (size!756 (buf!1083 (_2!1614 lt!39673))))))))

(declare-fun e!19000 () Bool)

(assert (=> b!28188 e!19000))

(declare-fun res!24448 () Bool)

(assert (=> b!28188 (=> (not res!24448) (not e!19000))))

(declare-fun thiss!1379 () BitStream!1344)

(assert (=> b!28188 (= res!24448 (= (size!756 (buf!1083 (_2!1614 lt!39673))) (size!756 (buf!1083 thiss!1379))))))

(declare-fun b!28189 () Bool)

(declare-fun res!24459 () Bool)

(declare-fun e!18992 () Bool)

(assert (=> b!28189 (=> res!24459 e!18992)))

(declare-fun lt!39676 () (_ BitVec 64))

(declare-datatypes ((tuple2!3056 0))(
  ( (tuple2!3057 (_1!1615 BitStream!1344) (_2!1615 BitStream!1344)) )
))
(declare-fun lt!39668 () tuple2!3056)

(declare-fun lt!39675 () tuple2!3056)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!28189 (= res!24459 (or (not (= (buf!1083 (_1!1615 lt!39668)) (buf!1083 (_1!1615 lt!39675)))) (not (= (buf!1083 (_1!1615 lt!39668)) (buf!1083 (_2!1614 lt!39673)))) (bvsge lt!39676 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!28190 () Bool)

(declare-fun e!18993 () Bool)

(declare-fun array_inv!725 (array!1747) Bool)

(assert (=> b!28190 (= e!18993 (array_inv!725 (buf!1083 thiss!1379)))))

(declare-fun b!28191 () Bool)

(declare-fun res!24456 () Bool)

(assert (=> b!28191 (=> res!24456 e!18992)))

(declare-fun isPrefixOf!0 (BitStream!1344 BitStream!1344) Bool)

(assert (=> b!28191 (= res!24456 (not (isPrefixOf!0 (_1!1615 lt!39668) (_1!1615 lt!39675))))))

(declare-fun b!28192 () Bool)

(assert (=> b!28192 (= e!18992 true)))

(declare-fun lt!39661 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!28192 (= lt!39661 (bitIndex!0 (size!756 (buf!1083 (_1!1615 lt!39675))) (currentByte!2408 (_1!1615 lt!39675)) (currentBit!2403 (_1!1615 lt!39675))))))

(declare-fun lt!39663 () (_ BitVec 64))

(assert (=> b!28192 (= lt!39663 (bitIndex!0 (size!756 (buf!1083 (_1!1615 lt!39668))) (currentByte!2408 (_1!1615 lt!39668)) (currentBit!2403 (_1!1615 lt!39668))))))

(declare-fun b!28193 () Bool)

(declare-fun e!18995 () Bool)

(assert (=> b!28193 (= e!18995 e!18990)))

(declare-fun res!24458 () Bool)

(assert (=> b!28193 (=> res!24458 e!18990)))

(declare-fun lt!39674 () (_ BitVec 64))

(assert (=> b!28193 (= res!24458 (not (= lt!39676 (bvsub (bvadd lt!39674 to!314) i!635))))))

(assert (=> b!28193 (= lt!39676 (bitIndex!0 (size!756 (buf!1083 (_2!1614 lt!39673))) (currentByte!2408 (_2!1614 lt!39673)) (currentBit!2403 (_2!1614 lt!39673))))))

(declare-fun srcBuffer!2 () array!1747)

(declare-fun b!28194 () Bool)

(declare-fun lt!39666 () tuple2!3056)

(declare-fun e!18998 () Bool)

(declare-datatypes ((List!373 0))(
  ( (Nil!370) (Cons!369 (h!488 Bool) (t!1123 List!373)) )
))
(declare-fun head!210 (List!373) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1344 array!1747 (_ BitVec 64) (_ BitVec 64)) List!373)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1344 BitStream!1344 (_ BitVec 64)) List!373)

(assert (=> b!28194 (= e!18998 (= (head!210 (byteArrayBitContentToList!0 (_2!1614 lt!39672) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!210 (bitStreamReadBitsIntoList!0 (_2!1614 lt!39672) (_1!1615 lt!39666) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun res!24451 () Bool)

(declare-fun e!18989 () Bool)

(assert (=> start!6010 (=> (not res!24451) (not e!18989))))

(assert (=> start!6010 (= res!24451 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!756 srcBuffer!2))))))))

(assert (=> start!6010 e!18989))

(assert (=> start!6010 true))

(assert (=> start!6010 (array_inv!725 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1344) Bool)

(assert (=> start!6010 (and (inv!12 thiss!1379) e!18993)))

(declare-fun b!28195 () Bool)

(declare-fun res!24464 () Bool)

(assert (=> b!28195 (=> res!24464 e!18996)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!28195 (= res!24464 (not (invariant!0 (currentBit!2403 (_2!1614 lt!39672)) (currentByte!2408 (_2!1614 lt!39672)) (size!756 (buf!1083 (_2!1614 lt!39673))))))))

(declare-fun b!28196 () Bool)

(assert (=> b!28196 (= e!18996 e!18992)))

(declare-fun res!24447 () Bool)

(assert (=> b!28196 (=> res!24447 e!18992)))

(assert (=> b!28196 (= res!24447 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!39669 () List!373)

(declare-fun lt!39660 () (_ BitVec 64))

(assert (=> b!28196 (= lt!39669 (bitStreamReadBitsIntoList!0 (_2!1614 lt!39673) (_1!1615 lt!39675) lt!39660))))

(declare-fun lt!39670 () List!373)

(assert (=> b!28196 (= lt!39670 (bitStreamReadBitsIntoList!0 (_2!1614 lt!39673) (_1!1615 lt!39668) (bvsub to!314 i!635)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!28196 (validate_offset_bits!1 ((_ sign_extend 32) (size!756 (buf!1083 (_2!1614 lt!39673)))) ((_ sign_extend 32) (currentByte!2408 (_2!1614 lt!39672))) ((_ sign_extend 32) (currentBit!2403 (_2!1614 lt!39672))) lt!39660)))

(declare-fun lt!39664 () Unit!2215)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1344 array!1747 (_ BitVec 64)) Unit!2215)

(assert (=> b!28196 (= lt!39664 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1614 lt!39672) (buf!1083 (_2!1614 lt!39673)) lt!39660))))

(declare-fun reader!0 (BitStream!1344 BitStream!1344) tuple2!3056)

(assert (=> b!28196 (= lt!39675 (reader!0 (_2!1614 lt!39672) (_2!1614 lt!39673)))))

(assert (=> b!28196 (validate_offset_bits!1 ((_ sign_extend 32) (size!756 (buf!1083 (_2!1614 lt!39673)))) ((_ sign_extend 32) (currentByte!2408 thiss!1379)) ((_ sign_extend 32) (currentBit!2403 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!39662 () Unit!2215)

(assert (=> b!28196 (= lt!39662 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1083 (_2!1614 lt!39673)) (bvsub to!314 i!635)))))

(assert (=> b!28196 (= lt!39668 (reader!0 thiss!1379 (_2!1614 lt!39673)))))

(declare-fun b!28197 () Bool)

(declare-fun res!24457 () Bool)

(assert (=> b!28197 (=> res!24457 e!18992)))

(declare-fun length!99 (List!373) Int)

(assert (=> b!28197 (= res!24457 (<= (length!99 lt!39670) 0))))

(declare-fun b!28198 () Bool)

(declare-fun e!18994 () Bool)

(assert (=> b!28198 (= e!18994 e!18995)))

(declare-fun res!24460 () Bool)

(assert (=> b!28198 (=> res!24460 e!18995)))

(assert (=> b!28198 (= res!24460 (not (isPrefixOf!0 (_2!1614 lt!39672) (_2!1614 lt!39673))))))

(assert (=> b!28198 (isPrefixOf!0 thiss!1379 (_2!1614 lt!39673))))

(declare-fun lt!39659 () Unit!2215)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1344 BitStream!1344 BitStream!1344) Unit!2215)

(assert (=> b!28198 (= lt!39659 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1614 lt!39672) (_2!1614 lt!39673)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1344 array!1747 (_ BitVec 64) (_ BitVec 64)) tuple2!3054)

(assert (=> b!28198 (= lt!39673 (appendBitsMSBFirstLoop!0 (_2!1614 lt!39672) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!28198 e!18998))

(declare-fun res!24449 () Bool)

(assert (=> b!28198 (=> (not res!24449) (not e!18998))))

(assert (=> b!28198 (= res!24449 (validate_offset_bits!1 ((_ sign_extend 32) (size!756 (buf!1083 (_2!1614 lt!39672)))) ((_ sign_extend 32) (currentByte!2408 thiss!1379)) ((_ sign_extend 32) (currentBit!2403 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39665 () Unit!2215)

(assert (=> b!28198 (= lt!39665 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1083 (_2!1614 lt!39672)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!28198 (= lt!39666 (reader!0 thiss!1379 (_2!1614 lt!39672)))))

(declare-fun b!28199 () Bool)

(declare-fun res!24452 () Bool)

(assert (=> b!28199 (=> res!24452 e!18992)))

(assert (=> b!28199 (= res!24452 (not (isPrefixOf!0 (_1!1615 lt!39668) (_2!1614 lt!39673))))))

(declare-fun b!28200 () Bool)

(declare-fun res!24450 () Bool)

(assert (=> b!28200 (=> res!24450 e!18990)))

(assert (=> b!28200 (= res!24450 (not (= (size!756 (buf!1083 thiss!1379)) (size!756 (buf!1083 (_2!1614 lt!39673))))))))

(declare-fun b!28201 () Bool)

(declare-fun e!18999 () Bool)

(assert (=> b!28201 (= e!18999 e!18994)))

(declare-fun res!24463 () Bool)

(assert (=> b!28201 (=> res!24463 e!18994)))

(assert (=> b!28201 (= res!24463 (not (isPrefixOf!0 thiss!1379 (_2!1614 lt!39672))))))

(assert (=> b!28201 (validate_offset_bits!1 ((_ sign_extend 32) (size!756 (buf!1083 (_2!1614 lt!39672)))) ((_ sign_extend 32) (currentByte!2408 (_2!1614 lt!39672))) ((_ sign_extend 32) (currentBit!2403 (_2!1614 lt!39672))) lt!39660)))

(assert (=> b!28201 (= lt!39660 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39667 () Unit!2215)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1344 BitStream!1344 (_ BitVec 64) (_ BitVec 64)) Unit!2215)

(assert (=> b!28201 (= lt!39667 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1614 lt!39672) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1344 (_ BitVec 8) (_ BitVec 32)) tuple2!3054)

(assert (=> b!28201 (= lt!39672 (appendBitFromByte!0 thiss!1379 (select (arr!1218 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!28202 () Bool)

(assert (=> b!28202 (= e!19000 (= lt!39676 (bvsub (bvsub (bvadd (bitIndex!0 (size!756 (buf!1083 (_2!1614 lt!39672))) (currentByte!2408 (_2!1614 lt!39672)) (currentBit!2403 (_2!1614 lt!39672))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!28203 () Bool)

(declare-fun res!24462 () Bool)

(assert (=> b!28203 (=> res!24462 e!18996)))

(assert (=> b!28203 (= res!24462 (not (invariant!0 (currentBit!2403 (_2!1614 lt!39672)) (currentByte!2408 (_2!1614 lt!39672)) (size!756 (buf!1083 (_2!1614 lt!39672))))))))

(declare-fun b!28204 () Bool)

(declare-fun res!24455 () Bool)

(assert (=> b!28204 (=> (not res!24455) (not e!18989))))

(assert (=> b!28204 (= res!24455 (validate_offset_bits!1 ((_ sign_extend 32) (size!756 (buf!1083 thiss!1379))) ((_ sign_extend 32) (currentByte!2408 thiss!1379)) ((_ sign_extend 32) (currentBit!2403 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!28205 () Bool)

(declare-fun res!24465 () Bool)

(assert (=> b!28205 (=> res!24465 e!18990)))

(assert (=> b!28205 (= res!24465 (not (invariant!0 (currentBit!2403 (_2!1614 lt!39673)) (currentByte!2408 (_2!1614 lt!39673)) (size!756 (buf!1083 (_2!1614 lt!39673))))))))

(declare-fun b!28206 () Bool)

(declare-fun res!24461 () Bool)

(assert (=> b!28206 (=> res!24461 e!18992)))

(assert (=> b!28206 (= res!24461 (not (isPrefixOf!0 (_1!1615 lt!39675) (_2!1614 lt!39673))))))

(declare-fun b!28207 () Bool)

(assert (=> b!28207 (= e!18989 (not e!18999))))

(declare-fun res!24454 () Bool)

(assert (=> b!28207 (=> res!24454 e!18999)))

(assert (=> b!28207 (= res!24454 (bvsge i!635 to!314))))

(assert (=> b!28207 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!39671 () Unit!2215)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1344) Unit!2215)

(assert (=> b!28207 (= lt!39671 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!28207 (= lt!39674 (bitIndex!0 (size!756 (buf!1083 thiss!1379)) (currentByte!2408 thiss!1379) (currentBit!2403 thiss!1379)))))

(assert (= (and start!6010 res!24451) b!28204))

(assert (= (and b!28204 res!24455) b!28207))

(assert (= (and b!28207 (not res!24454)) b!28201))

(assert (= (and b!28201 (not res!24463)) b!28198))

(assert (= (and b!28198 res!24449) b!28194))

(assert (= (and b!28198 (not res!24460)) b!28193))

(assert (= (and b!28193 (not res!24458)) b!28205))

(assert (= (and b!28205 (not res!24465)) b!28200))

(assert (= (and b!28200 (not res!24450)) b!28188))

(assert (= (and b!28188 res!24448) b!28202))

(assert (= (and b!28188 (not res!24453)) b!28203))

(assert (= (and b!28203 (not res!24462)) b!28195))

(assert (= (and b!28195 (not res!24464)) b!28196))

(assert (= (and b!28196 (not res!24447)) b!28197))

(assert (= (and b!28197 (not res!24457)) b!28199))

(assert (= (and b!28199 (not res!24452)) b!28206))

(assert (= (and b!28206 (not res!24461)) b!28191))

(assert (= (and b!28191 (not res!24456)) b!28189))

(assert (= (and b!28189 (not res!24459)) b!28192))

(assert (= start!6010 b!28190))

(declare-fun m!40365 () Bool)

(assert (=> b!28201 m!40365))

(declare-fun m!40367 () Bool)

(assert (=> b!28201 m!40367))

(declare-fun m!40369 () Bool)

(assert (=> b!28201 m!40369))

(assert (=> b!28201 m!40367))

(declare-fun m!40371 () Bool)

(assert (=> b!28201 m!40371))

(declare-fun m!40373 () Bool)

(assert (=> b!28201 m!40373))

(declare-fun m!40375 () Bool)

(assert (=> b!28206 m!40375))

(declare-fun m!40377 () Bool)

(assert (=> b!28190 m!40377))

(declare-fun m!40379 () Bool)

(assert (=> b!28207 m!40379))

(declare-fun m!40381 () Bool)

(assert (=> b!28207 m!40381))

(declare-fun m!40383 () Bool)

(assert (=> b!28207 m!40383))

(declare-fun m!40385 () Bool)

(assert (=> b!28197 m!40385))

(declare-fun m!40387 () Bool)

(assert (=> b!28205 m!40387))

(declare-fun m!40389 () Bool)

(assert (=> b!28194 m!40389))

(assert (=> b!28194 m!40389))

(declare-fun m!40391 () Bool)

(assert (=> b!28194 m!40391))

(declare-fun m!40393 () Bool)

(assert (=> b!28194 m!40393))

(assert (=> b!28194 m!40393))

(declare-fun m!40395 () Bool)

(assert (=> b!28194 m!40395))

(declare-fun m!40397 () Bool)

(assert (=> b!28203 m!40397))

(declare-fun m!40399 () Bool)

(assert (=> b!28196 m!40399))

(declare-fun m!40401 () Bool)

(assert (=> b!28196 m!40401))

(declare-fun m!40403 () Bool)

(assert (=> b!28196 m!40403))

(declare-fun m!40405 () Bool)

(assert (=> b!28196 m!40405))

(declare-fun m!40407 () Bool)

(assert (=> b!28196 m!40407))

(declare-fun m!40409 () Bool)

(assert (=> b!28196 m!40409))

(declare-fun m!40411 () Bool)

(assert (=> b!28196 m!40411))

(declare-fun m!40413 () Bool)

(assert (=> b!28196 m!40413))

(declare-fun m!40415 () Bool)

(assert (=> b!28198 m!40415))

(declare-fun m!40417 () Bool)

(assert (=> b!28198 m!40417))

(declare-fun m!40419 () Bool)

(assert (=> b!28198 m!40419))

(declare-fun m!40421 () Bool)

(assert (=> b!28198 m!40421))

(declare-fun m!40423 () Bool)

(assert (=> b!28198 m!40423))

(declare-fun m!40425 () Bool)

(assert (=> b!28198 m!40425))

(declare-fun m!40427 () Bool)

(assert (=> b!28198 m!40427))

(declare-fun m!40429 () Bool)

(assert (=> start!6010 m!40429))

(declare-fun m!40431 () Bool)

(assert (=> start!6010 m!40431))

(declare-fun m!40433 () Bool)

(assert (=> b!28204 m!40433))

(declare-fun m!40435 () Bool)

(assert (=> b!28193 m!40435))

(declare-fun m!40437 () Bool)

(assert (=> b!28199 m!40437))

(declare-fun m!40439 () Bool)

(assert (=> b!28202 m!40439))

(declare-fun m!40441 () Bool)

(assert (=> b!28192 m!40441))

(declare-fun m!40443 () Bool)

(assert (=> b!28192 m!40443))

(declare-fun m!40445 () Bool)

(assert (=> b!28195 m!40445))

(declare-fun m!40447 () Bool)

(assert (=> b!28191 m!40447))

(check-sat (not b!28205) (not b!28198) (not b!28204) (not b!28195) (not b!28190) (not b!28201) (not b!28193) (not start!6010) (not b!28199) (not b!28202) (not b!28197) (not b!28194) (not b!28206) (not b!28191) (not b!28192) (not b!28207) (not b!28203) (not b!28196))
