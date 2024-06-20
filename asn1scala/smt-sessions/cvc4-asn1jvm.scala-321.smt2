; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6924 () Bool)

(assert start!6924)

(declare-fun b!33418 () Bool)

(declare-fun res!28631 () Bool)

(declare-fun e!22168 () Bool)

(assert (=> b!33418 (=> res!28631 e!22168)))

(declare-datatypes ((array!1860 0))(
  ( (array!1861 (arr!1297 (Array (_ BitVec 32) (_ BitVec 8))) (size!822 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1436 0))(
  ( (BitStream!1437 (buf!1150 array!1860) (currentByte!2517 (_ BitVec 32)) (currentBit!2512 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1436)

(declare-datatypes ((Unit!2499 0))(
  ( (Unit!2500) )
))
(declare-datatypes ((tuple2!3402 0))(
  ( (tuple2!3403 (_1!1788 Unit!2499) (_2!1788 BitStream!1436)) )
))
(declare-fun lt!49134 () tuple2!3402)

(assert (=> b!33418 (= res!28631 (not (= (size!822 (buf!1150 thiss!1379)) (size!822 (buf!1150 (_2!1788 lt!49134))))))))

(declare-fun res!28633 () Bool)

(declare-fun e!22176 () Bool)

(assert (=> start!6924 (=> (not res!28633) (not e!22176))))

(declare-fun srcBuffer!2 () array!1860)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!6924 (= res!28633 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!822 srcBuffer!2))))))))

(assert (=> start!6924 e!22176))

(assert (=> start!6924 true))

(declare-fun array_inv!771 (array!1860) Bool)

(assert (=> start!6924 (array_inv!771 srcBuffer!2)))

(declare-fun e!22166 () Bool)

(declare-fun inv!12 (BitStream!1436) Bool)

(assert (=> start!6924 (and (inv!12 thiss!1379) e!22166)))

(declare-fun b!33419 () Bool)

(declare-fun res!28635 () Bool)

(declare-fun e!22167 () Bool)

(assert (=> b!33419 (=> res!28635 e!22167)))

(declare-datatypes ((List!419 0))(
  ( (Nil!416) (Cons!415 (h!534 Bool) (t!1169 List!419)) )
))
(declare-fun lt!49130 () List!419)

(declare-fun length!145 (List!419) Int)

(assert (=> b!33419 (= res!28635 (<= (length!145 lt!49130) 0))))

(declare-fun b!33420 () Bool)

(declare-fun e!22172 () Bool)

(assert (=> b!33420 (= e!22172 e!22167)))

(declare-fun res!28632 () Bool)

(assert (=> b!33420 (=> res!28632 e!22167)))

(assert (=> b!33420 (= res!28632 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!49131 () (_ BitVec 64))

(declare-datatypes ((tuple2!3404 0))(
  ( (tuple2!3405 (_1!1789 BitStream!1436) (_2!1789 BitStream!1436)) )
))
(declare-fun lt!49138 () tuple2!3404)

(declare-fun lt!49141 () List!419)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1436 BitStream!1436 (_ BitVec 64)) List!419)

(assert (=> b!33420 (= lt!49141 (bitStreamReadBitsIntoList!0 (_2!1788 lt!49134) (_1!1789 lt!49138) lt!49131))))

(declare-fun lt!49143 () tuple2!3404)

(assert (=> b!33420 (= lt!49130 (bitStreamReadBitsIntoList!0 (_2!1788 lt!49134) (_1!1789 lt!49143) (bvsub to!314 i!635)))))

(declare-fun lt!49128 () tuple2!3402)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!33420 (validate_offset_bits!1 ((_ sign_extend 32) (size!822 (buf!1150 (_2!1788 lt!49134)))) ((_ sign_extend 32) (currentByte!2517 (_2!1788 lt!49128))) ((_ sign_extend 32) (currentBit!2512 (_2!1788 lt!49128))) lt!49131)))

(declare-fun lt!49142 () Unit!2499)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1436 array!1860 (_ BitVec 64)) Unit!2499)

(assert (=> b!33420 (= lt!49142 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1788 lt!49128) (buf!1150 (_2!1788 lt!49134)) lt!49131))))

(declare-fun reader!0 (BitStream!1436 BitStream!1436) tuple2!3404)

(assert (=> b!33420 (= lt!49138 (reader!0 (_2!1788 lt!49128) (_2!1788 lt!49134)))))

(assert (=> b!33420 (validate_offset_bits!1 ((_ sign_extend 32) (size!822 (buf!1150 (_2!1788 lt!49134)))) ((_ sign_extend 32) (currentByte!2517 thiss!1379)) ((_ sign_extend 32) (currentBit!2512 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!49139 () Unit!2499)

(assert (=> b!33420 (= lt!49139 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1150 (_2!1788 lt!49134)) (bvsub to!314 i!635)))))

(assert (=> b!33420 (= lt!49143 (reader!0 thiss!1379 (_2!1788 lt!49134)))))

(declare-fun e!22171 () Bool)

(declare-fun b!33421 () Bool)

(declare-fun lt!49133 () tuple2!3404)

(declare-fun head!256 (List!419) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1436 array!1860 (_ BitVec 64) (_ BitVec 64)) List!419)

(assert (=> b!33421 (= e!22171 (= (head!256 (byteArrayBitContentToList!0 (_2!1788 lt!49128) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!256 (bitStreamReadBitsIntoList!0 (_2!1788 lt!49128) (_1!1789 lt!49133) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!33422 () Bool)

(declare-fun e!22175 () Bool)

(declare-fun e!22177 () Bool)

(assert (=> b!33422 (= e!22175 e!22177)))

(declare-fun res!28625 () Bool)

(assert (=> b!33422 (=> res!28625 e!22177)))

(declare-fun isPrefixOf!0 (BitStream!1436 BitStream!1436) Bool)

(assert (=> b!33422 (= res!28625 (not (isPrefixOf!0 (_2!1788 lt!49128) (_2!1788 lt!49134))))))

(assert (=> b!33422 (isPrefixOf!0 thiss!1379 (_2!1788 lt!49134))))

(declare-fun lt!49135 () Unit!2499)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1436 BitStream!1436 BitStream!1436) Unit!2499)

(assert (=> b!33422 (= lt!49135 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1788 lt!49128) (_2!1788 lt!49134)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1436 array!1860 (_ BitVec 64) (_ BitVec 64)) tuple2!3402)

(assert (=> b!33422 (= lt!49134 (appendBitsMSBFirstLoop!0 (_2!1788 lt!49128) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!33422 e!22171))

(declare-fun res!28634 () Bool)

(assert (=> b!33422 (=> (not res!28634) (not e!22171))))

(assert (=> b!33422 (= res!28634 (validate_offset_bits!1 ((_ sign_extend 32) (size!822 (buf!1150 (_2!1788 lt!49128)))) ((_ sign_extend 32) (currentByte!2517 thiss!1379)) ((_ sign_extend 32) (currentBit!2512 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!49140 () Unit!2499)

(assert (=> b!33422 (= lt!49140 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1150 (_2!1788 lt!49128)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!33422 (= lt!49133 (reader!0 thiss!1379 (_2!1788 lt!49128)))))

(declare-fun b!33423 () Bool)

(assert (=> b!33423 (= e!22177 e!22168)))

(declare-fun res!28636 () Bool)

(assert (=> b!33423 (=> res!28636 e!22168)))

(declare-fun lt!49144 () (_ BitVec 64))

(declare-fun lt!49129 () (_ BitVec 64))

(assert (=> b!33423 (= res!28636 (not (= lt!49129 (bvsub (bvadd lt!49144 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!33423 (= lt!49129 (bitIndex!0 (size!822 (buf!1150 (_2!1788 lt!49134))) (currentByte!2517 (_2!1788 lt!49134)) (currentBit!2512 (_2!1788 lt!49134))))))

(declare-fun b!33424 () Bool)

(declare-fun res!28637 () Bool)

(assert (=> b!33424 (=> res!28637 e!22172)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!33424 (= res!28637 (not (invariant!0 (currentBit!2512 (_2!1788 lt!49128)) (currentByte!2517 (_2!1788 lt!49128)) (size!822 (buf!1150 (_2!1788 lt!49128))))))))

(declare-fun b!33425 () Bool)

(declare-fun e!22169 () Bool)

(assert (=> b!33425 (= e!22169 (= lt!49129 (bvsub (bvsub (bvadd (bitIndex!0 (size!822 (buf!1150 (_2!1788 lt!49128))) (currentByte!2517 (_2!1788 lt!49128)) (currentBit!2512 (_2!1788 lt!49128))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!33426 () Bool)

(declare-fun e!22170 () Bool)

(assert (=> b!33426 (= e!22170 e!22175)))

(declare-fun res!28624 () Bool)

(assert (=> b!33426 (=> res!28624 e!22175)))

(assert (=> b!33426 (= res!28624 (not (isPrefixOf!0 thiss!1379 (_2!1788 lt!49128))))))

(assert (=> b!33426 (validate_offset_bits!1 ((_ sign_extend 32) (size!822 (buf!1150 (_2!1788 lt!49128)))) ((_ sign_extend 32) (currentByte!2517 (_2!1788 lt!49128))) ((_ sign_extend 32) (currentBit!2512 (_2!1788 lt!49128))) lt!49131)))

(assert (=> b!33426 (= lt!49131 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!49136 () Unit!2499)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1436 BitStream!1436 (_ BitVec 64) (_ BitVec 64)) Unit!2499)

(assert (=> b!33426 (= lt!49136 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1788 lt!49128) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1436 (_ BitVec 8) (_ BitVec 32)) tuple2!3402)

(assert (=> b!33426 (= lt!49128 (appendBitFromByte!0 thiss!1379 (select (arr!1297 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!33427 () Bool)

(declare-fun res!28629 () Bool)

(assert (=> b!33427 (=> res!28629 e!22172)))

(assert (=> b!33427 (= res!28629 (not (invariant!0 (currentBit!2512 (_2!1788 lt!49128)) (currentByte!2517 (_2!1788 lt!49128)) (size!822 (buf!1150 (_2!1788 lt!49134))))))))

(declare-fun b!33428 () Bool)

(declare-fun res!28638 () Bool)

(assert (=> b!33428 (=> (not res!28638) (not e!22176))))

(assert (=> b!33428 (= res!28638 (validate_offset_bits!1 ((_ sign_extend 32) (size!822 (buf!1150 thiss!1379))) ((_ sign_extend 32) (currentByte!2517 thiss!1379)) ((_ sign_extend 32) (currentBit!2512 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!33429 () Bool)

(declare-fun res!28630 () Bool)

(assert (=> b!33429 (=> res!28630 e!22168)))

(assert (=> b!33429 (= res!28630 (not (invariant!0 (currentBit!2512 (_2!1788 lt!49134)) (currentByte!2517 (_2!1788 lt!49134)) (size!822 (buf!1150 (_2!1788 lt!49134))))))))

(declare-fun b!33430 () Bool)

(assert (=> b!33430 (= e!22176 (not e!22170))))

(declare-fun res!28628 () Bool)

(assert (=> b!33430 (=> res!28628 e!22170)))

(assert (=> b!33430 (= res!28628 (bvsge i!635 to!314))))

(assert (=> b!33430 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!49137 () Unit!2499)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1436) Unit!2499)

(assert (=> b!33430 (= lt!49137 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!33430 (= lt!49144 (bitIndex!0 (size!822 (buf!1150 thiss!1379)) (currentByte!2517 thiss!1379) (currentBit!2512 thiss!1379)))))

(declare-fun b!33431 () Bool)

(assert (=> b!33431 (= e!22166 (array_inv!771 (buf!1150 thiss!1379)))))

(declare-fun b!33432 () Bool)

(assert (=> b!33432 (= e!22167 true)))

(declare-fun tail!136 (List!419) List!419)

(assert (=> b!33432 (= lt!49141 (tail!136 lt!49130))))

(declare-fun lt!49132 () Unit!2499)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1436 BitStream!1436 BitStream!1436 BitStream!1436 (_ BitVec 64) List!419) Unit!2499)

(assert (=> b!33432 (= lt!49132 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1788 lt!49134) (_2!1788 lt!49134) (_1!1789 lt!49143) (_1!1789 lt!49138) (bvsub to!314 i!635) lt!49130))))

(declare-fun b!33433 () Bool)

(assert (=> b!33433 (= e!22168 e!22172)))

(declare-fun res!28627 () Bool)

(assert (=> b!33433 (=> res!28627 e!22172)))

(assert (=> b!33433 (= res!28627 (not (= (size!822 (buf!1150 (_2!1788 lt!49128))) (size!822 (buf!1150 (_2!1788 lt!49134))))))))

(assert (=> b!33433 e!22169))

(declare-fun res!28626 () Bool)

(assert (=> b!33433 (=> (not res!28626) (not e!22169))))

(assert (=> b!33433 (= res!28626 (= (size!822 (buf!1150 (_2!1788 lt!49134))) (size!822 (buf!1150 thiss!1379))))))

(assert (= (and start!6924 res!28633) b!33428))

(assert (= (and b!33428 res!28638) b!33430))

(assert (= (and b!33430 (not res!28628)) b!33426))

(assert (= (and b!33426 (not res!28624)) b!33422))

(assert (= (and b!33422 res!28634) b!33421))

(assert (= (and b!33422 (not res!28625)) b!33423))

(assert (= (and b!33423 (not res!28636)) b!33429))

(assert (= (and b!33429 (not res!28630)) b!33418))

(assert (= (and b!33418 (not res!28631)) b!33433))

(assert (= (and b!33433 res!28626) b!33425))

(assert (= (and b!33433 (not res!28627)) b!33424))

(assert (= (and b!33424 (not res!28637)) b!33427))

(assert (= (and b!33427 (not res!28629)) b!33420))

(assert (= (and b!33420 (not res!28632)) b!33419))

(assert (= (and b!33419 (not res!28635)) b!33432))

(assert (= start!6924 b!33431))

(declare-fun m!49563 () Bool)

(assert (=> b!33424 m!49563))

(declare-fun m!49565 () Bool)

(assert (=> b!33429 m!49565))

(declare-fun m!49567 () Bool)

(assert (=> b!33430 m!49567))

(declare-fun m!49569 () Bool)

(assert (=> b!33430 m!49569))

(declare-fun m!49571 () Bool)

(assert (=> b!33430 m!49571))

(declare-fun m!49573 () Bool)

(assert (=> b!33431 m!49573))

(declare-fun m!49575 () Bool)

(assert (=> b!33428 m!49575))

(declare-fun m!49577 () Bool)

(assert (=> b!33423 m!49577))

(declare-fun m!49579 () Bool)

(assert (=> b!33422 m!49579))

(declare-fun m!49581 () Bool)

(assert (=> b!33422 m!49581))

(declare-fun m!49583 () Bool)

(assert (=> b!33422 m!49583))

(declare-fun m!49585 () Bool)

(assert (=> b!33422 m!49585))

(declare-fun m!49587 () Bool)

(assert (=> b!33422 m!49587))

(declare-fun m!49589 () Bool)

(assert (=> b!33422 m!49589))

(declare-fun m!49591 () Bool)

(assert (=> b!33422 m!49591))

(declare-fun m!49593 () Bool)

(assert (=> b!33420 m!49593))

(declare-fun m!49595 () Bool)

(assert (=> b!33420 m!49595))

(declare-fun m!49597 () Bool)

(assert (=> b!33420 m!49597))

(declare-fun m!49599 () Bool)

(assert (=> b!33420 m!49599))

(declare-fun m!49601 () Bool)

(assert (=> b!33420 m!49601))

(declare-fun m!49603 () Bool)

(assert (=> b!33420 m!49603))

(declare-fun m!49605 () Bool)

(assert (=> b!33420 m!49605))

(declare-fun m!49607 () Bool)

(assert (=> b!33420 m!49607))

(declare-fun m!49609 () Bool)

(assert (=> start!6924 m!49609))

(declare-fun m!49611 () Bool)

(assert (=> start!6924 m!49611))

(declare-fun m!49613 () Bool)

(assert (=> b!33426 m!49613))

(declare-fun m!49615 () Bool)

(assert (=> b!33426 m!49615))

(declare-fun m!49617 () Bool)

(assert (=> b!33426 m!49617))

(declare-fun m!49619 () Bool)

(assert (=> b!33426 m!49619))

(assert (=> b!33426 m!49615))

(declare-fun m!49621 () Bool)

(assert (=> b!33426 m!49621))

(declare-fun m!49623 () Bool)

(assert (=> b!33421 m!49623))

(assert (=> b!33421 m!49623))

(declare-fun m!49625 () Bool)

(assert (=> b!33421 m!49625))

(declare-fun m!49627 () Bool)

(assert (=> b!33421 m!49627))

(assert (=> b!33421 m!49627))

(declare-fun m!49629 () Bool)

(assert (=> b!33421 m!49629))

(declare-fun m!49631 () Bool)

(assert (=> b!33419 m!49631))

(declare-fun m!49633 () Bool)

(assert (=> b!33432 m!49633))

(declare-fun m!49635 () Bool)

(assert (=> b!33432 m!49635))

(declare-fun m!49637 () Bool)

(assert (=> b!33425 m!49637))

(declare-fun m!49639 () Bool)

(assert (=> b!33427 m!49639))

(push 1)

