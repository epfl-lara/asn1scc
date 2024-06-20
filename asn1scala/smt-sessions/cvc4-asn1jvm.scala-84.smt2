; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1698 () Bool)

(assert start!1698)

(declare-fun res!8789 () Bool)

(declare-fun e!5142 () Bool)

(assert (=> start!1698 (=> (not res!8789) (not e!5142))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!547 0))(
  ( (array!548 (arr!642 (Array (_ BitVec 32) (_ BitVec 8))) (size!237 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!547)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!1698 (= res!8789 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!237 srcBuffer!6))))))))

(assert (=> start!1698 e!5142))

(assert (=> start!1698 true))

(declare-fun array_inv!232 (array!547) Bool)

(assert (=> start!1698 (array_inv!232 srcBuffer!6)))

(declare-datatypes ((BitStream!452 0))(
  ( (BitStream!453 (buf!573 array!547) (currentByte!1588 (_ BitVec 32)) (currentBit!1583 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!452)

(declare-fun e!5140 () Bool)

(declare-fun inv!12 (BitStream!452) Bool)

(assert (=> start!1698 (and (inv!12 thiss!1486) e!5140)))

(declare-fun b!8200 () Bool)

(declare-fun e!5144 () Bool)

(assert (=> b!8200 (= e!5142 e!5144)))

(declare-fun res!8790 () Bool)

(assert (=> b!8200 (=> (not res!8790) (not e!5144))))

(declare-datatypes ((Unit!665 0))(
  ( (Unit!666) )
))
(declare-datatypes ((tuple2!1106 0))(
  ( (tuple2!1107 (_1!584 Unit!665) (_2!584 BitStream!452)) )
))
(declare-fun lt!11150 () tuple2!1106)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!8200 (= res!8790 (invariant!0 (currentBit!1583 (_2!584 lt!11150)) (currentByte!1588 (_2!584 lt!11150)) (size!237 (buf!573 (_2!584 lt!11150)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!452 array!547 (_ BitVec 64) (_ BitVec 64)) tuple2!1106)

(assert (=> b!8200 (= lt!11150 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!8202 () Bool)

(assert (=> b!8202 (= e!5140 (array_inv!232 (buf!573 thiss!1486)))))

(declare-fun b!8199 () Bool)

(declare-fun res!8791 () Bool)

(assert (=> b!8199 (=> (not res!8791) (not e!5142))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!8199 (= res!8791 (validate_offset_bits!1 ((_ sign_extend 32) (size!237 (buf!573 thiss!1486))) ((_ sign_extend 32) (currentByte!1588 thiss!1486)) ((_ sign_extend 32) (currentBit!1583 thiss!1486)) nBits!460))))

(declare-fun b!8201 () Bool)

(assert (=> b!8201 (= e!5144 (not (= (size!237 (buf!573 thiss!1486)) (size!237 (buf!573 (_2!584 lt!11150))))))))

(assert (= (and start!1698 res!8789) b!8199))

(assert (= (and b!8199 res!8791) b!8200))

(assert (= (and b!8200 res!8790) b!8201))

(assert (= start!1698 b!8202))

(declare-fun m!10791 () Bool)

(assert (=> start!1698 m!10791))

(declare-fun m!10793 () Bool)

(assert (=> start!1698 m!10793))

(declare-fun m!10795 () Bool)

(assert (=> b!8200 m!10795))

(declare-fun m!10797 () Bool)

(assert (=> b!8200 m!10797))

(declare-fun m!10799 () Bool)

(assert (=> b!8202 m!10799))

(declare-fun m!10801 () Bool)

(assert (=> b!8199 m!10801))

(push 1)

(assert (not b!8200))

(assert (not b!8199))

(assert (not start!1698))

(assert (not b!8202))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2398 () Bool)

(assert (=> d!2398 (= (invariant!0 (currentBit!1583 (_2!584 lt!11150)) (currentByte!1588 (_2!584 lt!11150)) (size!237 (buf!573 (_2!584 lt!11150)))) (and (bvsge (currentBit!1583 (_2!584 lt!11150)) #b00000000000000000000000000000000) (bvslt (currentBit!1583 (_2!584 lt!11150)) #b00000000000000000000000000001000) (bvsge (currentByte!1588 (_2!584 lt!11150)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1588 (_2!584 lt!11150)) (size!237 (buf!573 (_2!584 lt!11150)))) (and (= (currentBit!1583 (_2!584 lt!11150)) #b00000000000000000000000000000000) (= (currentByte!1588 (_2!584 lt!11150)) (size!237 (buf!573 (_2!584 lt!11150))))))))))

(assert (=> b!8200 d!2398))

(declare-datatypes ((tuple2!1108 0))(
  ( (tuple2!1109 (_1!585 BitStream!452) (_2!585 BitStream!452)) )
))
(declare-fun lt!11389 () tuple2!1108)

(declare-fun e!5161 () Bool)

(declare-fun b!8239 () Bool)

(declare-fun lt!11407 () tuple2!1106)

(declare-datatypes ((List!132 0))(
  ( (Nil!129) (Cons!128 (h!247 Bool) (t!882 List!132)) )
))
(declare-fun bitStreamReadBitsIntoList!0 (BitStream!452 BitStream!452 (_ BitVec 64)) List!132)

(declare-fun byteArrayBitContentToList!0 (BitStream!452 array!547 (_ BitVec 64) (_ BitVec 64)) List!132)

(assert (=> b!8239 (= e!5161 (= (bitStreamReadBitsIntoList!0 (_2!584 lt!11407) (_1!585 lt!11389) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!584 lt!11407) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!8239 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8239 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!11385 () Unit!665)

(declare-fun lt!11392 () Unit!665)

(assert (=> b!8239 (= lt!11385 lt!11392)))

(declare-fun lt!11372 () (_ BitVec 64))

(assert (=> b!8239 (validate_offset_bits!1 ((_ sign_extend 32) (size!237 (buf!573 (_2!584 lt!11407)))) ((_ sign_extend 32) (currentByte!1588 thiss!1486)) ((_ sign_extend 32) (currentBit!1583 thiss!1486)) lt!11372)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!452 array!547 (_ BitVec 64)) Unit!665)

(assert (=> b!8239 (= lt!11392 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!573 (_2!584 lt!11407)) lt!11372))))

(declare-fun e!5159 () Bool)

(assert (=> b!8239 e!5159))

(declare-fun res!8821 () Bool)

(assert (=> b!8239 (=> (not res!8821) (not e!5159))))

(assert (=> b!8239 (= res!8821 (and (= (size!237 (buf!573 thiss!1486)) (size!237 (buf!573 (_2!584 lt!11407)))) (bvsge lt!11372 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8239 (= lt!11372 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!8239 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!452 BitStream!452) tuple2!1108)

(assert (=> b!8239 (= lt!11389 (reader!0 thiss!1486 (_2!584 lt!11407)))))

(declare-fun b!8240 () Bool)

(declare-fun res!8817 () Bool)

(assert (=> b!8240 (=> (not res!8817) (not e!5161))))

(assert (=> b!8240 (= res!8817 (= (size!237 (buf!573 (_2!584 lt!11407))) (size!237 (buf!573 thiss!1486))))))

(declare-fun c!453 () Bool)

(declare-fun lt!11386 () tuple2!1106)

(declare-fun call!106 () tuple2!1108)

(declare-fun bm!103 () Bool)

(assert (=> bm!103 (= call!106 (reader!0 thiss!1486 (ite c!453 (_2!584 lt!11386) thiss!1486)))))

(declare-fun b!8241 () Bool)

(declare-fun res!8819 () Bool)

(assert (=> b!8241 (=> (not res!8819) (not e!5161))))

(assert (=> b!8241 (= res!8819 (invariant!0 (currentBit!1583 (_2!584 lt!11407)) (currentByte!1588 (_2!584 lt!11407)) (size!237 (buf!573 (_2!584 lt!11407)))))))

(declare-fun b!8242 () Bool)

(declare-fun e!5160 () tuple2!1106)

(declare-fun lt!11400 () tuple2!1106)

(declare-fun Unit!670 () Unit!665)

(assert (=> b!8242 (= e!5160 (tuple2!1107 Unit!670 (_2!584 lt!11400)))))

(declare-fun appendBitFromByte!0 (BitStream!452 (_ BitVec 8) (_ BitVec 32)) tuple2!1106)

(assert (=> b!8242 (= lt!11386 (appendBitFromByte!0 thiss!1486 (select (arr!642 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!11379 () (_ BitVec 64))

(assert (=> b!8242 (= lt!11379 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!11405 () (_ BitVec 64))

(assert (=> b!8242 (= lt!11405 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!11397 () Unit!665)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!452 BitStream!452 (_ BitVec 64) (_ BitVec 64)) Unit!665)

(assert (=> b!8242 (= lt!11397 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!584 lt!11386) lt!11379 lt!11405))))

(assert (=> b!8242 (validate_offset_bits!1 ((_ sign_extend 32) (size!237 (buf!573 (_2!584 lt!11386)))) ((_ sign_extend 32) (currentByte!1588 (_2!584 lt!11386))) ((_ sign_extend 32) (currentBit!1583 (_2!584 lt!11386))) (bvsub lt!11379 lt!11405))))

(declare-fun lt!11402 () Unit!665)

(assert (=> b!8242 (= lt!11402 lt!11397)))

(declare-fun lt!11370 () tuple2!1108)

(assert (=> b!8242 (= lt!11370 call!106)))

(declare-fun lt!11399 () (_ BitVec 64))

(assert (=> b!8242 (= lt!11399 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!11382 () Unit!665)

(assert (=> b!8242 (= lt!11382 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!573 (_2!584 lt!11386)) lt!11399))))

(assert (=> b!8242 (validate_offset_bits!1 ((_ sign_extend 32) (size!237 (buf!573 (_2!584 lt!11386)))) ((_ sign_extend 32) (currentByte!1588 thiss!1486)) ((_ sign_extend 32) (currentBit!1583 thiss!1486)) lt!11399)))

(declare-fun lt!11398 () Unit!665)

(assert (=> b!8242 (= lt!11398 lt!11382)))

(declare-fun head!40 (List!132) Bool)

(assert (=> b!8242 (= (head!40 (byteArrayBitContentToList!0 (_2!584 lt!11386) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!40 (bitStreamReadBitsIntoList!0 (_2!584 lt!11386) (_1!585 lt!11370) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!11375 () Unit!665)

(declare-fun Unit!678 () Unit!665)

(assert (=> b!8242 (= lt!11375 Unit!678)))

(assert (=> b!8242 (= lt!11400 (appendBitsMSBFirstLoop!0 (_2!584 lt!11386) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!11395 () Unit!665)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!452 BitStream!452 BitStream!452) Unit!665)

(assert (=> b!8242 (= lt!11395 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!584 lt!11386) (_2!584 lt!11400)))))

(declare-fun isPrefixOf!0 (BitStream!452 BitStream!452) Bool)

(assert (=> b!8242 (isPrefixOf!0 thiss!1486 (_2!584 lt!11400))))

(declare-fun lt!11396 () Unit!665)

(assert (=> b!8242 (= lt!11396 lt!11395)))

(assert (=> b!8242 (= (size!237 (buf!573 (_2!584 lt!11400))) (size!237 (buf!573 thiss!1486)))))

(declare-fun lt!11377 () Unit!665)

(declare-fun Unit!681 () Unit!665)

(assert (=> b!8242 (= lt!11377 Unit!681)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!8242 (= (bitIndex!0 (size!237 (buf!573 (_2!584 lt!11400))) (currentByte!1588 (_2!584 lt!11400)) (currentBit!1583 (_2!584 lt!11400))) (bvsub (bvadd (bitIndex!0 (size!237 (buf!573 thiss!1486)) (currentByte!1588 thiss!1486) (currentBit!1583 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!11410 () Unit!665)

(declare-fun Unit!682 () Unit!665)

(assert (=> b!8242 (= lt!11410 Unit!682)))

(assert (=> b!8242 (= (bitIndex!0 (size!237 (buf!573 (_2!584 lt!11400))) (currentByte!1588 (_2!584 lt!11400)) (currentBit!1583 (_2!584 lt!11400))) (bvsub (bvsub (bvadd (bitIndex!0 (size!237 (buf!573 (_2!584 lt!11386))) (currentByte!1588 (_2!584 lt!11386)) (currentBit!1583 (_2!584 lt!11386))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!11403 () Unit!665)

(declare-fun Unit!683 () Unit!665)

(assert (=> b!8242 (= lt!11403 Unit!683)))

(declare-fun lt!11404 () tuple2!1108)

(assert (=> b!8242 (= lt!11404 (reader!0 thiss!1486 (_2!584 lt!11400)))))

(declare-fun lt!11374 () (_ BitVec 64))

(assert (=> b!8242 (= lt!11374 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!11390 () Unit!665)

(assert (=> b!8242 (= lt!11390 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!573 (_2!584 lt!11400)) lt!11374))))

(assert (=> b!8242 (validate_offset_bits!1 ((_ sign_extend 32) (size!237 (buf!573 (_2!584 lt!11400)))) ((_ sign_extend 32) (currentByte!1588 thiss!1486)) ((_ sign_extend 32) (currentBit!1583 thiss!1486)) lt!11374)))

(declare-fun lt!11387 () Unit!665)

(assert (=> b!8242 (= lt!11387 lt!11390)))

(declare-fun lt!11368 () tuple2!1108)

(assert (=> b!8242 (= lt!11368 (reader!0 (_2!584 lt!11386) (_2!584 lt!11400)))))

(declare-fun lt!11369 () (_ BitVec 64))

(assert (=> b!8242 (= lt!11369 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!11381 () Unit!665)

(assert (=> b!8242 (= lt!11381 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!584 lt!11386) (buf!573 (_2!584 lt!11400)) lt!11369))))

(assert (=> b!8242 (validate_offset_bits!1 ((_ sign_extend 32) (size!237 (buf!573 (_2!584 lt!11400)))) ((_ sign_extend 32) (currentByte!1588 (_2!584 lt!11386))) ((_ sign_extend 32) (currentBit!1583 (_2!584 lt!11386))) lt!11369)))

(declare-fun lt!11401 () Unit!665)

(assert (=> b!8242 (= lt!11401 lt!11381)))

(declare-fun lt!11378 () List!132)

(assert (=> b!8242 (= lt!11378 (byteArrayBitContentToList!0 (_2!584 lt!11400) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!11367 () List!132)

(assert (=> b!8242 (= lt!11367 (byteArrayBitContentToList!0 (_2!584 lt!11400) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!11391 () List!132)

(assert (=> b!8242 (= lt!11391 (bitStreamReadBitsIntoList!0 (_2!584 lt!11400) (_1!585 lt!11404) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!11373 () List!132)

(assert (=> b!8242 (= lt!11373 (bitStreamReadBitsIntoList!0 (_2!584 lt!11400) (_1!585 lt!11368) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!11409 () (_ BitVec 64))

(assert (=> b!8242 (= lt!11409 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!11388 () Unit!665)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!452 BitStream!452 BitStream!452 BitStream!452 (_ BitVec 64) List!132) Unit!665)

(assert (=> b!8242 (= lt!11388 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!584 lt!11400) (_2!584 lt!11400) (_1!585 lt!11404) (_1!585 lt!11368) lt!11409 lt!11391))))

(declare-fun tail!48 (List!132) List!132)

(assert (=> b!8242 (= (bitStreamReadBitsIntoList!0 (_2!584 lt!11400) (_1!585 lt!11368) (bvsub lt!11409 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!48 lt!11391))))

(declare-fun lt!11406 () Unit!665)

(assert (=> b!8242 (= lt!11406 lt!11388)))

(declare-fun lt!11394 () Unit!665)

(declare-fun lt!11380 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!547 array!547 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!665)

(assert (=> b!8242 (= lt!11394 (arrayBitRangesEqImpliesEq!0 (buf!573 (_2!584 lt!11386)) (buf!573 (_2!584 lt!11400)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!11380 (bitIndex!0 (size!237 (buf!573 (_2!584 lt!11386))) (currentByte!1588 (_2!584 lt!11386)) (currentBit!1583 (_2!584 lt!11386)))))))

(declare-fun bitAt!0 (array!547 (_ BitVec 64)) Bool)

(assert (=> b!8242 (= (bitAt!0 (buf!573 (_2!584 lt!11386)) lt!11380) (bitAt!0 (buf!573 (_2!584 lt!11400)) lt!11380))))

(declare-fun lt!11371 () Unit!665)

(assert (=> b!8242 (= lt!11371 lt!11394)))

(declare-fun b!8243 () Bool)

(declare-fun Unit!686 () Unit!665)

(assert (=> b!8243 (= e!5160 (tuple2!1107 Unit!686 thiss!1486))))

(assert (=> b!8243 (= (size!237 (buf!573 thiss!1486)) (size!237 (buf!573 thiss!1486)))))

(declare-fun lt!11376 () Unit!665)

(declare-fun Unit!687 () Unit!665)

(assert (=> b!8243 (= lt!11376 Unit!687)))

(declare-fun checkByteArrayBitContent!0 (BitStream!452 array!547 array!547 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!1118 0))(
  ( (tuple2!1119 (_1!590 array!547) (_2!590 BitStream!452)) )
))
(declare-fun readBits!0 (BitStream!452 (_ BitVec 64)) tuple2!1118)

(assert (=> b!8243 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!590 (readBits!0 (_1!585 call!106) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!8244 () Bool)

(declare-fun res!8816 () Bool)

(assert (=> b!8244 (=> (not res!8816) (not e!5161))))

(assert (=> b!8244 (= res!8816 (isPrefixOf!0 thiss!1486 (_2!584 lt!11407)))))

(declare-fun d!2404 () Bool)

(assert (=> d!2404 e!5161))

(declare-fun res!8818 () Bool)

(assert (=> d!2404 (=> (not res!8818) (not e!5161))))

(declare-fun lt!11393 () (_ BitVec 64))

(assert (=> d!2404 (= res!8818 (= (bitIndex!0 (size!237 (buf!573 (_2!584 lt!11407))) (currentByte!1588 (_2!584 lt!11407)) (currentBit!1583 (_2!584 lt!11407))) (bvsub lt!11393 from!367)))))

(assert (=> d!2404 (or (= (bvand lt!11393 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!11393 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!11393 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!11408 () (_ BitVec 64))

(assert (=> d!2404 (= lt!11393 (bvadd lt!11408 from!367 nBits!460))))

(assert (=> d!2404 (or (not (= (bvand lt!11408 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!11408 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!11408 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2404 (= lt!11408 (bitIndex!0 (size!237 (buf!573 thiss!1486)) (currentByte!1588 thiss!1486) (currentBit!1583 thiss!1486)))))

(assert (=> d!2404 (= lt!11407 e!5160)))

(assert (=> d!2404 (= c!453 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!11383 () Unit!665)

(declare-fun lt!11384 () Unit!665)

(assert (=> d!2404 (= lt!11383 lt!11384)))

(assert (=> d!2404 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!452) Unit!665)

(assert (=> d!2404 (= lt!11384 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!2404 (= lt!11380 (bitIndex!0 (size!237 (buf!573 thiss!1486)) (currentByte!1588 thiss!1486) (currentBit!1583 thiss!1486)))))

(assert (=> d!2404 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2404 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!11407)))

(declare-fun b!8245 () Bool)

(assert (=> b!8245 (= e!5159 (validate_offset_bits!1 ((_ sign_extend 32) (size!237 (buf!573 thiss!1486))) ((_ sign_extend 32) (currentByte!1588 thiss!1486)) ((_ sign_extend 32) (currentBit!1583 thiss!1486)) lt!11372))))

(declare-fun b!8246 () Bool)

(declare-fun res!8820 () Bool)

(assert (=> b!8246 (=> (not res!8820) (not e!5161))))

(assert (=> b!8246 (= res!8820 (= (size!237 (buf!573 thiss!1486)) (size!237 (buf!573 (_2!584 lt!11407)))))))

(assert (= (and d!2404 c!453) b!8242))

(assert (= (and d!2404 (not c!453)) b!8243))

(assert (= (or b!8242 b!8243) bm!103))

(assert (= (and d!2404 res!8818) b!8241))

(assert (= (and b!8241 res!8819) b!8246))

(assert (= (and b!8246 res!8820) b!8244))

(assert (= (and b!8244 res!8816) b!8240))

(assert (= (and b!8240 res!8817) b!8239))

(assert (= (and b!8239 res!8821) b!8245))

(declare-fun m!10809 () Bool)

(assert (=> b!8245 m!10809))

(declare-fun m!10811 () Bool)

(assert (=> b!8242 m!10811))

(assert (=> b!8242 m!10811))

(declare-fun m!10813 () Bool)

(assert (=> b!8242 m!10813))

(declare-fun m!10815 () Bool)

(assert (=> b!8242 m!10815))

(declare-fun m!10817 () Bool)

(assert (=> b!8242 m!10817))

(declare-fun m!10819 () Bool)

(assert (=> b!8242 m!10819))

(declare-fun m!10821 () Bool)

(assert (=> b!8242 m!10821))

(declare-fun m!10823 () Bool)

(assert (=> b!8242 m!10823))

(assert (=> b!8242 m!10819))

(declare-fun m!10825 () Bool)

(assert (=> b!8242 m!10825))

(declare-fun m!10827 () Bool)

(assert (=> b!8242 m!10827))

(declare-fun m!10829 () Bool)

(assert (=> b!8242 m!10829))

(declare-fun m!10831 () Bool)

(assert (=> b!8242 m!10831))

(declare-fun m!10833 () Bool)

(assert (=> b!8242 m!10833))

(declare-fun m!10835 () Bool)

(assert (=> b!8242 m!10835))

(declare-fun m!10837 () Bool)

(assert (=> b!8242 m!10837))

(declare-fun m!10839 () Bool)

(assert (=> b!8242 m!10839))

(declare-fun m!10841 () Bool)

(assert (=> b!8242 m!10841))

(declare-fun m!10843 () Bool)

(assert (=> b!8242 m!10843))

(declare-fun m!10845 () Bool)

(assert (=> b!8242 m!10845))

(declare-fun m!10847 () Bool)

(assert (=> b!8242 m!10847))

(declare-fun m!10849 () Bool)

(assert (=> b!8242 m!10849))

(assert (=> b!8242 m!10843))

(declare-fun m!10851 () Bool)

(assert (=> b!8242 m!10851))

(declare-fun m!10853 () Bool)

(assert (=> b!8242 m!10853))

(declare-fun m!10855 () Bool)

(assert (=> b!8242 m!10855))

(declare-fun m!10857 () Bool)

(assert (=> b!8242 m!10857))

(declare-fun m!10859 () Bool)

(assert (=> b!8242 m!10859))

(declare-fun m!10861 () Bool)

(assert (=> b!8242 m!10861))

(declare-fun m!10863 () Bool)

(assert (=> b!8242 m!10863))

(declare-fun m!10865 () Bool)

