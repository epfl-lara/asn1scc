; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2204 () Bool)

(assert start!2204)

(declare-fun b!10301 () Bool)

(declare-fun res!10306 () Bool)

(declare-fun e!6302 () Bool)

(assert (=> b!10301 (=> (not res!10306) (not e!6302))))

(declare-datatypes ((array!609 0))(
  ( (array!610 (arr!679 (Array (_ BitVec 32) (_ BitVec 8))) (size!262 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!490 0))(
  ( (BitStream!491 (buf!604 array!609) (currentByte!1661 (_ BitVec 32)) (currentBit!1656 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!490)

(declare-datatypes ((Unit!875 0))(
  ( (Unit!876) )
))
(declare-datatypes ((tuple2!1252 0))(
  ( (tuple2!1253 (_1!669 Unit!875) (_2!669 BitStream!490)) )
))
(declare-fun lt!16126 () tuple2!1252)

(assert (=> b!10301 (= res!10306 (= (size!262 (buf!604 thiss!1486)) (size!262 (buf!604 (_2!669 lt!16126)))))))

(declare-fun b!10302 () Bool)

(declare-fun e!6299 () Bool)

(declare-fun array_inv!254 (array!609) Bool)

(assert (=> b!10302 (= e!6299 (array_inv!254 (buf!604 thiss!1486)))))

(declare-fun res!10304 () Bool)

(declare-fun e!6298 () Bool)

(assert (=> start!2204 (=> (not res!10304) (not e!6298))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!609)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!2204 (= res!10304 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!262 srcBuffer!6))))))))

(assert (=> start!2204 e!6298))

(assert (=> start!2204 true))

(assert (=> start!2204 (array_inv!254 srcBuffer!6)))

(declare-fun inv!12 (BitStream!490) Bool)

(assert (=> start!2204 (and (inv!12 thiss!1486) e!6299)))

(declare-fun b!10303 () Bool)

(assert (=> b!10303 (= e!6298 e!6302)))

(declare-fun res!10303 () Bool)

(assert (=> b!10303 (=> (not res!10303) (not e!6302))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!10303 (= res!10303 (invariant!0 (currentBit!1656 (_2!669 lt!16126)) (currentByte!1661 (_2!669 lt!16126)) (size!262 (buf!604 (_2!669 lt!16126)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!490 array!609 (_ BitVec 64) (_ BitVec 64)) tuple2!1252)

(assert (=> b!10303 (= lt!16126 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!10304 () Bool)

(declare-fun lt!16125 () (_ BitVec 64))

(declare-fun lt!16127 () (_ BitVec 64))

(assert (=> b!10304 (= e!6302 (and (= lt!16127 (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!16127 (bvand (bvadd lt!16125 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!10304 (= lt!16127 (bvand lt!16125 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!10304 (= lt!16125 (bitIndex!0 (size!262 (buf!604 thiss!1486)) (currentByte!1661 thiss!1486) (currentBit!1656 thiss!1486)))))

(declare-fun b!10305 () Bool)

(declare-fun res!10305 () Bool)

(assert (=> b!10305 (=> (not res!10305) (not e!6298))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!10305 (= res!10305 (validate_offset_bits!1 ((_ sign_extend 32) (size!262 (buf!604 thiss!1486))) ((_ sign_extend 32) (currentByte!1661 thiss!1486)) ((_ sign_extend 32) (currentBit!1656 thiss!1486)) nBits!460))))

(assert (= (and start!2204 res!10304) b!10305))

(assert (= (and b!10305 res!10305) b!10303))

(assert (= (and b!10303 res!10303) b!10301))

(assert (= (and b!10301 res!10306) b!10304))

(assert (= start!2204 b!10302))

(declare-fun m!15029 () Bool)

(assert (=> b!10303 m!15029))

(declare-fun m!15031 () Bool)

(assert (=> b!10303 m!15031))

(declare-fun m!15033 () Bool)

(assert (=> b!10302 m!15033))

(declare-fun m!15035 () Bool)

(assert (=> b!10305 m!15035))

(declare-fun m!15037 () Bool)

(assert (=> b!10304 m!15037))

(declare-fun m!15039 () Bool)

(assert (=> start!2204 m!15039))

(declare-fun m!15041 () Bool)

(assert (=> start!2204 m!15041))

(push 1)

(assert (not b!10303))

(assert (not start!2204))

(assert (not b!10304))

(assert (not b!10302))

(assert (not b!10305))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!3294 () Bool)

(assert (=> d!3294 (= (invariant!0 (currentBit!1656 (_2!669 lt!16126)) (currentByte!1661 (_2!669 lt!16126)) (size!262 (buf!604 (_2!669 lt!16126)))) (and (bvsge (currentBit!1656 (_2!669 lt!16126)) #b00000000000000000000000000000000) (bvslt (currentBit!1656 (_2!669 lt!16126)) #b00000000000000000000000000001000) (bvsge (currentByte!1661 (_2!669 lt!16126)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1661 (_2!669 lt!16126)) (size!262 (buf!604 (_2!669 lt!16126)))) (and (= (currentBit!1656 (_2!669 lt!16126)) #b00000000000000000000000000000000) (= (currentByte!1661 (_2!669 lt!16126)) (size!262 (buf!604 (_2!669 lt!16126))))))))))

(assert (=> b!10303 d!3294))

(declare-fun lt!16435 () tuple2!1252)

(declare-fun e!6355 () Bool)

(declare-fun b!10386 () Bool)

(declare-datatypes ((tuple2!1258 0))(
  ( (tuple2!1259 (_1!672 BitStream!490) (_2!672 BitStream!490)) )
))
(declare-fun lt!16436 () tuple2!1258)

(declare-datatypes ((List!150 0))(
  ( (Nil!147) (Cons!146 (h!265 Bool) (t!900 List!150)) )
))
(declare-fun bitStreamReadBitsIntoList!0 (BitStream!490 BitStream!490 (_ BitVec 64)) List!150)

(declare-fun byteArrayBitContentToList!0 (BitStream!490 array!609 (_ BitVec 64) (_ BitVec 64)) List!150)

(assert (=> b!10386 (= e!6355 (= (bitStreamReadBitsIntoList!0 (_2!669 lt!16435) (_1!672 lt!16436) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!669 lt!16435) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!10386 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10386 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!16410 () Unit!875)

(declare-fun lt!16447 () Unit!875)

(assert (=> b!10386 (= lt!16410 lt!16447)))

(declare-fun lt!16413 () (_ BitVec 64))

(assert (=> b!10386 (validate_offset_bits!1 ((_ sign_extend 32) (size!262 (buf!604 (_2!669 lt!16435)))) ((_ sign_extend 32) (currentByte!1661 thiss!1486)) ((_ sign_extend 32) (currentBit!1656 thiss!1486)) lt!16413)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!490 array!609 (_ BitVec 64)) Unit!875)

(assert (=> b!10386 (= lt!16447 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!604 (_2!669 lt!16435)) lt!16413))))

(declare-fun e!6354 () Bool)

(assert (=> b!10386 e!6354))

(declare-fun res!10371 () Bool)

(assert (=> b!10386 (=> (not res!10371) (not e!6354))))

(assert (=> b!10386 (= res!10371 (and (= (size!262 (buf!604 thiss!1486)) (size!262 (buf!604 (_2!669 lt!16435)))) (bvsge lt!16413 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10386 (= lt!16413 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!10386 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!490 BitStream!490) tuple2!1258)

(assert (=> b!10386 (= lt!16436 (reader!0 thiss!1486 (_2!669 lt!16435)))))

(declare-fun b!10387 () Bool)

(declare-fun res!10368 () Bool)

(assert (=> b!10387 (=> (not res!10368) (not e!6355))))

(assert (=> b!10387 (= res!10368 (= (size!262 (buf!604 thiss!1486)) (size!262 (buf!604 (_2!669 lt!16435)))))))

(declare-fun b!10388 () Bool)

(assert (=> b!10388 (= e!6354 (validate_offset_bits!1 ((_ sign_extend 32) (size!262 (buf!604 thiss!1486))) ((_ sign_extend 32) (currentByte!1661 thiss!1486)) ((_ sign_extend 32) (currentBit!1656 thiss!1486)) lt!16413))))

(declare-fun b!10389 () Bool)

(declare-fun res!10372 () Bool)

(assert (=> b!10389 (=> (not res!10372) (not e!6355))))

(assert (=> b!10389 (= res!10372 (invariant!0 (currentBit!1656 (_2!669 lt!16435)) (currentByte!1661 (_2!669 lt!16435)) (size!262 (buf!604 (_2!669 lt!16435)))))))

(declare-fun d!3296 () Bool)

(assert (=> d!3296 e!6355))

(declare-fun res!10370 () Bool)

(assert (=> d!3296 (=> (not res!10370) (not e!6355))))

(declare-fun lt!16411 () (_ BitVec 64))

(assert (=> d!3296 (= res!10370 (= (bitIndex!0 (size!262 (buf!604 (_2!669 lt!16435))) (currentByte!1661 (_2!669 lt!16435)) (currentBit!1656 (_2!669 lt!16435))) (bvsub lt!16411 from!367)))))

(assert (=> d!3296 (or (= (bvand lt!16411 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!16411 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!16411 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!16451 () (_ BitVec 64))

(assert (=> d!3296 (= lt!16411 (bvadd lt!16451 from!367 nBits!460))))

(assert (=> d!3296 (or (not (= (bvand lt!16451 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!16451 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!16451 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3296 (= lt!16451 (bitIndex!0 (size!262 (buf!604 thiss!1486)) (currentByte!1661 thiss!1486) (currentBit!1656 thiss!1486)))))

(declare-fun e!6353 () tuple2!1252)

(assert (=> d!3296 (= lt!16435 e!6353)))

(declare-fun c!718 () Bool)

(assert (=> d!3296 (= c!718 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!16418 () Unit!875)

(declare-fun lt!16433 () Unit!875)

(assert (=> d!3296 (= lt!16418 lt!16433)))

(declare-fun isPrefixOf!0 (BitStream!490 BitStream!490) Bool)

(assert (=> d!3296 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!490) Unit!875)

(assert (=> d!3296 (= lt!16433 (lemmaIsPrefixRefl!0 thiss!1486))))

(declare-fun lt!16449 () (_ BitVec 64))

(assert (=> d!3296 (= lt!16449 (bitIndex!0 (size!262 (buf!604 thiss!1486)) (currentByte!1661 thiss!1486) (currentBit!1656 thiss!1486)))))

(assert (=> d!3296 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3296 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!16435)))

(declare-fun b!10390 () Bool)

(declare-fun Unit!886 () Unit!875)

(assert (=> b!10390 (= e!6353 (tuple2!1253 Unit!886 thiss!1486))))

(assert (=> b!10390 (= (size!262 (buf!604 thiss!1486)) (size!262 (buf!604 thiss!1486)))))

(declare-fun lt!16430 () Unit!875)

(declare-fun Unit!887 () Unit!875)

(assert (=> b!10390 (= lt!16430 Unit!887)))

(declare-fun call!194 () tuple2!1258)

(declare-fun checkByteArrayBitContent!0 (BitStream!490 array!609 array!609 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!1262 0))(
  ( (tuple2!1263 (_1!674 array!609) (_2!674 BitStream!490)) )
))
(declare-fun readBits!0 (BitStream!490 (_ BitVec 64)) tuple2!1262)

(assert (=> b!10390 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!674 (readBits!0 (_1!672 call!194) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!10391 () Bool)

(declare-fun res!10369 () Bool)

(assert (=> b!10391 (=> (not res!10369) (not e!6355))))

(assert (=> b!10391 (= res!10369 (isPrefixOf!0 thiss!1486 (_2!669 lt!16435)))))

(declare-fun b!10392 () Bool)

(declare-fun lt!16419 () tuple2!1252)

(declare-fun Unit!888 () Unit!875)

(assert (=> b!10392 (= e!6353 (tuple2!1253 Unit!888 (_2!669 lt!16419)))))

(declare-fun lt!16428 () tuple2!1252)

(declare-fun appendBitFromByte!0 (BitStream!490 (_ BitVec 8) (_ BitVec 32)) tuple2!1252)

(assert (=> b!10392 (= lt!16428 (appendBitFromByte!0 thiss!1486 (select (arr!679 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!16431 () (_ BitVec 64))

(assert (=> b!10392 (= lt!16431 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!16452 () (_ BitVec 64))

(assert (=> b!10392 (= lt!16452 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!16441 () Unit!875)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!490 BitStream!490 (_ BitVec 64) (_ BitVec 64)) Unit!875)

(assert (=> b!10392 (= lt!16441 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!669 lt!16428) lt!16431 lt!16452))))

(assert (=> b!10392 (validate_offset_bits!1 ((_ sign_extend 32) (size!262 (buf!604 (_2!669 lt!16428)))) ((_ sign_extend 32) (currentByte!1661 (_2!669 lt!16428))) ((_ sign_extend 32) (currentBit!1656 (_2!669 lt!16428))) (bvsub lt!16431 lt!16452))))

(declare-fun lt!16415 () Unit!875)

(assert (=> b!10392 (= lt!16415 lt!16441)))

(declare-fun lt!16414 () tuple2!1258)

(assert (=> b!10392 (= lt!16414 (reader!0 thiss!1486 (_2!669 lt!16428)))))

(declare-fun lt!16443 () (_ BitVec 64))

(assert (=> b!10392 (= lt!16443 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!16442 () Unit!875)

(assert (=> b!10392 (= lt!16442 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!604 (_2!669 lt!16428)) lt!16443))))

(assert (=> b!10392 (validate_offset_bits!1 ((_ sign_extend 32) (size!262 (buf!604 (_2!669 lt!16428)))) ((_ sign_extend 32) (currentByte!1661 thiss!1486)) ((_ sign_extend 32) (currentBit!1656 thiss!1486)) lt!16443)))

(declare-fun lt!16427 () Unit!875)

(assert (=> b!10392 (= lt!16427 lt!16442)))

(declare-fun head!57 (List!150) Bool)

(assert (=> b!10392 (= (head!57 (byteArrayBitContentToList!0 (_2!669 lt!16428) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!57 (bitStreamReadBitsIntoList!0 (_2!669 lt!16428) (_1!672 lt!16414) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!16422 () Unit!875)

(declare-fun Unit!889 () Unit!875)

(assert (=> b!10392 (= lt!16422 Unit!889)))

(assert (=> b!10392 (= lt!16419 (appendBitsMSBFirstLoop!0 (_2!669 lt!16428) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!16438 () Unit!875)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!490 BitStream!490 BitStream!490) Unit!875)

(assert (=> b!10392 (= lt!16438 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!669 lt!16428) (_2!669 lt!16419)))))

(assert (=> b!10392 (isPrefixOf!0 thiss!1486 (_2!669 lt!16419))))

(declare-fun lt!16453 () Unit!875)

(assert (=> b!10392 (= lt!16453 lt!16438)))

(assert (=> b!10392 (= (size!262 (buf!604 (_2!669 lt!16419))) (size!262 (buf!604 thiss!1486)))))

(declare-fun lt!16444 () Unit!875)

(declare-fun Unit!890 () Unit!875)

(assert (=> b!10392 (= lt!16444 Unit!890)))

(assert (=> b!10392 (= (bitIndex!0 (size!262 (buf!604 (_2!669 lt!16419))) (currentByte!1661 (_2!669 lt!16419)) (currentBit!1656 (_2!669 lt!16419))) (bvsub (bvadd (bitIndex!0 (size!262 (buf!604 thiss!1486)) (currentByte!1661 thiss!1486) (currentBit!1656 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!16439 () Unit!875)

(declare-fun Unit!892 () Unit!875)

(assert (=> b!10392 (= lt!16439 Unit!892)))

(assert (=> b!10392 (= (bitIndex!0 (size!262 (buf!604 (_2!669 lt!16419))) (currentByte!1661 (_2!669 lt!16419)) (currentBit!1656 (_2!669 lt!16419))) (bvsub (bvsub (bvadd (bitIndex!0 (size!262 (buf!604 (_2!669 lt!16428))) (currentByte!1661 (_2!669 lt!16428)) (currentBit!1656 (_2!669 lt!16428))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!16434 () Unit!875)

(declare-fun Unit!895 () Unit!875)

(assert (=> b!10392 (= lt!16434 Unit!895)))

(declare-fun lt!16437 () tuple2!1258)

(assert (=> b!10392 (= lt!16437 (reader!0 thiss!1486 (_2!669 lt!16419)))))

(declare-fun lt!16448 () (_ BitVec 64))

(assert (=> b!10392 (= lt!16448 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!16421 () Unit!875)

(assert (=> b!10392 (= lt!16421 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!604 (_2!669 lt!16419)) lt!16448))))

(assert (=> b!10392 (validate_offset_bits!1 ((_ sign_extend 32) (size!262 (buf!604 (_2!669 lt!16419)))) ((_ sign_extend 32) (currentByte!1661 thiss!1486)) ((_ sign_extend 32) (currentBit!1656 thiss!1486)) lt!16448)))

(declare-fun lt!16426 () Unit!875)

(assert (=> b!10392 (= lt!16426 lt!16421)))

(declare-fun lt!16429 () tuple2!1258)

(assert (=> b!10392 (= lt!16429 call!194)))

(declare-fun lt!16446 () (_ BitVec 64))

(assert (=> b!10392 (= lt!16446 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!16416 () Unit!875)

(assert (=> b!10392 (= lt!16416 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!669 lt!16428) (buf!604 (_2!669 lt!16419)) lt!16446))))

(assert (=> b!10392 (validate_offset_bits!1 ((_ sign_extend 32) (size!262 (buf!604 (_2!669 lt!16419)))) ((_ sign_extend 32) (currentByte!1661 (_2!669 lt!16428))) ((_ sign_extend 32) (currentBit!1656 (_2!669 lt!16428))) lt!16446)))

(declare-fun lt!16440 () Unit!875)

(assert (=> b!10392 (= lt!16440 lt!16416)))

(declare-fun lt!16424 () List!150)

(assert (=> b!10392 (= lt!16424 (byteArrayBitContentToList!0 (_2!669 lt!16419) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!16420 () List!150)

(assert (=> b!10392 (= lt!16420 (byteArrayBitContentToList!0 (_2!669 lt!16419) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!16425 () List!150)

(assert (=> b!10392 (= lt!16425 (bitStreamReadBitsIntoList!0 (_2!669 lt!16419) (_1!672 lt!16437) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!16432 () List!150)

(assert (=> b!10392 (= lt!16432 (bitStreamReadBitsIntoList!0 (_2!669 lt!16419) (_1!672 lt!16429) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!16417 () (_ BitVec 64))

(assert (=> b!10392 (= lt!16417 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!16450 () Unit!875)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!490 BitStream!490 BitStream!490 BitStream!490 (_ BitVec 64) List!150) Unit!875)

(assert (=> b!10392 (= lt!16450 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!669 lt!16419) (_2!669 lt!16419) (_1!672 lt!16437) (_1!672 lt!16429) lt!16417 lt!16425))))

(declare-fun tail!65 (List!150) List!150)

(assert (=> b!10392 (= (bitStreamReadBitsIntoList!0 (_2!669 lt!16419) (_1!672 lt!16429) (bvsub lt!16417 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!65 lt!16425))))

(declare-fun lt!16445 () Unit!875)

(assert (=> b!10392 (= lt!16445 lt!16450)))

(declare-fun lt!16412 () Unit!875)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!609 array!609 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!875)

(assert (=> b!10392 (= lt!16412 (arrayBitRangesEqImpliesEq!0 (buf!604 (_2!669 lt!16428)) (buf!604 (_2!669 lt!16419)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!16449 (bitIndex!0 (size!262 (buf!604 (_2!669 lt!16428))) (currentByte!1661 (_2!669 lt!16428)) (currentBit!1656 (_2!669 lt!16428)))))))

(declare-fun bitAt!0 (array!609 (_ BitVec 64)) Bool)

(assert (=> b!10392 (= (bitAt!0 (buf!604 (_2!669 lt!16428)) lt!16449) (bitAt!0 (buf!604 (_2!669 lt!16419)) lt!16449))))

(declare-fun lt!16423 () Unit!875)

(assert (=> b!10392 (= lt!16423 lt!16412)))

(declare-fun b!10393 () Bool)

(declare-fun res!10367 () Bool)

(assert (=> b!10393 (=> (not res!10367) (not e!6355))))

(assert (=> b!10393 (= res!10367 (= (size!262 (buf!604 (_2!669 lt!16435))) (size!262 (buf!604 thiss!1486))))))

(declare-fun bm!191 () Bool)

(assert (=> bm!191 (= call!194 (reader!0 (ite c!718 (_2!669 lt!16428) thiss!1486) (ite c!718 (_2!669 lt!16419) thiss!1486)))))

(assert (= (and d!3296 c!718) b!10392))

(assert (= (and d!3296 (not c!718)) b!10390))

(assert (= (or b!10392 b!10390) bm!191))

(assert (= (and d!3296 res!10370) b!10389))

(assert (= (and b!10389 res!10372) b!10387))

(assert (= (and b!10387 res!10368) b!10391))

(assert (= (and b!10391 res!10369) b!10393))

(assert (= (and b!10393 res!10367) b!10386))

(assert (= (and b!10386 res!10371) b!10388))

(declare-fun m!15165 () Bool)

(assert (=> b!10391 m!15165))

(declare-fun m!15167 () Bool)

(assert (=> b!10386 m!15167))

(declare-fun m!15169 () Bool)

(assert (=> b!10386 m!15169))

(declare-fun m!15171 () Bool)

(assert (=> b!10386 m!15171))

(declare-fun m!15173 () Bool)

(assert (=> b!10386 m!15173))

(declare-fun m!15175 () Bool)

(assert (=> b!10386 m!15175))

(declare-fun m!15177 () Bool)

(assert (=> d!3296 m!15177))

(assert (=> d!3296 m!15037))

(declare-fun m!15179 () Bool)

(assert (=> d!3296 m!15179))

(declare-fun m!15181 () Bool)

(assert (=> d!3296 m!15181))

(declare-fun m!15183 () Bool)

(assert (=> bm!191 m!15183))

(declare-fun m!15185 () Bool)

(assert (=> b!10390 m!15185))

(declare-fun m!15187 () Bool)

(assert (=> b!10390 m!15187))

(declare-fun m!15189 () Bool)

(assert (=> b!10392 m!15189))

(declare-fun m!15191 () Bool)

(assert (=> b!10392 m!15191))

(declare-fun m!15193 () Bool)

(assert (=> b!10392 m!15193))

(declare-fun m!15195 () Bool)

(assert (=> b!10392 m!15195))

(declare-fun m!15197 () Bool)

(assert (=> b!10392 m!15197))

(declare-fun m!15199 () Bool)

(assert (=> b!10392 m!15199))

(declare-fun m!15201 () Bool)

(assert (=> b!10392 m!15201))

(declare-fun m!15203 () Bool)

(assert (=> b!10392 m!15203))

(declare-fun m!15205 () Bool)

(assert (=> b!10392 m!15205))

(declare-fun m!15207 () Bool)

(assert (=> b!10392 m!15207))

(declare-fun m!15209 () Bool)

(assert (=> b!10392 m!15209))

(declare-fun m!15211 () Bool)

(assert (=> b!10392 m!15211))

(declare-fun m!15213 () Bool)

(assert (=> b!10392 m!15213))

(assert (=> b!10392 m!15189))

(declare-fun m!15215 () Bool)

(assert (=> b!10392 m!15215))

(declare-fun m!15217 () Bool)

(assert (=> b!10392 m!15217))

(declare-fun m!15219 () Bool)

(assert (=> b!10392 m!15219))

(declare-fun m!15221 () Bool)

(assert (=> b!10392 m!15221))

(declare-fun m!15223 () Bool)

(assert (=> b!10392 m!15223))

(assert (=> b!10392 m!15211))

(declare-fun m!15225 () Bool)

(assert (=> b!10392 m!15225))

(declare-fun m!15227 () Bool)

(assert (=> b!10392 m!15227))

(assert (=> b!10392 m!15193))

(declare-fun m!15229 () Bool)

(assert (=> b!10392 m!15229))

(declare-fun m!15231 () Bool)

(assert (=> b!10392 m!15231))

(declare-fun m!15233 () Bool)

(assert (=> b!10392 m!15233))

(declare-fun m!15235 () Bool)

(assert (=> b!10392 m!15235))

(declare-fun m!15237 () Bool)

(assert (=> b!10392 m!15237))

(assert (=> b!10392 m!15037))

(declare-fun m!15239 () Bool)

(assert (=> b!10392 m!15239))

(declare-fun m!15241 () Bool)

(assert (=> b!10392 m!15241))

(assert (=> b!10392 m!15209))

(declare-fun m!15243 () Bool)

(assert (=> b!10392 m!15243))

(declare-fun m!15245 () Bool)

(assert (=> b!10392 m!15245))

(declare-fun m!15247 () Bool)

(assert (=> b!10392 m!15247))

(declare-fun m!15249 () Bool)

(assert (=> b!10392 m!15249))

(declare-fun m!15251 () Bool)

(assert (=> b!10388 m!15251))

(declare-fun m!15253 () Bool)

(assert (=> b!10389 m!15253))

(assert (=> b!10303 d!3296))

(declare-fun d!3318 () Bool)

(declare-fun e!6365 () Bool)

(assert (=> d!3318 e!6365))

(declare-fun res!10396 () Bool)

(assert (=> d!3318 (=> (not res!10396) (not e!6365))))

(declare-fun lt!16546 () (_ BitVec 64))

(declare-fun lt!16551 () (_ BitVec 64))

(declare-fun lt!16549 () (_ BitVec 64))

(assert (=> d!3318 (= res!10396 (= lt!16549 (bvsub lt!16551 lt!16546)))))

(assert (=> d!3318 (or (= (bvand lt!16551 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!16546 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!16551 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!16551 lt!16546) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!3318 (= lt!16546 (remainingBits!0 ((_ sign_extend 32) (size!262 (buf!604 thiss!1486))) ((_ sign_extend 32) (currentByte!1661 thiss!1486)) ((_ sign_extend 32) (currentBit!1656 thiss!1486))))))

(declare-fun lt!16548 () (_ BitVec 64))

(declare-fun lt!16550 () (_ BitVec 64))

(assert (=> d!3318 (= lt!16551 (bvmul lt!16548 lt!16550))))

(assert (=> d!3318 (or (= lt!16548 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!16550 (bvsdiv (bvmul lt!16548 lt!16550) lt!16548)))))

(assert (=> d!3318 (= lt!16550 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3318 (= lt!16548 ((_ sign_extend 32) (size!262 (buf!604 thiss!1486))))))

(assert (=> d!3318 (= lt!16549 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1661 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1656 thiss!1486))))))

(assert (=> d!3318 (invariant!0 (currentBit!1656 thiss!1486) (currentByte!1661 thiss!1486) (size!262 (buf!604 thiss!1486)))))

(assert (=> d!3318 (= (bitIndex!0 (size!262 (buf!604 thiss!1486)) (currentByte!1661 thiss!1486) (currentBit!1656 thiss!1486)) lt!16549)))

(declare-fun b!10416 () Bool)

(declare-fun res!10395 () Bool)

(assert (=> b!10416 (=> (not res!10395) (not e!6365))))

(assert (=> b!10416 (= res!10395 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!16549))))

(declare-fun b!10417 () Bool)

(declare-fun lt!16547 () (_ BitVec 64))

(assert (=> b!10417 (= e!6365 (bvsle lt!16549 (bvmul lt!16547 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!10417 (or (= lt!16547 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!16547 #b0000000000000000000000000000000000000000000000000000000000001000) lt!16547)))))

(assert (=> b!10417 (= lt!16547 ((_ sign_extend 32) (size!262 (buf!604 thiss!1486))))))

(assert (= (and d!3318 res!10396) b!10416))

(assert (= (and b!10416 res!10395) b!10417))

(declare-fun m!15259 () Bool)

(assert (=> d!3318 m!15259))

(declare-fun m!15261 () Bool)

(assert (=> d!3318 m!15261))

(assert (=> b!10304 d!3318))

(declare-fun d!3326 () Bool)

(assert (=> d!3326 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!262 (buf!604 thiss!1486))) ((_ sign_extend 32) (currentByte!1661 thiss!1486)) ((_ sign_extend 32) (currentBit!1656 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!262 (buf!604 thiss!1486))) ((_ sign_extend 32) (currentByte!1661 thiss!1486)) ((_ sign_extend 32) (currentBit!1656 thiss!1486))) nBits!460))))

(declare-fun bs!984 () Bool)

(assert (= bs!984 d!3326))

(assert (=> bs!984 m!15259))

(assert (=> b!10305 d!3326))

(declare-fun d!3328 () Bool)

(assert (=> d!3328 (= (array_inv!254 (buf!604 thiss!1486)) (bvsge (size!262 (buf!604 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!10302 d!3328))

(declare-fun d!3330 () Bool)

(assert (=> d!3330 (= (array_inv!254 srcBuffer!6) (bvsge (size!262 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!2204 d!3330))

(declare-fun d!3332 () Bool)

(assert (=> d!3332 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1656 thiss!1486) (currentByte!1661 thiss!1486) (size!262 (buf!604 thiss!1486))))))

(declare-fun bs!985 () Bool)

(assert (= bs!985 d!3332))

(assert (=> bs!985 m!15261))

(assert (=> start!2204 d!3332))

(push 1)

(assert (not b!10389))

(assert (not b!10386))

(assert (not d!3318))

(assert (not b!10391))

(assert (not b!10388))

(assert (not b!10390))

(assert (not d!3332))

(assert (not d!3296))

(assert (not bm!191))

(assert (not d!3326))

(assert (not b!10392))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

