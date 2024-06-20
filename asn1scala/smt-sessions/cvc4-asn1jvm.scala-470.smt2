; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13780 () Bool)

(assert start!13780)

(declare-fun b!70612 () Bool)

(declare-fun e!46046 () Bool)

(declare-fun e!46034 () Bool)

(assert (=> b!70612 (= e!46046 e!46034)))

(declare-fun res!58264 () Bool)

(assert (=> b!70612 (=> res!58264 e!46034)))

(declare-fun lt!113656 () Bool)

(declare-fun lt!113660 () (_ BitVec 64))

(declare-datatypes ((array!2921 0))(
  ( (array!2922 (arr!1945 (Array (_ BitVec 32) (_ BitVec 8))) (size!1360 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2312 0))(
  ( (BitStream!2313 (buf!1741 array!2921) (currentByte!3455 (_ BitVec 32)) (currentBit!3450 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!6132 0))(
  ( (tuple2!6133 (_1!3180 BitStream!2312) (_2!3180 BitStream!2312)) )
))
(declare-fun lt!113657 () tuple2!6132)

(declare-fun bitAt!0 (array!2921 (_ BitVec 64)) Bool)

(assert (=> b!70612 (= res!58264 (not (= lt!113656 (bitAt!0 (buf!1741 (_1!3180 lt!113657)) lt!113660))))))

(declare-fun lt!113668 () tuple2!6132)

(assert (=> b!70612 (= lt!113656 (bitAt!0 (buf!1741 (_1!3180 lt!113668)) lt!113660))))

(declare-fun b!70613 () Bool)

(declare-fun e!46035 () Bool)

(assert (=> b!70613 (= e!46035 e!46046)))

(declare-fun res!58282 () Bool)

(assert (=> b!70613 (=> res!58282 e!46046)))

(declare-datatypes ((List!731 0))(
  ( (Nil!728) (Cons!727 (h!846 Bool) (t!1481 List!731)) )
))
(declare-fun lt!113643 () List!731)

(declare-fun lt!113655 () List!731)

(assert (=> b!70613 (= res!58282 (not (= lt!113643 lt!113655)))))

(assert (=> b!70613 (= lt!113655 lt!113643)))

(declare-fun lt!113651 () List!731)

(declare-fun tail!335 (List!731) List!731)

(assert (=> b!70613 (= lt!113643 (tail!335 lt!113651))))

(declare-datatypes ((Unit!4725 0))(
  ( (Unit!4726) )
))
(declare-datatypes ((tuple2!6134 0))(
  ( (tuple2!6135 (_1!3181 Unit!4725) (_2!3181 BitStream!2312)) )
))
(declare-fun lt!113649 () tuple2!6134)

(declare-fun lt!113644 () Unit!4725)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2312 BitStream!2312 BitStream!2312 BitStream!2312 (_ BitVec 64) List!731) Unit!4725)

(assert (=> b!70613 (= lt!113644 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3181 lt!113649) (_2!3181 lt!113649) (_1!3180 lt!113668) (_1!3180 lt!113657) (bvsub to!314 i!635) lt!113651))))

(declare-fun srcBuffer!2 () array!2921)

(declare-fun lt!113659 () tuple2!6132)

(declare-fun lt!113646 () tuple2!6134)

(declare-fun b!70614 () Bool)

(declare-fun e!46036 () Bool)

(declare-fun head!550 (List!731) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2312 array!2921 (_ BitVec 64) (_ BitVec 64)) List!731)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2312 BitStream!2312 (_ BitVec 64)) List!731)

(assert (=> b!70614 (= e!46036 (= (head!550 (byteArrayBitContentToList!0 (_2!3181 lt!113646) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!550 (bitStreamReadBitsIntoList!0 (_2!3181 lt!113646) (_1!3180 lt!113659) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!70615 () Bool)

(declare-fun e!46040 () Bool)

(declare-fun thiss!1379 () BitStream!2312)

(declare-fun array_inv!1215 (array!2921) Bool)

(assert (=> b!70615 (= e!46040 (array_inv!1215 (buf!1741 thiss!1379)))))

(declare-fun b!70616 () Bool)

(declare-fun e!46044 () Bool)

(declare-fun e!46031 () Bool)

(assert (=> b!70616 (= e!46044 e!46031)))

(declare-fun res!58284 () Bool)

(assert (=> b!70616 (=> res!58284 e!46031)))

(declare-fun isPrefixOf!0 (BitStream!2312 BitStream!2312) Bool)

(assert (=> b!70616 (= res!58284 (not (isPrefixOf!0 (_2!3181 lt!113646) (_2!3181 lt!113649))))))

(assert (=> b!70616 (isPrefixOf!0 thiss!1379 (_2!3181 lt!113649))))

(declare-fun lt!113653 () Unit!4725)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2312 BitStream!2312 BitStream!2312) Unit!4725)

(assert (=> b!70616 (= lt!113653 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3181 lt!113646) (_2!3181 lt!113649)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2312 array!2921 (_ BitVec 64) (_ BitVec 64)) tuple2!6134)

(assert (=> b!70616 (= lt!113649 (appendBitsMSBFirstLoop!0 (_2!3181 lt!113646) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!70616 e!46036))

(declare-fun res!58268 () Bool)

(assert (=> b!70616 (=> (not res!58268) (not e!46036))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!70616 (= res!58268 (validate_offset_bits!1 ((_ sign_extend 32) (size!1360 (buf!1741 (_2!3181 lt!113646)))) ((_ sign_extend 32) (currentByte!3455 thiss!1379)) ((_ sign_extend 32) (currentBit!3450 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!113667 () Unit!4725)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2312 array!2921 (_ BitVec 64)) Unit!4725)

(assert (=> b!70616 (= lt!113667 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1741 (_2!3181 lt!113646)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!2312 BitStream!2312) tuple2!6132)

(assert (=> b!70616 (= lt!113659 (reader!0 thiss!1379 (_2!3181 lt!113646)))))

(declare-fun b!70617 () Bool)

(declare-fun e!46032 () Bool)

(declare-fun e!46038 () Bool)

(assert (=> b!70617 (= e!46032 e!46038)))

(declare-fun res!58274 () Bool)

(assert (=> b!70617 (=> res!58274 e!46038)))

(declare-fun lt!113664 () Bool)

(declare-fun lt!113647 () Bool)

(assert (=> b!70617 (= res!58274 (not (= lt!113664 lt!113647)))))

(assert (=> b!70617 (= lt!113664 (bitAt!0 (buf!1741 (_2!3181 lt!113646)) lt!113660))))

(declare-fun b!70618 () Bool)

(declare-fun e!46039 () Bool)

(assert (=> b!70618 (= e!46038 e!46039)))

(declare-fun res!58276 () Bool)

(assert (=> b!70618 (=> res!58276 e!46039)))

(declare-fun lt!113658 () Bool)

(assert (=> b!70618 (= res!58276 (not (= lt!113658 lt!113647)))))

(assert (=> b!70618 (= lt!113664 lt!113658)))

(assert (=> b!70618 (= lt!113658 (bitAt!0 (buf!1741 (_2!3181 lt!113649)) lt!113660))))

(declare-fun lt!113666 () (_ BitVec 64))

(declare-fun lt!113654 () Unit!4725)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2921 array!2921 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4725)

(assert (=> b!70618 (= lt!113654 (arrayBitRangesEqImpliesEq!0 (buf!1741 (_2!3181 lt!113646)) (buf!1741 (_2!3181 lt!113649)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!113660 lt!113666))))

(declare-fun b!70620 () Bool)

(declare-fun e!46037 () Bool)

(declare-fun e!46033 () Bool)

(assert (=> b!70620 (= e!46037 e!46033)))

(declare-fun res!58277 () Bool)

(assert (=> b!70620 (=> res!58277 e!46033)))

(assert (=> b!70620 (= res!58277 (not (= (size!1360 (buf!1741 (_2!3181 lt!113646))) (size!1360 (buf!1741 (_2!3181 lt!113649))))))))

(declare-fun lt!113645 () (_ BitVec 64))

(assert (=> b!70620 (= lt!113645 (bvsub (bvsub (bvadd lt!113666 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!70620 (= lt!113666 (bitIndex!0 (size!1360 (buf!1741 (_2!3181 lt!113646))) (currentByte!3455 (_2!3181 lt!113646)) (currentBit!3450 (_2!3181 lt!113646))))))

(assert (=> b!70620 (= (size!1360 (buf!1741 (_2!3181 lt!113649))) (size!1360 (buf!1741 thiss!1379)))))

(declare-fun b!70621 () Bool)

(declare-fun e!46041 () Bool)

(assert (=> b!70621 (= e!46034 e!46041)))

(declare-fun res!58272 () Bool)

(assert (=> b!70621 (=> res!58272 e!46041)))

(declare-fun lt!113662 () Bool)

(assert (=> b!70621 (= res!58272 (not (= lt!113662 lt!113656)))))

(assert (=> b!70621 (= lt!113662 (head!550 lt!113651))))

(declare-fun lt!113665 () Bool)

(declare-fun lt!113650 () (_ BitVec 64))

(declare-fun b!70622 () Bool)

(assert (=> b!70622 (= e!46039 (or (not (= lt!113662 lt!113665)) (let ((bdg!3309 (bvand lt!113660 #b1000000000000000000000000000000000000000000000000000000000000000))) (or (not (= bdg!3309 (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= bdg!3309 (bvand lt!113650 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!70623 () Bool)

(declare-fun res!58280 () Bool)

(assert (=> b!70623 (=> res!58280 e!46037)))

(assert (=> b!70623 (= res!58280 (not (= (size!1360 (buf!1741 thiss!1379)) (size!1360 (buf!1741 (_2!3181 lt!113649))))))))

(declare-fun b!70624 () Bool)

(declare-fun res!58283 () Bool)

(assert (=> b!70624 (=> res!58283 e!46033)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!70624 (= res!58283 (not (invariant!0 (currentBit!3450 (_2!3181 lt!113646)) (currentByte!3455 (_2!3181 lt!113646)) (size!1360 (buf!1741 (_2!3181 lt!113649))))))))

(declare-fun b!70625 () Bool)

(assert (=> b!70625 (= e!46031 e!46037)))

(declare-fun res!58266 () Bool)

(assert (=> b!70625 (=> res!58266 e!46037)))

(assert (=> b!70625 (= res!58266 (not (= lt!113645 (bvsub lt!113650 i!635))))))

(assert (=> b!70625 (= lt!113645 (bitIndex!0 (size!1360 (buf!1741 (_2!3181 lt!113649))) (currentByte!3455 (_2!3181 lt!113649)) (currentBit!3450 (_2!3181 lt!113649))))))

(assert (=> b!70625 (= lt!113650 (bvadd lt!113660 to!314))))

(declare-fun b!70626 () Bool)

(declare-fun res!58281 () Bool)

(assert (=> b!70626 (=> res!58281 e!46037)))

(assert (=> b!70626 (= res!58281 (not (invariant!0 (currentBit!3450 (_2!3181 lt!113649)) (currentByte!3455 (_2!3181 lt!113649)) (size!1360 (buf!1741 (_2!3181 lt!113649))))))))

(declare-fun b!70627 () Bool)

(declare-fun e!46030 () Bool)

(assert (=> b!70627 (= e!46030 e!46044)))

(declare-fun res!58271 () Bool)

(assert (=> b!70627 (=> res!58271 e!46044)))

(assert (=> b!70627 (= res!58271 (not (isPrefixOf!0 thiss!1379 (_2!3181 lt!113646))))))

(declare-fun lt!113663 () (_ BitVec 64))

(assert (=> b!70627 (validate_offset_bits!1 ((_ sign_extend 32) (size!1360 (buf!1741 (_2!3181 lt!113646)))) ((_ sign_extend 32) (currentByte!3455 (_2!3181 lt!113646))) ((_ sign_extend 32) (currentBit!3450 (_2!3181 lt!113646))) lt!113663)))

(assert (=> b!70627 (= lt!113663 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!113648 () Unit!4725)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2312 BitStream!2312 (_ BitVec 64) (_ BitVec 64)) Unit!4725)

(assert (=> b!70627 (= lt!113648 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3181 lt!113646) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2312 (_ BitVec 8) (_ BitVec 32)) tuple2!6134)

(assert (=> b!70627 (= lt!113646 (appendBitFromByte!0 thiss!1379 (select (arr!1945 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!70628 () Bool)

(assert (=> b!70628 (= e!46041 e!46032)))

(declare-fun res!58273 () Bool)

(assert (=> b!70628 (=> res!58273 e!46032)))

(assert (=> b!70628 (= res!58273 (not (= lt!113665 lt!113647)))))

(assert (=> b!70628 (= lt!113647 (bitAt!0 srcBuffer!2 i!635))))

(assert (=> b!70628 (= lt!113665 (head!550 (byteArrayBitContentToList!0 (_2!3181 lt!113649) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(declare-fun b!70629 () Bool)

(declare-fun res!58270 () Bool)

(assert (=> b!70629 (=> res!58270 e!46035)))

(declare-fun length!359 (List!731) Int)

(assert (=> b!70629 (= res!58270 (<= (length!359 lt!113651) 0))))

(declare-fun b!70619 () Bool)

(assert (=> b!70619 (= e!46033 e!46035)))

(declare-fun res!58278 () Bool)

(assert (=> b!70619 (=> res!58278 e!46035)))

(assert (=> b!70619 (= res!58278 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!70619 (= lt!113655 (bitStreamReadBitsIntoList!0 (_2!3181 lt!113649) (_1!3180 lt!113657) lt!113663))))

(assert (=> b!70619 (= lt!113651 (bitStreamReadBitsIntoList!0 (_2!3181 lt!113649) (_1!3180 lt!113668) (bvsub to!314 i!635)))))

(assert (=> b!70619 (validate_offset_bits!1 ((_ sign_extend 32) (size!1360 (buf!1741 (_2!3181 lt!113649)))) ((_ sign_extend 32) (currentByte!3455 (_2!3181 lt!113646))) ((_ sign_extend 32) (currentBit!3450 (_2!3181 lt!113646))) lt!113663)))

(declare-fun lt!113661 () Unit!4725)

(assert (=> b!70619 (= lt!113661 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3181 lt!113646) (buf!1741 (_2!3181 lt!113649)) lt!113663))))

(assert (=> b!70619 (= lt!113657 (reader!0 (_2!3181 lt!113646) (_2!3181 lt!113649)))))

(assert (=> b!70619 (validate_offset_bits!1 ((_ sign_extend 32) (size!1360 (buf!1741 (_2!3181 lt!113649)))) ((_ sign_extend 32) (currentByte!3455 thiss!1379)) ((_ sign_extend 32) (currentBit!3450 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!113652 () Unit!4725)

(assert (=> b!70619 (= lt!113652 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1741 (_2!3181 lt!113649)) (bvsub to!314 i!635)))))

(assert (=> b!70619 (= lt!113668 (reader!0 thiss!1379 (_2!3181 lt!113649)))))

(declare-fun res!58267 () Bool)

(declare-fun e!46045 () Bool)

(assert (=> start!13780 (=> (not res!58267) (not e!46045))))

(assert (=> start!13780 (= res!58267 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1360 srcBuffer!2))))))))

(assert (=> start!13780 e!46045))

(assert (=> start!13780 true))

(assert (=> start!13780 (array_inv!1215 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2312) Bool)

(assert (=> start!13780 (and (inv!12 thiss!1379) e!46040)))

(declare-fun b!70630 () Bool)

(declare-fun res!58269 () Bool)

(assert (=> b!70630 (=> res!58269 e!46033)))

(assert (=> b!70630 (= res!58269 (not (invariant!0 (currentBit!3450 (_2!3181 lt!113646)) (currentByte!3455 (_2!3181 lt!113646)) (size!1360 (buf!1741 (_2!3181 lt!113646))))))))

(declare-fun b!70631 () Bool)

(assert (=> b!70631 (= e!46045 (not e!46030))))

(declare-fun res!58275 () Bool)

(assert (=> b!70631 (=> res!58275 e!46030)))

(assert (=> b!70631 (= res!58275 (bvsge i!635 to!314))))

(assert (=> b!70631 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!113642 () Unit!4725)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2312) Unit!4725)

(assert (=> b!70631 (= lt!113642 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!70631 (= lt!113660 (bitIndex!0 (size!1360 (buf!1741 thiss!1379)) (currentByte!3455 thiss!1379) (currentBit!3450 thiss!1379)))))

(declare-fun b!70632 () Bool)

(declare-fun res!58279 () Bool)

(assert (=> b!70632 (=> res!58279 e!46039)))

(declare-datatypes ((tuple2!6136 0))(
  ( (tuple2!6137 (_1!3182 BitStream!2312) (_2!3182 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!2312) tuple2!6136)

(assert (=> b!70632 (= res!58279 (not (= (_2!3182 (readBitPure!0 (_1!3180 lt!113668))) lt!113647)))))

(declare-fun b!70633 () Bool)

(declare-fun res!58265 () Bool)

(assert (=> b!70633 (=> (not res!58265) (not e!46045))))

(assert (=> b!70633 (= res!58265 (validate_offset_bits!1 ((_ sign_extend 32) (size!1360 (buf!1741 thiss!1379))) ((_ sign_extend 32) (currentByte!3455 thiss!1379)) ((_ sign_extend 32) (currentBit!3450 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!13780 res!58267) b!70633))

(assert (= (and b!70633 res!58265) b!70631))

(assert (= (and b!70631 (not res!58275)) b!70627))

(assert (= (and b!70627 (not res!58271)) b!70616))

(assert (= (and b!70616 res!58268) b!70614))

(assert (= (and b!70616 (not res!58284)) b!70625))

(assert (= (and b!70625 (not res!58266)) b!70626))

(assert (= (and b!70626 (not res!58281)) b!70623))

(assert (= (and b!70623 (not res!58280)) b!70620))

(assert (= (and b!70620 (not res!58277)) b!70630))

(assert (= (and b!70630 (not res!58269)) b!70624))

(assert (= (and b!70624 (not res!58283)) b!70619))

(assert (= (and b!70619 (not res!58278)) b!70629))

(assert (= (and b!70629 (not res!58270)) b!70613))

(assert (= (and b!70613 (not res!58282)) b!70612))

(assert (= (and b!70612 (not res!58264)) b!70621))

(assert (= (and b!70621 (not res!58272)) b!70628))

(assert (= (and b!70628 (not res!58273)) b!70617))

(assert (= (and b!70617 (not res!58274)) b!70618))

(assert (= (and b!70618 (not res!58276)) b!70632))

(assert (= (and b!70632 (not res!58279)) b!70622))

(assert (= start!13780 b!70615))

(declare-fun m!113075 () Bool)

(assert (=> b!70631 m!113075))

(declare-fun m!113077 () Bool)

(assert (=> b!70631 m!113077))

(declare-fun m!113079 () Bool)

(assert (=> b!70631 m!113079))

(declare-fun m!113081 () Bool)

(assert (=> b!70630 m!113081))

(declare-fun m!113083 () Bool)

(assert (=> b!70629 m!113083))

(declare-fun m!113085 () Bool)

(assert (=> b!70612 m!113085))

(declare-fun m!113087 () Bool)

(assert (=> b!70612 m!113087))

(declare-fun m!113089 () Bool)

(assert (=> b!70632 m!113089))

(declare-fun m!113091 () Bool)

(assert (=> b!70618 m!113091))

(declare-fun m!113093 () Bool)

(assert (=> b!70618 m!113093))

(declare-fun m!113095 () Bool)

(assert (=> b!70621 m!113095))

(declare-fun m!113097 () Bool)

(assert (=> b!70617 m!113097))

(declare-fun m!113099 () Bool)

(assert (=> b!70628 m!113099))

(declare-fun m!113101 () Bool)

(assert (=> b!70628 m!113101))

(assert (=> b!70628 m!113101))

(declare-fun m!113103 () Bool)

(assert (=> b!70628 m!113103))

(declare-fun m!113105 () Bool)

(assert (=> b!70626 m!113105))

(declare-fun m!113107 () Bool)

(assert (=> b!70624 m!113107))

(declare-fun m!113109 () Bool)

(assert (=> b!70625 m!113109))

(declare-fun m!113111 () Bool)

(assert (=> b!70627 m!113111))

(declare-fun m!113113 () Bool)

(assert (=> b!70627 m!113113))

(declare-fun m!113115 () Bool)

(assert (=> b!70627 m!113115))

(declare-fun m!113117 () Bool)

(assert (=> b!70627 m!113117))

(assert (=> b!70627 m!113113))

(declare-fun m!113119 () Bool)

(assert (=> b!70627 m!113119))

(declare-fun m!113121 () Bool)

(assert (=> b!70620 m!113121))

(declare-fun m!113123 () Bool)

(assert (=> b!70613 m!113123))

(declare-fun m!113125 () Bool)

(assert (=> b!70613 m!113125))

(declare-fun m!113127 () Bool)

(assert (=> b!70616 m!113127))

(declare-fun m!113129 () Bool)

(assert (=> b!70616 m!113129))

(declare-fun m!113131 () Bool)

(assert (=> b!70616 m!113131))

(declare-fun m!113133 () Bool)

(assert (=> b!70616 m!113133))

(declare-fun m!113135 () Bool)

(assert (=> b!70616 m!113135))

(declare-fun m!113137 () Bool)

(assert (=> b!70616 m!113137))

(declare-fun m!113139 () Bool)

(assert (=> b!70616 m!113139))

(declare-fun m!113141 () Bool)

(assert (=> b!70619 m!113141))

(declare-fun m!113143 () Bool)

(assert (=> b!70619 m!113143))

(declare-fun m!113145 () Bool)

(assert (=> b!70619 m!113145))

(declare-fun m!113147 () Bool)

(assert (=> b!70619 m!113147))

(declare-fun m!113149 () Bool)

(assert (=> b!70619 m!113149))

(declare-fun m!113151 () Bool)

(assert (=> b!70619 m!113151))

(declare-fun m!113153 () Bool)

(assert (=> b!70619 m!113153))

(declare-fun m!113155 () Bool)

(assert (=> b!70619 m!113155))

(declare-fun m!113157 () Bool)

(assert (=> b!70614 m!113157))

(assert (=> b!70614 m!113157))

(declare-fun m!113159 () Bool)

(assert (=> b!70614 m!113159))

(declare-fun m!113161 () Bool)

(assert (=> b!70614 m!113161))

(assert (=> b!70614 m!113161))

(declare-fun m!113163 () Bool)

(assert (=> b!70614 m!113163))

(declare-fun m!113165 () Bool)

(assert (=> start!13780 m!113165))

(declare-fun m!113167 () Bool)

(assert (=> start!13780 m!113167))

(declare-fun m!113169 () Bool)

(assert (=> b!70633 m!113169))

(declare-fun m!113171 () Bool)

(assert (=> b!70615 m!113171))

(push 1)

(assert (not b!70628))

(assert (not b!70633))

(assert (not b!70616))

(assert (not b!70613))

(assert (not start!13780))

(assert (not b!70630))

(assert (not b!70627))

(assert (not b!70626))

(assert (not b!70625))

(assert (not b!70615))

(assert (not b!70632))

(assert (not b!70617))

(assert (not b!70612))

(assert (not b!70620))

(assert (not b!70618))

(assert (not b!70614))

(assert (not b!70631))

(assert (not b!70629))

(assert (not b!70619))

(assert (not b!70621))

(assert (not b!70624))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!22734 () Bool)

(declare-fun res!58361 () Bool)

(declare-fun e!46103 () Bool)

(assert (=> d!22734 (=> (not res!58361) (not e!46103))))

(assert (=> d!22734 (= res!58361 (= (size!1360 (buf!1741 thiss!1379)) (size!1360 (buf!1741 (_2!3181 lt!113646)))))))

(assert (=> d!22734 (= (isPrefixOf!0 thiss!1379 (_2!3181 lt!113646)) e!46103)))

(declare-fun b!70736 () Bool)

(declare-fun res!58360 () Bool)

(assert (=> b!70736 (=> (not res!58360) (not e!46103))))

(assert (=> b!70736 (= res!58360 (bvsle (bitIndex!0 (size!1360 (buf!1741 thiss!1379)) (currentByte!3455 thiss!1379) (currentBit!3450 thiss!1379)) (bitIndex!0 (size!1360 (buf!1741 (_2!3181 lt!113646))) (currentByte!3455 (_2!3181 lt!113646)) (currentBit!3450 (_2!3181 lt!113646)))))))

(declare-fun b!70737 () Bool)

(declare-fun e!46102 () Bool)

(assert (=> b!70737 (= e!46103 e!46102)))

(declare-fun res!58362 () Bool)

(assert (=> b!70737 (=> res!58362 e!46102)))

(assert (=> b!70737 (= res!58362 (= (size!1360 (buf!1741 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!70738 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2921 array!2921 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!70738 (= e!46102 (arrayBitRangesEq!0 (buf!1741 thiss!1379) (buf!1741 (_2!3181 lt!113646)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1360 (buf!1741 thiss!1379)) (currentByte!3455 thiss!1379) (currentBit!3450 thiss!1379))))))

(assert (= (and d!22734 res!58361) b!70736))

(assert (= (and b!70736 res!58360) b!70737))

(assert (= (and b!70737 (not res!58362)) b!70738))

(assert (=> b!70736 m!113079))

(assert (=> b!70736 m!113121))

(assert (=> b!70738 m!113079))

(assert (=> b!70738 m!113079))

(declare-fun m!113339 () Bool)

(assert (=> b!70738 m!113339))

(assert (=> b!70627 d!22734))

(declare-fun d!22736 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!22736 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1360 (buf!1741 (_2!3181 lt!113646)))) ((_ sign_extend 32) (currentByte!3455 (_2!3181 lt!113646))) ((_ sign_extend 32) (currentBit!3450 (_2!3181 lt!113646))) lt!113663) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1360 (buf!1741 (_2!3181 lt!113646)))) ((_ sign_extend 32) (currentByte!3455 (_2!3181 lt!113646))) ((_ sign_extend 32) (currentBit!3450 (_2!3181 lt!113646)))) lt!113663))))

(declare-fun bs!5452 () Bool)

(assert (= bs!5452 d!22736))

(declare-fun m!113341 () Bool)

(assert (=> bs!5452 m!113341))

(assert (=> b!70627 d!22736))

(declare-fun d!22738 () Bool)

(declare-fun e!46106 () Bool)

(assert (=> d!22738 e!46106))

(declare-fun res!58365 () Bool)

(assert (=> d!22738 (=> (not res!58365) (not e!46106))))

(assert (=> d!22738 (= res!58365 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!113859 () Unit!4725)

(declare-fun choose!27 (BitStream!2312 BitStream!2312 (_ BitVec 64) (_ BitVec 64)) Unit!4725)

(assert (=> d!22738 (= lt!113859 (choose!27 thiss!1379 (_2!3181 lt!113646) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!22738 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!22738 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3181 lt!113646) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!113859)))

(declare-fun b!70741 () Bool)

(assert (=> b!70741 (= e!46106 (validate_offset_bits!1 ((_ sign_extend 32) (size!1360 (buf!1741 (_2!3181 lt!113646)))) ((_ sign_extend 32) (currentByte!3455 (_2!3181 lt!113646))) ((_ sign_extend 32) (currentBit!3450 (_2!3181 lt!113646))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!22738 res!58365) b!70741))

(declare-fun m!113343 () Bool)

(assert (=> d!22738 m!113343))

(declare-fun m!113345 () Bool)

(assert (=> b!70741 m!113345))

(assert (=> b!70627 d!22738))

(declare-fun b!70759 () Bool)

(declare-fun res!58387 () Bool)

(declare-fun e!46115 () Bool)

(assert (=> b!70759 (=> (not res!58387) (not e!46115))))

(declare-fun lt!113885 () tuple2!6134)

(assert (=> b!70759 (= res!58387 (isPrefixOf!0 thiss!1379 (_2!3181 lt!113885)))))

(declare-fun b!70760 () Bool)

(declare-fun e!46118 () Bool)

(declare-fun lt!113895 () tuple2!6136)

(declare-fun lt!113893 () tuple2!6134)

(assert (=> b!70760 (= e!46118 (= (bitIndex!0 (size!1360 (buf!1741 (_1!3182 lt!113895))) (currentByte!3455 (_1!3182 lt!113895)) (currentBit!3450 (_1!3182 lt!113895))) (bitIndex!0 (size!1360 (buf!1741 (_2!3181 lt!113893))) (currentByte!3455 (_2!3181 lt!113893)) (currentBit!3450 (_2!3181 lt!113893)))))))

(declare-fun b!70761 () Bool)

(declare-fun res!58384 () Bool)

(assert (=> b!70761 (=> (not res!58384) (not e!46115))))

(assert (=> b!70761 (= res!58384 (= (bitIndex!0 (size!1360 (buf!1741 (_2!3181 lt!113885))) (currentByte!3455 (_2!3181 lt!113885)) (currentBit!3450 (_2!3181 lt!113885))) (bvadd (bitIndex!0 (size!1360 (buf!1741 thiss!1379)) (currentByte!3455 thiss!1379) (currentBit!3450 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!70762 () Bool)

(declare-fun res!58389 () Bool)

(declare-fun e!46117 () Bool)

(assert (=> b!70762 (=> (not res!58389) (not e!46117))))

(declare-fun lt!113891 () (_ BitVec 64))

(declare-fun lt!113886 () (_ BitVec 64))

(assert (=> b!70762 (= res!58389 (= (bitIndex!0 (size!1360 (buf!1741 (_2!3181 lt!113893))) (currentByte!3455 (_2!3181 lt!113893)) (currentBit!3450 (_2!3181 lt!113893))) (bvadd lt!113891 lt!113886)))))

(assert (=> b!70762 (or (not (= (bvand lt!113891 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!113886 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!113891 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!113891 lt!113886) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!70762 (= lt!113886 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!70762 (= lt!113891 (bitIndex!0 (size!1360 (buf!1741 thiss!1379)) (currentByte!3455 thiss!1379) (currentBit!3450 thiss!1379)))))

(declare-fun b!70763 () Bool)

(assert (=> b!70763 (= e!46117 e!46118)))

(declare-fun res!58383 () Bool)

(assert (=> b!70763 (=> (not res!58383) (not e!46118))))

(declare-fun lt!113889 () (_ BitVec 8))

(assert (=> b!70763 (= res!58383 (and (= (_2!3182 lt!113895) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1945 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!113889)) #b00000000000000000000000000000000))) (= (_1!3182 lt!113895) (_2!3181 lt!113893))))))

(declare-datatypes ((tuple2!6144 0))(
  ( (tuple2!6145 (_1!3186 array!2921) (_2!3186 BitStream!2312)) )
))
(declare-fun lt!113892 () tuple2!6144)

(declare-fun lt!113887 () BitStream!2312)

(declare-fun readBits!0 (BitStream!2312 (_ BitVec 64)) tuple2!6144)

(assert (=> b!70763 (= lt!113892 (readBits!0 lt!113887 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!70763 (= lt!113895 (readBitPure!0 lt!113887))))

(declare-fun readerFrom!0 (BitStream!2312 (_ BitVec 32) (_ BitVec 32)) BitStream!2312)

(assert (=> b!70763 (= lt!113887 (readerFrom!0 (_2!3181 lt!113893) (currentBit!3450 thiss!1379) (currentByte!3455 thiss!1379)))))

(declare-fun b!70764 () Bool)

(declare-fun e!46116 () Bool)

(assert (=> b!70764 (= e!46115 e!46116)))

(declare-fun res!58382 () Bool)

(assert (=> b!70764 (=> (not res!58382) (not e!46116))))

(declare-fun lt!113884 () Bool)

(declare-fun lt!113890 () tuple2!6136)

(assert (=> b!70764 (= res!58382 (and (= (_2!3182 lt!113890) lt!113884) (= (_1!3182 lt!113890) (_2!3181 lt!113885))))))

(assert (=> b!70764 (= lt!113890 (readBitPure!0 (readerFrom!0 (_2!3181 lt!113885) (currentBit!3450 thiss!1379) (currentByte!3455 thiss!1379))))))

(declare-fun b!70765 () Bool)

(assert (=> b!70765 (= e!46116 (= (bitIndex!0 (size!1360 (buf!1741 (_1!3182 lt!113890))) (currentByte!3455 (_1!3182 lt!113890)) (currentBit!3450 (_1!3182 lt!113890))) (bitIndex!0 (size!1360 (buf!1741 (_2!3181 lt!113885))) (currentByte!3455 (_2!3181 lt!113885)) (currentBit!3450 (_2!3181 lt!113885)))))))

(declare-fun b!70766 () Bool)

(declare-fun res!58385 () Bool)

(assert (=> b!70766 (=> (not res!58385) (not e!46117))))

(assert (=> b!70766 (= res!58385 (isPrefixOf!0 thiss!1379 (_2!3181 lt!113893)))))

(declare-fun d!22740 () Bool)

(assert (=> d!22740 e!46117))

(declare-fun res!58388 () Bool)

(assert (=> d!22740 (=> (not res!58388) (not e!46117))))

(assert (=> d!22740 (= res!58388 (= (size!1360 (buf!1741 (_2!3181 lt!113893))) (size!1360 (buf!1741 thiss!1379))))))

(declare-fun lt!113894 () array!2921)

(assert (=> d!22740 (= lt!113889 (select (arr!1945 lt!113894) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!22740 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1360 lt!113894)))))

(assert (=> d!22740 (= lt!113894 (array!2922 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!113888 () tuple2!6134)

(assert (=> d!22740 (= lt!113893 (tuple2!6135 (_1!3181 lt!113888) (_2!3181 lt!113888)))))

(assert (=> d!22740 (= lt!113888 lt!113885)))

(assert (=> d!22740 e!46115))

(declare-fun res!58386 () Bool)

(assert (=> d!22740 (=> (not res!58386) (not e!46115))))

(assert (=> d!22740 (= res!58386 (= (size!1360 (buf!1741 thiss!1379)) (size!1360 (buf!1741 (_2!3181 lt!113885)))))))

(declare-fun appendBit!0 (BitStream!2312 Bool) tuple2!6134)

(assert (=> d!22740 (= lt!113885 (appendBit!0 thiss!1379 lt!113884))))

(assert (=> d!22740 (= lt!113884 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1945 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!22740 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!22740 (= (appendBitFromByte!0 thiss!1379 (select (arr!1945 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!113893)))

(assert (= (and d!22740 res!58386) b!70761))

(assert (= (and b!70761 res!58384) b!70759))

(assert (= (and b!70759 res!58387) b!70764))

(assert (= (and b!70764 res!58382) b!70765))

(assert (= (and d!22740 res!58388) b!70762))

(assert (= (and b!70762 res!58389) b!70766))

(assert (= (and b!70766 res!58385) b!70763))

(assert (= (and b!70763 res!58383) b!70760))

(declare-fun m!113347 () Bool)

(assert (=> d!22740 m!113347))

(declare-fun m!113349 () Bool)

(assert (=> d!22740 m!113349))

(declare-fun m!113351 () Bool)

(assert (=> d!22740 m!113351))

(declare-fun m!113353 () Bool)

(assert (=> b!70766 m!113353))

(declare-fun m!113355 () Bool)

(assert (=> b!70763 m!113355))

(declare-fun m!113357 () Bool)

(assert (=> b!70763 m!113357))

(declare-fun m!113359 () Bool)

(assert (=> b!70763 m!113359))

(declare-fun m!113361 () Bool)

(assert (=> b!70762 m!113361))

(assert (=> b!70762 m!113079))

(declare-fun m!113363 () Bool)

(assert (=> b!70764 m!113363))

(assert (=> b!70764 m!113363))

(declare-fun m!113365 () Bool)

(assert (=> b!70764 m!113365))

(declare-fun m!113367 () Bool)

(assert (=> b!70759 m!113367))

(declare-fun m!113369 () Bool)

(assert (=> b!70760 m!113369))

(assert (=> b!70760 m!113361))

(declare-fun m!113371 () Bool)

(assert (=> b!70761 m!113371))

(assert (=> b!70761 m!113079))

(declare-fun m!113373 () Bool)

(assert (=> b!70765 m!113373))

(assert (=> b!70765 m!113371))

(assert (=> b!70627 d!22740))

(declare-fun d!22742 () Bool)

(assert (=> d!22742 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1945 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5453 () Bool)

(assert (= bs!5453 d!22742))

(assert (=> bs!5453 m!113113))

(assert (=> bs!5453 m!113351))

(assert (=> b!70628 d!22742))

(declare-fun d!22744 () Bool)

(assert (=> d!22744 (= (head!550 (byteArrayBitContentToList!0 (_2!3181 lt!113649) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!846 (byteArrayBitContentToList!0 (_2!3181 lt!113649) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!70628 d!22744))

(declare-fun d!22746 () Bool)

(declare-fun c!5281 () Bool)

(assert (=> d!22746 (= c!5281 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!46121 () List!731)

(assert (=> d!22746 (= (byteArrayBitContentToList!0 (_2!3181 lt!113649) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!46121)))

(declare-fun b!70771 () Bool)

(assert (=> b!70771 (= e!46121 Nil!728)))

(declare-fun b!70772 () Bool)

(assert (=> b!70772 (= e!46121 (Cons!727 (not (= (bvand ((_ sign_extend 24) (select (arr!1945 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3181 lt!113649) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!22746 c!5281) b!70771))

(assert (= (and d!22746 (not c!5281)) b!70772))

(assert (=> b!70772 m!113113))

(assert (=> b!70772 m!113351))

(declare-fun m!113375 () Bool)

(assert (=> b!70772 m!113375))

(assert (=> b!70628 d!22746))

(declare-fun d!22748 () Bool)

(assert (=> d!22748 (= (array_inv!1215 srcBuffer!2) (bvsge (size!1360 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!13780 d!22748))

(declare-fun d!22750 () Bool)

(assert (=> d!22750 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3450 thiss!1379) (currentByte!3455 thiss!1379) (size!1360 (buf!1741 thiss!1379))))))

(declare-fun bs!5454 () Bool)

(assert (= bs!5454 d!22750))

(declare-fun m!113377 () Bool)

(assert (=> bs!5454 m!113377))

(assert (=> start!13780 d!22750))

(declare-fun d!22752 () Bool)

(assert (=> d!22752 (= (bitAt!0 (buf!1741 (_2!3181 lt!113646)) lt!113660) (not (= (bvand ((_ sign_extend 24) (select (arr!1945 (buf!1741 (_2!3181 lt!113646))) ((_ extract 31 0) (bvsdiv lt!113660 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!113660 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5455 () Bool)

(assert (= bs!5455 d!22752))

(declare-fun m!113379 () Bool)

(assert (=> bs!5455 m!113379))

(declare-fun m!113381 () Bool)

(assert (=> bs!5455 m!113381))

(assert (=> b!70617 d!22752))

(declare-fun d!22754 () Bool)

(assert (=> d!22754 (= (bitAt!0 (buf!1741 (_2!3181 lt!113649)) lt!113660) (not (= (bvand ((_ sign_extend 24) (select (arr!1945 (buf!1741 (_2!3181 lt!113649))) ((_ extract 31 0) (bvsdiv lt!113660 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!113660 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5456 () Bool)

(assert (= bs!5456 d!22754))

(declare-fun m!113383 () Bool)

(assert (=> bs!5456 m!113383))

(assert (=> bs!5456 m!113381))

(assert (=> b!70618 d!22754))

(declare-fun d!22756 () Bool)

(assert (=> d!22756 (= (bitAt!0 (buf!1741 (_2!3181 lt!113646)) lt!113660) (bitAt!0 (buf!1741 (_2!3181 lt!113649)) lt!113660))))

(declare-fun lt!113898 () Unit!4725)

(declare-fun choose!31 (array!2921 array!2921 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4725)

(assert (=> d!22756 (= lt!113898 (choose!31 (buf!1741 (_2!3181 lt!113646)) (buf!1741 (_2!3181 lt!113649)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!113660 lt!113666))))

(assert (=> d!22756 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!113666))))

(assert (=> d!22756 (= (arrayBitRangesEqImpliesEq!0 (buf!1741 (_2!3181 lt!113646)) (buf!1741 (_2!3181 lt!113649)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!113660 lt!113666) lt!113898)))

(declare-fun bs!5457 () Bool)

(assert (= bs!5457 d!22756))

(assert (=> bs!5457 m!113097))

(assert (=> bs!5457 m!113091))

(declare-fun m!113385 () Bool)

(assert (=> bs!5457 m!113385))

(assert (=> b!70618 d!22756))

(declare-fun d!22758 () Bool)

(declare-fun size!1362 (List!731) Int)

(assert (=> d!22758 (= (length!359 lt!113651) (size!1362 lt!113651))))

(declare-fun bs!5458 () Bool)

(assert (= bs!5458 d!22758))

(declare-fun m!113387 () Bool)

(assert (=> bs!5458 m!113387))

(assert (=> b!70629 d!22758))

(declare-fun d!22760 () Bool)

(assert (=> d!22760 (= (invariant!0 (currentBit!3450 (_2!3181 lt!113646)) (currentByte!3455 (_2!3181 lt!113646)) (size!1360 (buf!1741 (_2!3181 lt!113646)))) (and (bvsge (currentBit!3450 (_2!3181 lt!113646)) #b00000000000000000000000000000000) (bvslt (currentBit!3450 (_2!3181 lt!113646)) #b00000000000000000000000000001000) (bvsge (currentByte!3455 (_2!3181 lt!113646)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3455 (_2!3181 lt!113646)) (size!1360 (buf!1741 (_2!3181 lt!113646)))) (and (= (currentBit!3450 (_2!3181 lt!113646)) #b00000000000000000000000000000000) (= (currentByte!3455 (_2!3181 lt!113646)) (size!1360 (buf!1741 (_2!3181 lt!113646))))))))))

(assert (=> b!70630 d!22760))

(declare-fun d!22762 () Bool)

(assert (=> d!22762 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1360 (buf!1741 (_2!3181 lt!113649)))) ((_ sign_extend 32) (currentByte!3455 thiss!1379)) ((_ sign_extend 32) (currentBit!3450 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1360 (buf!1741 (_2!3181 lt!113649)))) ((_ sign_extend 32) (currentByte!3455 thiss!1379)) ((_ sign_extend 32) (currentBit!3450 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5459 () Bool)

(assert (= bs!5459 d!22762))

(declare-fun m!113389 () Bool)

(assert (=> bs!5459 m!113389))

(assert (=> b!70619 d!22762))

(declare-fun d!22764 () Bool)

(assert (=> d!22764 (validate_offset_bits!1 ((_ sign_extend 32) (size!1360 (buf!1741 (_2!3181 lt!113649)))) ((_ sign_extend 32) (currentByte!3455 (_2!3181 lt!113646))) ((_ sign_extend 32) (currentBit!3450 (_2!3181 lt!113646))) lt!113663)))

(declare-fun lt!113901 () Unit!4725)

(declare-fun choose!9 (BitStream!2312 array!2921 (_ BitVec 64) BitStream!2312) Unit!4725)

(assert (=> d!22764 (= lt!113901 (choose!9 (_2!3181 lt!113646) (buf!1741 (_2!3181 lt!113649)) lt!113663 (BitStream!2313 (buf!1741 (_2!3181 lt!113649)) (currentByte!3455 (_2!3181 lt!113646)) (currentBit!3450 (_2!3181 lt!113646)))))))

(assert (=> d!22764 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3181 lt!113646) (buf!1741 (_2!3181 lt!113649)) lt!113663) lt!113901)))

(declare-fun bs!5460 () Bool)

(assert (= bs!5460 d!22764))

(assert (=> bs!5460 m!113141))

(declare-fun m!113391 () Bool)

(assert (=> bs!5460 m!113391))

(assert (=> b!70619 d!22764))

(declare-fun b!70784 () Bool)

(declare-fun e!46127 () Bool)

(declare-fun lt!113910 () List!731)

(assert (=> b!70784 (= e!46127 (> (length!359 lt!113910) 0))))

(declare-fun b!70781 () Bool)

(declare-datatypes ((tuple2!6146 0))(
  ( (tuple2!6147 (_1!3187 List!731) (_2!3187 BitStream!2312)) )
))
(declare-fun e!46126 () tuple2!6146)

(assert (=> b!70781 (= e!46126 (tuple2!6147 Nil!728 (_1!3180 lt!113657)))))

(declare-fun lt!113909 () (_ BitVec 64))

(declare-datatypes ((tuple2!6148 0))(
  ( (tuple2!6149 (_1!3188 Bool) (_2!3188 BitStream!2312)) )
))
(declare-fun lt!113908 () tuple2!6148)

(declare-fun b!70782 () Bool)

(assert (=> b!70782 (= e!46126 (tuple2!6147 (Cons!727 (_1!3188 lt!113908) (bitStreamReadBitsIntoList!0 (_2!3181 lt!113649) (_2!3188 lt!113908) (bvsub lt!113663 lt!113909))) (_2!3188 lt!113908)))))

(declare-fun readBit!0 (BitStream!2312) tuple2!6148)

(assert (=> b!70782 (= lt!113908 (readBit!0 (_1!3180 lt!113657)))))

(assert (=> b!70782 (= lt!113909 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!70783 () Bool)

(declare-fun isEmpty!229 (List!731) Bool)

(assert (=> b!70783 (= e!46127 (isEmpty!229 lt!113910))))

(declare-fun d!22766 () Bool)

(assert (=> d!22766 e!46127))

(declare-fun c!5286 () Bool)

(assert (=> d!22766 (= c!5286 (= lt!113663 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22766 (= lt!113910 (_1!3187 e!46126))))

(declare-fun c!5287 () Bool)

(assert (=> d!22766 (= c!5287 (= lt!113663 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22766 (bvsge lt!113663 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22766 (= (bitStreamReadBitsIntoList!0 (_2!3181 lt!113649) (_1!3180 lt!113657) lt!113663) lt!113910)))

(assert (= (and d!22766 c!5287) b!70781))

(assert (= (and d!22766 (not c!5287)) b!70782))

(assert (= (and d!22766 c!5286) b!70783))

(assert (= (and d!22766 (not c!5286)) b!70784))

(declare-fun m!113393 () Bool)

(assert (=> b!70784 m!113393))

(declare-fun m!113395 () Bool)

(assert (=> b!70782 m!113395))

(declare-fun m!113397 () Bool)

(assert (=> b!70782 m!113397))

(declare-fun m!113399 () Bool)

(assert (=> b!70783 m!113399))

(assert (=> b!70619 d!22766))

(declare-fun d!22768 () Bool)

(assert (=> d!22768 (validate_offset_bits!1 ((_ sign_extend 32) (size!1360 (buf!1741 (_2!3181 lt!113649)))) ((_ sign_extend 32) (currentByte!3455 thiss!1379)) ((_ sign_extend 32) (currentBit!3450 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!113911 () Unit!4725)

(assert (=> d!22768 (= lt!113911 (choose!9 thiss!1379 (buf!1741 (_2!3181 lt!113649)) (bvsub to!314 i!635) (BitStream!2313 (buf!1741 (_2!3181 lt!113649)) (currentByte!3455 thiss!1379) (currentBit!3450 thiss!1379))))))

(assert (=> d!22768 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1741 (_2!3181 lt!113649)) (bvsub to!314 i!635)) lt!113911)))

(declare-fun bs!5461 () Bool)

(assert (= bs!5461 d!22768))

(assert (=> bs!5461 m!113145))

(declare-fun m!113401 () Bool)

(assert (=> bs!5461 m!113401))

(assert (=> b!70619 d!22768))

(declare-fun d!22770 () Bool)

(assert (=> d!22770 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1360 (buf!1741 (_2!3181 lt!113649)))) ((_ sign_extend 32) (currentByte!3455 (_2!3181 lt!113646))) ((_ sign_extend 32) (currentBit!3450 (_2!3181 lt!113646))) lt!113663) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1360 (buf!1741 (_2!3181 lt!113649)))) ((_ sign_extend 32) (currentByte!3455 (_2!3181 lt!113646))) ((_ sign_extend 32) (currentBit!3450 (_2!3181 lt!113646)))) lt!113663))))

(declare-fun bs!5462 () Bool)

(assert (= bs!5462 d!22770))

(declare-fun m!113403 () Bool)

(assert (=> bs!5462 m!113403))

(assert (=> b!70619 d!22770))

(declare-fun b!70788 () Bool)

(declare-fun e!46129 () Bool)

(declare-fun lt!113914 () List!731)

(assert (=> b!70788 (= e!46129 (> (length!359 lt!113914) 0))))

(declare-fun b!70785 () Bool)

(declare-fun e!46128 () tuple2!6146)

(assert (=> b!70785 (= e!46128 (tuple2!6147 Nil!728 (_1!3180 lt!113668)))))

(declare-fun b!70786 () Bool)

(declare-fun lt!113912 () tuple2!6148)

(declare-fun lt!113913 () (_ BitVec 64))

(assert (=> b!70786 (= e!46128 (tuple2!6147 (Cons!727 (_1!3188 lt!113912) (bitStreamReadBitsIntoList!0 (_2!3181 lt!113649) (_2!3188 lt!113912) (bvsub (bvsub to!314 i!635) lt!113913))) (_2!3188 lt!113912)))))

(assert (=> b!70786 (= lt!113912 (readBit!0 (_1!3180 lt!113668)))))

(assert (=> b!70786 (= lt!113913 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!70787 () Bool)

(assert (=> b!70787 (= e!46129 (isEmpty!229 lt!113914))))

(declare-fun d!22772 () Bool)

(assert (=> d!22772 e!46129))

(declare-fun c!5288 () Bool)

(assert (=> d!22772 (= c!5288 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22772 (= lt!113914 (_1!3187 e!46128))))

(declare-fun c!5289 () Bool)

(assert (=> d!22772 (= c!5289 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22772 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22772 (= (bitStreamReadBitsIntoList!0 (_2!3181 lt!113649) (_1!3180 lt!113668) (bvsub to!314 i!635)) lt!113914)))

(assert (= (and d!22772 c!5289) b!70785))

(assert (= (and d!22772 (not c!5289)) b!70786))

(assert (= (and d!22772 c!5288) b!70787))

(assert (= (and d!22772 (not c!5288)) b!70788))

(declare-fun m!113405 () Bool)

(assert (=> b!70788 m!113405))

(declare-fun m!113407 () Bool)

(assert (=> b!70786 m!113407))

(declare-fun m!113409 () Bool)

(assert (=> b!70786 m!113409))

(declare-fun m!113411 () Bool)

(assert (=> b!70787 m!113411))

(assert (=> b!70619 d!22772))

(declare-fun d!22774 () Bool)

(declare-fun e!46143 () Bool)

(assert (=> d!22774 e!46143))

(declare-fun res!58408 () Bool)

(assert (=> d!22774 (=> (not res!58408) (not e!46143))))

(declare-fun lt!113965 () tuple2!6132)

(assert (=> d!22774 (= res!58408 (isPrefixOf!0 (_1!3180 lt!113965) (_2!3180 lt!113965)))))

(declare-fun lt!113976 () BitStream!2312)

(assert (=> d!22774 (= lt!113965 (tuple2!6133 lt!113976 (_2!3181 lt!113649)))))

(declare-fun lt!113971 () Unit!4725)

(declare-fun lt!113967 () Unit!4725)

(assert (=> d!22774 (= lt!113971 lt!113967)))

(assert (=> d!22774 (isPrefixOf!0 lt!113976 (_2!3181 lt!113649))))

(assert (=> d!22774 (= lt!113967 (lemmaIsPrefixTransitive!0 lt!113976 (_2!3181 lt!113649) (_2!3181 lt!113649)))))

(declare-fun lt!113964 () Unit!4725)

(declare-fun lt!113972 () Unit!4725)

(assert (=> d!22774 (= lt!113964 lt!113972)))

(assert (=> d!22774 (isPrefixOf!0 lt!113976 (_2!3181 lt!113649))))

(assert (=> d!22774 (= lt!113972 (lemmaIsPrefixTransitive!0 lt!113976 (_2!3181 lt!113646) (_2!3181 lt!113649)))))

(declare-fun lt!113970 () Unit!4725)

(declare-fun e!46144 () Unit!4725)

(assert (=> d!22774 (= lt!113970 e!46144)))

(declare-fun c!5292 () Bool)

(assert (=> d!22774 (= c!5292 (not (= (size!1360 (buf!1741 (_2!3181 lt!113646))) #b00000000000000000000000000000000)))))

(declare-fun lt!113975 () Unit!4725)

(declare-fun lt!113960 () Unit!4725)

(assert (=> d!22774 (= lt!113975 lt!113960)))

(assert (=> d!22774 (isPrefixOf!0 (_2!3181 lt!113649) (_2!3181 lt!113649))))

(assert (=> d!22774 (= lt!113960 (lemmaIsPrefixRefl!0 (_2!3181 lt!113649)))))

(declare-fun lt!113959 () Unit!4725)

(declare-fun lt!113962 () Unit!4725)

(assert (=> d!22774 (= lt!113959 lt!113962)))

(assert (=> d!22774 (= lt!113962 (lemmaIsPrefixRefl!0 (_2!3181 lt!113649)))))

(declare-fun lt!113958 () Unit!4725)

(declare-fun lt!113968 () Unit!4725)

(assert (=> d!22774 (= lt!113958 lt!113968)))

(assert (=> d!22774 (isPrefixOf!0 lt!113976 lt!113976)))

(assert (=> d!22774 (= lt!113968 (lemmaIsPrefixRefl!0 lt!113976))))

(declare-fun lt!113966 () Unit!4725)

(declare-fun lt!113973 () Unit!4725)

(assert (=> d!22774 (= lt!113966 lt!113973)))

(assert (=> d!22774 (isPrefixOf!0 (_2!3181 lt!113646) (_2!3181 lt!113646))))

(assert (=> d!22774 (= lt!113973 (lemmaIsPrefixRefl!0 (_2!3181 lt!113646)))))

(assert (=> d!22774 (= lt!113976 (BitStream!2313 (buf!1741 (_2!3181 lt!113649)) (currentByte!3455 (_2!3181 lt!113646)) (currentBit!3450 (_2!3181 lt!113646))))))

(assert (=> d!22774 (isPrefixOf!0 (_2!3181 lt!113646) (_2!3181 lt!113649))))

(assert (=> d!22774 (= (reader!0 (_2!3181 lt!113646) (_2!3181 lt!113649)) lt!113965)))

(declare-fun b!70811 () Bool)

(declare-fun Unit!4737 () Unit!4725)

(assert (=> b!70811 (= e!46144 Unit!4737)))

(declare-fun b!70812 () Bool)

(declare-fun res!58410 () Bool)

(assert (=> b!70812 (=> (not res!58410) (not e!46143))))

(assert (=> b!70812 (= res!58410 (isPrefixOf!0 (_1!3180 lt!113965) (_2!3181 lt!113646)))))

(declare-fun lt!113969 () (_ BitVec 64))

(declare-fun lt!113961 () (_ BitVec 64))

(declare-fun b!70813 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!2312 (_ BitVec 64)) BitStream!2312)

(assert (=> b!70813 (= e!46143 (= (_1!3180 lt!113965) (withMovedBitIndex!0 (_2!3180 lt!113965) (bvsub lt!113969 lt!113961))))))

(assert (=> b!70813 (or (= (bvand lt!113969 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!113961 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!113969 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!113969 lt!113961) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!70813 (= lt!113961 (bitIndex!0 (size!1360 (buf!1741 (_2!3181 lt!113649))) (currentByte!3455 (_2!3181 lt!113649)) (currentBit!3450 (_2!3181 lt!113649))))))

(assert (=> b!70813 (= lt!113969 (bitIndex!0 (size!1360 (buf!1741 (_2!3181 lt!113646))) (currentByte!3455 (_2!3181 lt!113646)) (currentBit!3450 (_2!3181 lt!113646))))))

(declare-fun b!70814 () Bool)

(declare-fun lt!113963 () Unit!4725)

(assert (=> b!70814 (= e!46144 lt!113963)))

(declare-fun lt!113974 () (_ BitVec 64))

(assert (=> b!70814 (= lt!113974 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!113977 () (_ BitVec 64))

(assert (=> b!70814 (= lt!113977 (bitIndex!0 (size!1360 (buf!1741 (_2!3181 lt!113646))) (currentByte!3455 (_2!3181 lt!113646)) (currentBit!3450 (_2!3181 lt!113646))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2921 array!2921 (_ BitVec 64) (_ BitVec 64)) Unit!4725)

(assert (=> b!70814 (= lt!113963 (arrayBitRangesEqSymmetric!0 (buf!1741 (_2!3181 lt!113646)) (buf!1741 (_2!3181 lt!113649)) lt!113974 lt!113977))))

(assert (=> b!70814 (arrayBitRangesEq!0 (buf!1741 (_2!3181 lt!113649)) (buf!1741 (_2!3181 lt!113646)) lt!113974 lt!113977)))

(declare-fun b!70815 () Bool)

(declare-fun res!58409 () Bool)

(assert (=> b!70815 (=> (not res!58409) (not e!46143))))

(assert (=> b!70815 (= res!58409 (isPrefixOf!0 (_2!3180 lt!113965) (_2!3181 lt!113649)))))

(assert (= (and d!22774 c!5292) b!70814))

(assert (= (and d!22774 (not c!5292)) b!70811))

(assert (= (and d!22774 res!58408) b!70812))

(assert (= (and b!70812 res!58410) b!70815))

(assert (= (and b!70815 res!58409) b!70813))

(declare-fun m!113421 () Bool)

(assert (=> d!22774 m!113421))

(declare-fun m!113423 () Bool)

(assert (=> d!22774 m!113423))

(declare-fun m!113425 () Bool)

(assert (=> d!22774 m!113425))

(declare-fun m!113427 () Bool)

(assert (=> d!22774 m!113427))

(declare-fun m!113429 () Bool)

(assert (=> d!22774 m!113429))

(declare-fun m!113431 () Bool)

(assert (=> d!22774 m!113431))

(declare-fun m!113433 () Bool)

(assert (=> d!22774 m!113433))

(declare-fun m!113435 () Bool)

(assert (=> d!22774 m!113435))

(assert (=> d!22774 m!113135))

(declare-fun m!113437 () Bool)

(assert (=> d!22774 m!113437))

(declare-fun m!113439 () Bool)

(assert (=> d!22774 m!113439))

(declare-fun m!113441 () Bool)

(assert (=> b!70815 m!113441))

(assert (=> b!70814 m!113121))

(declare-fun m!113443 () Bool)

(assert (=> b!70814 m!113443))

(declare-fun m!113445 () Bool)

(assert (=> b!70814 m!113445))

(declare-fun m!113447 () Bool)

(assert (=> b!70812 m!113447))

(declare-fun m!113449 () Bool)

(assert (=> b!70813 m!113449))

(assert (=> b!70813 m!113109))

(assert (=> b!70813 m!113121))

(assert (=> b!70619 d!22774))

(declare-fun d!22784 () Bool)

(declare-fun e!46145 () Bool)

(assert (=> d!22784 e!46145))

(declare-fun res!58411 () Bool)

(assert (=> d!22784 (=> (not res!58411) (not e!46145))))

(declare-fun lt!113985 () tuple2!6132)

(assert (=> d!22784 (= res!58411 (isPrefixOf!0 (_1!3180 lt!113985) (_2!3180 lt!113985)))))

(declare-fun lt!113996 () BitStream!2312)

(assert (=> d!22784 (= lt!113985 (tuple2!6133 lt!113996 (_2!3181 lt!113649)))))

(declare-fun lt!113991 () Unit!4725)

(declare-fun lt!113987 () Unit!4725)

(assert (=> d!22784 (= lt!113991 lt!113987)))

(assert (=> d!22784 (isPrefixOf!0 lt!113996 (_2!3181 lt!113649))))

(assert (=> d!22784 (= lt!113987 (lemmaIsPrefixTransitive!0 lt!113996 (_2!3181 lt!113649) (_2!3181 lt!113649)))))

(declare-fun lt!113984 () Unit!4725)

(declare-fun lt!113992 () Unit!4725)

(assert (=> d!22784 (= lt!113984 lt!113992)))

(assert (=> d!22784 (isPrefixOf!0 lt!113996 (_2!3181 lt!113649))))

(assert (=> d!22784 (= lt!113992 (lemmaIsPrefixTransitive!0 lt!113996 thiss!1379 (_2!3181 lt!113649)))))

(declare-fun lt!113990 () Unit!4725)

(declare-fun e!46146 () Unit!4725)

(assert (=> d!22784 (= lt!113990 e!46146)))

(declare-fun c!5293 () Bool)

(assert (=> d!22784 (= c!5293 (not (= (size!1360 (buf!1741 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!113995 () Unit!4725)

(declare-fun lt!113980 () Unit!4725)

(assert (=> d!22784 (= lt!113995 lt!113980)))

(assert (=> d!22784 (isPrefixOf!0 (_2!3181 lt!113649) (_2!3181 lt!113649))))

(assert (=> d!22784 (= lt!113980 (lemmaIsPrefixRefl!0 (_2!3181 lt!113649)))))

(declare-fun lt!113979 () Unit!4725)

(declare-fun lt!113982 () Unit!4725)

(assert (=> d!22784 (= lt!113979 lt!113982)))

(assert (=> d!22784 (= lt!113982 (lemmaIsPrefixRefl!0 (_2!3181 lt!113649)))))

(declare-fun lt!113978 () Unit!4725)

(declare-fun lt!113988 () Unit!4725)

(assert (=> d!22784 (= lt!113978 lt!113988)))

(assert (=> d!22784 (isPrefixOf!0 lt!113996 lt!113996)))

(assert (=> d!22784 (= lt!113988 (lemmaIsPrefixRefl!0 lt!113996))))

(declare-fun lt!113986 () Unit!4725)

(declare-fun lt!113993 () Unit!4725)

(assert (=> d!22784 (= lt!113986 lt!113993)))

(assert (=> d!22784 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!22784 (= lt!113993 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!22784 (= lt!113996 (BitStream!2313 (buf!1741 (_2!3181 lt!113649)) (currentByte!3455 thiss!1379) (currentBit!3450 thiss!1379)))))

(assert (=> d!22784 (isPrefixOf!0 thiss!1379 (_2!3181 lt!113649))))

(assert (=> d!22784 (= (reader!0 thiss!1379 (_2!3181 lt!113649)) lt!113985)))

(declare-fun b!70816 () Bool)

(declare-fun Unit!4738 () Unit!4725)

(assert (=> b!70816 (= e!46146 Unit!4738)))

(declare-fun b!70817 () Bool)

(declare-fun res!58413 () Bool)

(assert (=> b!70817 (=> (not res!58413) (not e!46145))))

(assert (=> b!70817 (= res!58413 (isPrefixOf!0 (_1!3180 lt!113985) thiss!1379))))

(declare-fun lt!113989 () (_ BitVec 64))

(declare-fun b!70818 () Bool)

(declare-fun lt!113981 () (_ BitVec 64))

(assert (=> b!70818 (= e!46145 (= (_1!3180 lt!113985) (withMovedBitIndex!0 (_2!3180 lt!113985) (bvsub lt!113989 lt!113981))))))

(assert (=> b!70818 (or (= (bvand lt!113989 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!113981 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!113989 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!113989 lt!113981) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!70818 (= lt!113981 (bitIndex!0 (size!1360 (buf!1741 (_2!3181 lt!113649))) (currentByte!3455 (_2!3181 lt!113649)) (currentBit!3450 (_2!3181 lt!113649))))))

(assert (=> b!70818 (= lt!113989 (bitIndex!0 (size!1360 (buf!1741 thiss!1379)) (currentByte!3455 thiss!1379) (currentBit!3450 thiss!1379)))))

(declare-fun b!70819 () Bool)

(declare-fun lt!113983 () Unit!4725)

(assert (=> b!70819 (= e!46146 lt!113983)))

(declare-fun lt!113994 () (_ BitVec 64))

(assert (=> b!70819 (= lt!113994 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!113997 () (_ BitVec 64))

(assert (=> b!70819 (= lt!113997 (bitIndex!0 (size!1360 (buf!1741 thiss!1379)) (currentByte!3455 thiss!1379) (currentBit!3450 thiss!1379)))))

(assert (=> b!70819 (= lt!113983 (arrayBitRangesEqSymmetric!0 (buf!1741 thiss!1379) (buf!1741 (_2!3181 lt!113649)) lt!113994 lt!113997))))

(assert (=> b!70819 (arrayBitRangesEq!0 (buf!1741 (_2!3181 lt!113649)) (buf!1741 thiss!1379) lt!113994 lt!113997)))

(declare-fun b!70820 () Bool)

(declare-fun res!58412 () Bool)

(assert (=> b!70820 (=> (not res!58412) (not e!46145))))

(assert (=> b!70820 (= res!58412 (isPrefixOf!0 (_2!3180 lt!113985) (_2!3181 lt!113649)))))

(assert (= (and d!22784 c!5293) b!70819))

(assert (= (and d!22784 (not c!5293)) b!70816))

(assert (= (and d!22784 res!58411) b!70817))

(assert (= (and b!70817 res!58413) b!70820))

(assert (= (and b!70820 res!58412) b!70818))

(declare-fun m!113451 () Bool)

(assert (=> d!22784 m!113451))

(declare-fun m!113453 () Bool)

(assert (=> d!22784 m!113453))

(declare-fun m!113455 () Bool)

(assert (=> d!22784 m!113455))

(declare-fun m!113457 () Bool)

(assert (=> d!22784 m!113457))

(declare-fun m!113459 () Bool)

(assert (=> d!22784 m!113459))

(assert (=> d!22784 m!113077))

(assert (=> d!22784 m!113433))

(assert (=> d!22784 m!113075))

(assert (=> d!22784 m!113129))

(declare-fun m!113461 () Bool)

(assert (=> d!22784 m!113461))

(assert (=> d!22784 m!113439))

(declare-fun m!113463 () Bool)

(assert (=> b!70820 m!113463))

(assert (=> b!70819 m!113079))

(declare-fun m!113465 () Bool)

(assert (=> b!70819 m!113465))

(declare-fun m!113467 () Bool)

(assert (=> b!70819 m!113467))

(declare-fun m!113469 () Bool)

(assert (=> b!70817 m!113469))

(declare-fun m!113471 () Bool)

(assert (=> b!70818 m!113471))

(assert (=> b!70818 m!113109))

(assert (=> b!70818 m!113079))

(assert (=> b!70619 d!22784))

(declare-fun d!22786 () Bool)

(declare-fun e!46149 () Bool)

(assert (=> d!22786 e!46149))

(declare-fun res!58418 () Bool)

(assert (=> d!22786 (=> (not res!58418) (not e!46149))))

(declare-fun lt!114014 () (_ BitVec 64))

(declare-fun lt!114015 () (_ BitVec 64))

(declare-fun lt!114013 () (_ BitVec 64))

(assert (=> d!22786 (= res!58418 (= lt!114013 (bvsub lt!114015 lt!114014)))))

(assert (=> d!22786 (or (= (bvand lt!114015 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!114014 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!114015 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!114015 lt!114014) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!22786 (= lt!114014 (remainingBits!0 ((_ sign_extend 32) (size!1360 (buf!1741 (_2!3181 lt!113646)))) ((_ sign_extend 32) (currentByte!3455 (_2!3181 lt!113646))) ((_ sign_extend 32) (currentBit!3450 (_2!3181 lt!113646)))))))

(declare-fun lt!114012 () (_ BitVec 64))

(declare-fun lt!114010 () (_ BitVec 64))

(assert (=> d!22786 (= lt!114015 (bvmul lt!114012 lt!114010))))

(assert (=> d!22786 (or (= lt!114012 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!114010 (bvsdiv (bvmul lt!114012 lt!114010) lt!114012)))))

(assert (=> d!22786 (= lt!114010 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!22786 (= lt!114012 ((_ sign_extend 32) (size!1360 (buf!1741 (_2!3181 lt!113646)))))))

(assert (=> d!22786 (= lt!114013 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3455 (_2!3181 lt!113646))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3450 (_2!3181 lt!113646)))))))

(assert (=> d!22786 (invariant!0 (currentBit!3450 (_2!3181 lt!113646)) (currentByte!3455 (_2!3181 lt!113646)) (size!1360 (buf!1741 (_2!3181 lt!113646))))))

(assert (=> d!22786 (= (bitIndex!0 (size!1360 (buf!1741 (_2!3181 lt!113646))) (currentByte!3455 (_2!3181 lt!113646)) (currentBit!3450 (_2!3181 lt!113646))) lt!114013)))

(declare-fun b!70825 () Bool)

(declare-fun res!58419 () Bool)

(assert (=> b!70825 (=> (not res!58419) (not e!46149))))

(assert (=> b!70825 (= res!58419 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!114013))))

(declare-fun b!70826 () Bool)

(declare-fun lt!114011 () (_ BitVec 64))

(assert (=> b!70826 (= e!46149 (bvsle lt!114013 (bvmul lt!114011 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!70826 (or (= lt!114011 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!114011 #b0000000000000000000000000000000000000000000000000000000000001000) lt!114011)))))

(assert (=> b!70826 (= lt!114011 ((_ sign_extend 32) (size!1360 (buf!1741 (_2!3181 lt!113646)))))))

(assert (= (and d!22786 res!58418) b!70825))

(assert (= (and b!70825 res!58419) b!70826))

(assert (=> d!22786 m!113341))

(assert (=> d!22786 m!113081))

(assert (=> b!70620 d!22786))

(declare-fun d!22788 () Bool)

(declare-fun res!58421 () Bool)

(declare-fun e!46151 () Bool)

(assert (=> d!22788 (=> (not res!58421) (not e!46151))))

(assert (=> d!22788 (= res!58421 (= (size!1360 (buf!1741 thiss!1379)) (size!1360 (buf!1741 thiss!1379))))))

(assert (=> d!22788 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!46151)))

(declare-fun b!70827 () Bool)

(declare-fun res!58420 () Bool)

(assert (=> b!70827 (=> (not res!58420) (not e!46151))))

(assert (=> b!70827 (= res!58420 (bvsle (bitIndex!0 (size!1360 (buf!1741 thiss!1379)) (currentByte!3455 thiss!1379) (currentBit!3450 thiss!1379)) (bitIndex!0 (size!1360 (buf!1741 thiss!1379)) (currentByte!3455 thiss!1379) (currentBit!3450 thiss!1379))))))

(declare-fun b!70828 () Bool)

(declare-fun e!46150 () Bool)

(assert (=> b!70828 (= e!46151 e!46150)))

(declare-fun res!58422 () Bool)

(assert (=> b!70828 (=> res!58422 e!46150)))

(assert (=> b!70828 (= res!58422 (= (size!1360 (buf!1741 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!70829 () Bool)

(assert (=> b!70829 (= e!46150 (arrayBitRangesEq!0 (buf!1741 thiss!1379) (buf!1741 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1360 (buf!1741 thiss!1379)) (currentByte!3455 thiss!1379) (currentBit!3450 thiss!1379))))))

(assert (= (and d!22788 res!58421) b!70827))

(assert (= (and b!70827 res!58420) b!70828))

(assert (= (and b!70828 (not res!58422)) b!70829))

(assert (=> b!70827 m!113079))

(assert (=> b!70827 m!113079))

(assert (=> b!70829 m!113079))

(assert (=> b!70829 m!113079))

(declare-fun m!113473 () Bool)

(assert (=> b!70829 m!113473))

(assert (=> b!70631 d!22788))

(declare-fun d!22790 () Bool)

(assert (=> d!22790 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!114018 () Unit!4725)

(declare-fun choose!11 (BitStream!2312) Unit!4725)

(assert (=> d!22790 (= lt!114018 (choose!11 thiss!1379))))

(assert (=> d!22790 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!114018)))

(declare-fun bs!5465 () Bool)

(assert (= bs!5465 d!22790))

(assert (=> bs!5465 m!113075))

(declare-fun m!113475 () Bool)

(assert (=> bs!5465 m!113475))

(assert (=> b!70631 d!22790))

(declare-fun d!22792 () Bool)

(declare-fun e!46152 () Bool)

(assert (=> d!22792 e!46152))

(declare-fun res!58423 () Bool)

(assert (=> d!22792 (=> (not res!58423) (not e!46152))))

(declare-fun lt!114024 () (_ BitVec 64))

(declare-fun lt!114023 () (_ BitVec 64))

(declare-fun lt!114022 () (_ BitVec 64))

(assert (=> d!22792 (= res!58423 (= lt!114022 (bvsub lt!114024 lt!114023)))))

(assert (=> d!22792 (or (= (bvand lt!114024 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!114023 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!114024 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!114024 lt!114023) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!22792 (= lt!114023 (remainingBits!0 ((_ sign_extend 32) (size!1360 (buf!1741 thiss!1379))) ((_ sign_extend 32) (currentByte!3455 thiss!1379)) ((_ sign_extend 32) (currentBit!3450 thiss!1379))))))

(declare-fun lt!114021 () (_ BitVec 64))

(declare-fun lt!114019 () (_ BitVec 64))

(assert (=> d!22792 (= lt!114024 (bvmul lt!114021 lt!114019))))

(assert (=> d!22792 (or (= lt!114021 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!114019 (bvsdiv (bvmul lt!114021 lt!114019) lt!114021)))))

(assert (=> d!22792 (= lt!114019 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!22792 (= lt!114021 ((_ sign_extend 32) (size!1360 (buf!1741 thiss!1379))))))

(assert (=> d!22792 (= lt!114022 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3455 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3450 thiss!1379))))))

(assert (=> d!22792 (invariant!0 (currentBit!3450 thiss!1379) (currentByte!3455 thiss!1379) (size!1360 (buf!1741 thiss!1379)))))

(assert (=> d!22792 (= (bitIndex!0 (size!1360 (buf!1741 thiss!1379)) (currentByte!3455 thiss!1379) (currentBit!3450 thiss!1379)) lt!114022)))

(declare-fun b!70830 () Bool)

(declare-fun res!58424 () Bool)

(assert (=> b!70830 (=> (not res!58424) (not e!46152))))

(assert (=> b!70830 (= res!58424 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!114022))))

(declare-fun b!70831 () Bool)

(declare-fun lt!114020 () (_ BitVec 64))

(assert (=> b!70831 (= e!46152 (bvsle lt!114022 (bvmul lt!114020 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!70831 (or (= lt!114020 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!114020 #b0000000000000000000000000000000000000000000000000000000000001000) lt!114020)))))

(assert (=> b!70831 (= lt!114020 ((_ sign_extend 32) (size!1360 (buf!1741 thiss!1379))))))

(assert (= (and d!22792 res!58423) b!70830))

(assert (= (and b!70830 res!58424) b!70831))

(declare-fun m!113477 () Bool)

(assert (=> d!22792 m!113477))

(assert (=> d!22792 m!113377))

(assert (=> b!70631 d!22792))

(declare-fun d!22794 () Bool)

(declare-fun lt!114027 () tuple2!6148)

(assert (=> d!22794 (= lt!114027 (readBit!0 (_1!3180 lt!113668)))))

(assert (=> d!22794 (= (readBitPure!0 (_1!3180 lt!113668)) (tuple2!6137 (_2!3188 lt!114027) (_1!3188 lt!114027)))))

(declare-fun bs!5466 () Bool)

(assert (= bs!5466 d!22794))

(assert (=> bs!5466 m!113409))

(assert (=> b!70632 d!22794))

(declare-fun d!22796 () Bool)

(assert (=> d!22796 (= (head!550 lt!113651) (h!846 lt!113651))))

(assert (=> b!70621 d!22796))

(declare-fun d!22798 () Bool)

(assert (=> d!22798 (= (bitAt!0 (buf!1741 (_1!3180 lt!113657)) lt!113660) (not (= (bvand ((_ sign_extend 24) (select (arr!1945 (buf!1741 (_1!3180 lt!113657))) ((_ extract 31 0) (bvsdiv lt!113660 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!113660 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5467 () Bool)

(assert (= bs!5467 d!22798))

(declare-fun m!113479 () Bool)

(assert (=> bs!5467 m!113479))

(assert (=> bs!5467 m!113381))

(assert (=> b!70612 d!22798))

(declare-fun d!22800 () Bool)

(assert (=> d!22800 (= (bitAt!0 (buf!1741 (_1!3180 lt!113668)) lt!113660) (not (= (bvand ((_ sign_extend 24) (select (arr!1945 (buf!1741 (_1!3180 lt!113668))) ((_ extract 31 0) (bvsdiv lt!113660 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!113660 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5468 () Bool)

(assert (= bs!5468 d!22800))

(declare-fun m!113481 () Bool)

(assert (=> bs!5468 m!113481))

(assert (=> bs!5468 m!113381))

(assert (=> b!70612 d!22800))

(declare-fun d!22802 () Bool)

(assert (=> d!22802 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1360 (buf!1741 thiss!1379))) ((_ sign_extend 32) (currentByte!3455 thiss!1379)) ((_ sign_extend 32) (currentBit!3450 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1360 (buf!1741 thiss!1379))) ((_ sign_extend 32) (currentByte!3455 thiss!1379)) ((_ sign_extend 32) (currentBit!3450 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5469 () Bool)

(assert (= bs!5469 d!22802))

(assert (=> bs!5469 m!113477))

(assert (=> b!70633 d!22802))

(declare-fun d!22804 () Bool)

(assert (=> d!22804 (= (invariant!0 (currentBit!3450 (_2!3181 lt!113646)) (currentByte!3455 (_2!3181 lt!113646)) (size!1360 (buf!1741 (_2!3181 lt!113649)))) (and (bvsge (currentBit!3450 (_2!3181 lt!113646)) #b00000000000000000000000000000000) (bvslt (currentBit!3450 (_2!3181 lt!113646)) #b00000000000000000000000000001000) (bvsge (currentByte!3455 (_2!3181 lt!113646)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3455 (_2!3181 lt!113646)) (size!1360 (buf!1741 (_2!3181 lt!113649)))) (and (= (currentBit!3450 (_2!3181 lt!113646)) #b00000000000000000000000000000000) (= (currentByte!3455 (_2!3181 lt!113646)) (size!1360 (buf!1741 (_2!3181 lt!113649))))))))))

(assert (=> b!70624 d!22804))

(declare-fun d!22806 () Bool)

(assert (=> d!22806 (= (tail!335 lt!113651) (t!1481 lt!113651))))

(assert (=> b!70613 d!22806))

(declare-fun d!22808 () Bool)

(declare-fun e!46155 () Bool)

(assert (=> d!22808 e!46155))

(declare-fun res!58427 () Bool)

(assert (=> d!22808 (=> (not res!58427) (not e!46155))))

(declare-fun lt!114033 () (_ BitVec 64))

(assert (=> d!22808 (= res!58427 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!114033 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!114033) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!22808 (= lt!114033 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!114032 () Unit!4725)

(declare-fun choose!42 (BitStream!2312 BitStream!2312 BitStream!2312 BitStream!2312 (_ BitVec 64) List!731) Unit!4725)

(assert (=> d!22808 (= lt!114032 (choose!42 (_2!3181 lt!113649) (_2!3181 lt!113649) (_1!3180 lt!113668) (_1!3180 lt!113657) (bvsub to!314 i!635) lt!113651))))

(assert (=> d!22808 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22808 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3181 lt!113649) (_2!3181 lt!113649) (_1!3180 lt!113668) (_1!3180 lt!113657) (bvsub to!314 i!635) lt!113651) lt!114032)))

(declare-fun b!70834 () Bool)

(assert (=> b!70834 (= e!46155 (= (bitStreamReadBitsIntoList!0 (_2!3181 lt!113649) (_1!3180 lt!113657) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!335 lt!113651)))))

(assert (= (and d!22808 res!58427) b!70834))

(declare-fun m!113483 () Bool)

(assert (=> d!22808 m!113483))

(declare-fun m!113485 () Bool)

(assert (=> b!70834 m!113485))

(assert (=> b!70834 m!113123))

(assert (=> b!70613 d!22808))

(declare-fun d!22810 () Bool)

(assert (=> d!22810 (= (head!550 (byteArrayBitContentToList!0 (_2!3181 lt!113646) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!846 (byteArrayBitContentToList!0 (_2!3181 lt!113646) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!70614 d!22810))

(declare-fun d!22812 () Bool)

(declare-fun c!5294 () Bool)

(assert (=> d!22812 (= c!5294 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!46156 () List!731)

(assert (=> d!22812 (= (byteArrayBitContentToList!0 (_2!3181 lt!113646) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!46156)))

(declare-fun b!70835 () Bool)

(assert (=> b!70835 (= e!46156 Nil!728)))

(declare-fun b!70836 () Bool)

(assert (=> b!70836 (= e!46156 (Cons!727 (not (= (bvand ((_ sign_extend 24) (select (arr!1945 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3181 lt!113646) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!22812 c!5294) b!70835))

(assert (= (and d!22812 (not c!5294)) b!70836))

(assert (=> b!70836 m!113113))

(assert (=> b!70836 m!113351))

(declare-fun m!113487 () Bool)

(assert (=> b!70836 m!113487))

(assert (=> b!70614 d!22812))

(declare-fun d!22814 () Bool)

(assert (=> d!22814 (= (head!550 (bitStreamReadBitsIntoList!0 (_2!3181 lt!113646) (_1!3180 lt!113659) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!846 (bitStreamReadBitsIntoList!0 (_2!3181 lt!113646) (_1!3180 lt!113659) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!70614 d!22814))

(declare-fun b!70840 () Bool)

(declare-fun e!46158 () Bool)

(declare-fun lt!114036 () List!731)

(assert (=> b!70840 (= e!46158 (> (length!359 lt!114036) 0))))

(declare-fun b!70837 () Bool)

(declare-fun e!46157 () tuple2!6146)

(assert (=> b!70837 (= e!46157 (tuple2!6147 Nil!728 (_1!3180 lt!113659)))))

(declare-fun lt!114034 () tuple2!6148)

(declare-fun b!70838 () Bool)

(declare-fun lt!114035 () (_ BitVec 64))

(assert (=> b!70838 (= e!46157 (tuple2!6147 (Cons!727 (_1!3188 lt!114034) (bitStreamReadBitsIntoList!0 (_2!3181 lt!113646) (_2!3188 lt!114034) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!114035))) (_2!3188 lt!114034)))))

(assert (=> b!70838 (= lt!114034 (readBit!0 (_1!3180 lt!113659)))))

(assert (=> b!70838 (= lt!114035 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!70839 () Bool)

(assert (=> b!70839 (= e!46158 (isEmpty!229 lt!114036))))

(declare-fun d!22816 () Bool)

(assert (=> d!22816 e!46158))

(declare-fun c!5295 () Bool)

(assert (=> d!22816 (= c!5295 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22816 (= lt!114036 (_1!3187 e!46157))))

(declare-fun c!5296 () Bool)

(assert (=> d!22816 (= c!5296 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22816 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22816 (= (bitStreamReadBitsIntoList!0 (_2!3181 lt!113646) (_1!3180 lt!113659) #b0000000000000000000000000000000000000000000000000000000000000001) lt!114036)))

(assert (= (and d!22816 c!5296) b!70837))

(assert (= (and d!22816 (not c!5296)) b!70838))

(assert (= (and d!22816 c!5295) b!70839))

(assert (= (and d!22816 (not c!5295)) b!70840))

(declare-fun m!113489 () Bool)

(assert (=> b!70840 m!113489))

(declare-fun m!113491 () Bool)

(assert (=> b!70838 m!113491))

(declare-fun m!113493 () Bool)

(assert (=> b!70838 m!113493))

(declare-fun m!113495 () Bool)

(assert (=> b!70839 m!113495))

(assert (=> b!70614 d!22816))

(declare-fun d!22818 () Bool)

(declare-fun e!46159 () Bool)

(assert (=> d!22818 e!46159))

(declare-fun res!58428 () Bool)

(assert (=> d!22818 (=> (not res!58428) (not e!46159))))

(declare-fun lt!114042 () (_ BitVec 64))

(declare-fun lt!114041 () (_ BitVec 64))

(declare-fun lt!114040 () (_ BitVec 64))

(assert (=> d!22818 (= res!58428 (= lt!114040 (bvsub lt!114042 lt!114041)))))

(assert (=> d!22818 (or (= (bvand lt!114042 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!114041 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!114042 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!114042 lt!114041) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!22818 (= lt!114041 (remainingBits!0 ((_ sign_extend 32) (size!1360 (buf!1741 (_2!3181 lt!113649)))) ((_ sign_extend 32) (currentByte!3455 (_2!3181 lt!113649))) ((_ sign_extend 32) (currentBit!3450 (_2!3181 lt!113649)))))))

(declare-fun lt!114039 () (_ BitVec 64))

(declare-fun lt!114037 () (_ BitVec 64))

(assert (=> d!22818 (= lt!114042 (bvmul lt!114039 lt!114037))))

(assert (=> d!22818 (or (= lt!114039 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!114037 (bvsdiv (bvmul lt!114039 lt!114037) lt!114039)))))

(assert (=> d!22818 (= lt!114037 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!22818 (= lt!114039 ((_ sign_extend 32) (size!1360 (buf!1741 (_2!3181 lt!113649)))))))

(assert (=> d!22818 (= lt!114040 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3455 (_2!3181 lt!113649))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3450 (_2!3181 lt!113649)))))))

(assert (=> d!22818 (invariant!0 (currentBit!3450 (_2!3181 lt!113649)) (currentByte!3455 (_2!3181 lt!113649)) (size!1360 (buf!1741 (_2!3181 lt!113649))))))

(assert (=> d!22818 (= (bitIndex!0 (size!1360 (buf!1741 (_2!3181 lt!113649))) (currentByte!3455 (_2!3181 lt!113649)) (currentBit!3450 (_2!3181 lt!113649))) lt!114040)))

(declare-fun b!70841 () Bool)

(declare-fun res!58429 () Bool)

(assert (=> b!70841 (=> (not res!58429) (not e!46159))))

(assert (=> b!70841 (= res!58429 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!114040))))

(declare-fun b!70842 () Bool)

(declare-fun lt!114038 () (_ BitVec 64))

(assert (=> b!70842 (= e!46159 (bvsle lt!114040 (bvmul lt!114038 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!70842 (or (= lt!114038 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!114038 #b0000000000000000000000000000000000000000000000000000000000001000) lt!114038)))))

(assert (=> b!70842 (= lt!114038 ((_ sign_extend 32) (size!1360 (buf!1741 (_2!3181 lt!113649)))))))

(assert (= (and d!22818 res!58428) b!70841))

(assert (= (and b!70841 res!58429) b!70842))

(declare-fun m!113497 () Bool)

(assert (=> d!22818 m!113497))

(assert (=> d!22818 m!113105))

(assert (=> b!70625 d!22818))

(declare-fun d!22820 () Bool)

(assert (=> d!22820 (= (invariant!0 (currentBit!3450 (_2!3181 lt!113649)) (currentByte!3455 (_2!3181 lt!113649)) (size!1360 (buf!1741 (_2!3181 lt!113649)))) (and (bvsge (currentBit!3450 (_2!3181 lt!113649)) #b00000000000000000000000000000000) (bvslt (currentBit!3450 (_2!3181 lt!113649)) #b00000000000000000000000000001000) (bvsge (currentByte!3455 (_2!3181 lt!113649)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3455 (_2!3181 lt!113649)) (size!1360 (buf!1741 (_2!3181 lt!113649)))) (and (= (currentBit!3450 (_2!3181 lt!113649)) #b00000000000000000000000000000000) (= (currentByte!3455 (_2!3181 lt!113649)) (size!1360 (buf!1741 (_2!3181 lt!113649))))))))))

(assert (=> b!70626 d!22820))

(declare-fun d!22822 () Bool)

(assert (=> d!22822 (= (array_inv!1215 (buf!1741 thiss!1379)) (bvsge (size!1360 (buf!1741 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!70615 d!22822))

(declare-fun d!22824 () Bool)

(assert (=> d!22824 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1360 (buf!1741 (_2!3181 lt!113646)))) ((_ sign_extend 32) (currentByte!3455 thiss!1379)) ((_ sign_extend 32) (currentBit!3450 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1360 (buf!1741 (_2!3181 lt!113646)))) ((_ sign_extend 32) (currentByte!3455 thiss!1379)) ((_ sign_extend 32) (currentBit!3450 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!5470 () Bool)

(assert (= bs!5470 d!22824))

(declare-fun m!113499 () Bool)

(assert (=> bs!5470 m!113499))

(assert (=> b!70616 d!22824))

(declare-fun d!22826 () Bool)

(declare-fun e!46160 () Bool)

(assert (=> d!22826 e!46160))

(declare-fun res!58430 () Bool)

(assert (=> d!22826 (=> (not res!58430) (not e!46160))))

(declare-fun lt!114050 () tuple2!6132)

(assert (=> d!22826 (= res!58430 (isPrefixOf!0 (_1!3180 lt!114050) (_2!3180 lt!114050)))))

(declare-fun lt!114061 () BitStream!2312)

(assert (=> d!22826 (= lt!114050 (tuple2!6133 lt!114061 (_2!3181 lt!113646)))))

(declare-fun lt!114056 () Unit!4725)

(declare-fun lt!114052 () Unit!4725)

(assert (=> d!22826 (= lt!114056 lt!114052)))

(assert (=> d!22826 (isPrefixOf!0 lt!114061 (_2!3181 lt!113646))))

(assert (=> d!22826 (= lt!114052 (lemmaIsPrefixTransitive!0 lt!114061 (_2!3181 lt!113646) (_2!3181 lt!113646)))))

(declare-fun lt!114049 () Unit!4725)

(declare-fun lt!114057 () Unit!4725)

(assert (=> d!22826 (= lt!114049 lt!114057)))

(assert (=> d!22826 (isPrefixOf!0 lt!114061 (_2!3181 lt!113646))))

(assert (=> d!22826 (= lt!114057 (lemmaIsPrefixTransitive!0 lt!114061 thiss!1379 (_2!3181 lt!113646)))))

(declare-fun lt!114055 () Unit!4725)

(declare-fun e!46161 () Unit!4725)

(assert (=> d!22826 (= lt!114055 e!46161)))

(declare-fun c!5297 () Bool)

(assert (=> d!22826 (= c!5297 (not (= (size!1360 (buf!1741 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!114060 () Unit!4725)

(declare-fun lt!114045 () Unit!4725)

(assert (=> d!22826 (= lt!114060 lt!114045)))

(assert (=> d!22826 (isPrefixOf!0 (_2!3181 lt!113646) (_2!3181 lt!113646))))

(assert (=> d!22826 (= lt!114045 (lemmaIsPrefixRefl!0 (_2!3181 lt!113646)))))

(declare-fun lt!114044 () Unit!4725)

(declare-fun lt!114047 () Unit!4725)

(assert (=> d!22826 (= lt!114044 lt!114047)))

(assert (=> d!22826 (= lt!114047 (lemmaIsPrefixRefl!0 (_2!3181 lt!113646)))))

(declare-fun lt!114043 () Unit!4725)

(declare-fun lt!114053 () Unit!4725)

(assert (=> d!22826 (= lt!114043 lt!114053)))

(assert (=> d!22826 (isPrefixOf!0 lt!114061 lt!114061)))

(assert (=> d!22826 (= lt!114053 (lemmaIsPrefixRefl!0 lt!114061))))

(declare-fun lt!114051 () Unit!4725)

(declare-fun lt!114058 () Unit!4725)

(assert (=> d!22826 (= lt!114051 lt!114058)))

(assert (=> d!22826 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!22826 (= lt!114058 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!22826 (= lt!114061 (BitStream!2313 (buf!1741 (_2!3181 lt!113646)) (currentByte!3455 thiss!1379) (currentBit!3450 thiss!1379)))))

(assert (=> d!22826 (isPrefixOf!0 thiss!1379 (_2!3181 lt!113646))))

(assert (=> d!22826 (= (reader!0 thiss!1379 (_2!3181 lt!113646)) lt!114050)))

(declare-fun b!70843 () Bool)

(declare-fun Unit!4740 () Unit!4725)

(assert (=> b!70843 (= e!46161 Unit!4740)))

(declare-fun b!70844 () Bool)

(declare-fun res!58432 () Bool)

(assert (=> b!70844 (=> (not res!58432) (not e!46160))))

(assert (=> b!70844 (= res!58432 (isPrefixOf!0 (_1!3180 lt!114050) thiss!1379))))

(declare-fun lt!114046 () (_ BitVec 64))

(declare-fun b!70845 () Bool)

(declare-fun lt!114054 () (_ BitVec 64))

(assert (=> b!70845 (= e!46160 (= (_1!3180 lt!114050) (withMovedBitIndex!0 (_2!3180 lt!114050) (bvsub lt!114054 lt!114046))))))

(assert (=> b!70845 (or (= (bvand lt!114054 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!114046 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!114054 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!114054 lt!114046) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!70845 (= lt!114046 (bitIndex!0 (size!1360 (buf!1741 (_2!3181 lt!113646))) (currentByte!3455 (_2!3181 lt!113646)) (currentBit!3450 (_2!3181 lt!113646))))))

(assert (=> b!70845 (= lt!114054 (bitIndex!0 (size!1360 (buf!1741 thiss!1379)) (currentByte!3455 thiss!1379) (currentBit!3450 thiss!1379)))))

(declare-fun b!70846 () Bool)

(declare-fun lt!114048 () Unit!4725)

(assert (=> b!70846 (= e!46161 lt!114048)))

(declare-fun lt!114059 () (_ BitVec 64))

(assert (=> b!70846 (= lt!114059 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!114062 () (_ BitVec 64))

(assert (=> b!70846 (= lt!114062 (bitIndex!0 (size!1360 (buf!1741 thiss!1379)) (currentByte!3455 thiss!1379) (currentBit!3450 thiss!1379)))))

(assert (=> b!70846 (= lt!114048 (arrayBitRangesEqSymmetric!0 (buf!1741 thiss!1379) (buf!1741 (_2!3181 lt!113646)) lt!114059 lt!114062))))

(assert (=> b!70846 (arrayBitRangesEq!0 (buf!1741 (_2!3181 lt!113646)) (buf!1741 thiss!1379) lt!114059 lt!114062)))

(declare-fun b!70847 () Bool)

(declare-fun res!58431 () Bool)

(assert (=> b!70847 (=> (not res!58431) (not e!46160))))

(assert (=> b!70847 (= res!58431 (isPrefixOf!0 (_2!3180 lt!114050) (_2!3181 lt!113646)))))

(assert (= (and d!22826 c!5297) b!70846))

(assert (= (and d!22826 (not c!5297)) b!70843))

(assert (= (and d!22826 res!58430) b!70844))

(assert (= (and b!70844 res!58432) b!70847))

(assert (= (and b!70847 res!58431) b!70845))

(declare-fun m!113501 () Bool)

(assert (=> d!22826 m!113501))

(declare-fun m!113503 () Bool)

(assert (=> d!22826 m!113503))

(declare-fun m!113505 () Bool)

(assert (=> d!22826 m!113505))

(declare-fun m!113507 () Bool)

(assert (=> d!22826 m!113507))

(declare-fun m!113509 () Bool)

(assert (=> d!22826 m!113509))

(assert (=> d!22826 m!113077))

(assert (=> d!22826 m!113435))

(assert (=> d!22826 m!113075))

(assert (=> d!22826 m!113111))

(declare-fun m!113511 () Bool)

(assert (=> d!22826 m!113511))

(assert (=> d!22826 m!113431))

(declare-fun m!113513 () Bool)

(assert (=> b!70847 m!113513))

(assert (=> b!70846 m!113079))

(declare-fun m!113515 () Bool)

(assert (=> b!70846 m!113515))

(declare-fun m!113517 () Bool)

(assert (=> b!70846 m!113517))

(declare-fun m!113519 () Bool)

(assert (=> b!70844 m!113519))

(declare-fun m!113521 () Bool)

(assert (=> b!70845 m!113521))

(assert (=> b!70845 m!113121))

(assert (=> b!70845 m!113079))

(assert (=> b!70616 d!22826))

(declare-fun c!5326 () Bool)

(declare-fun lt!114473 () tuple2!6134)

(declare-fun bm!919 () Bool)

(declare-fun call!922 () tuple2!6132)

(assert (=> bm!919 (= call!922 (reader!0 (_2!3181 lt!113646) (ite c!5326 (_2!3181 lt!114473) (_2!3181 lt!113646))))))

(declare-fun b!70989 () Bool)

(declare-fun res!58520 () Bool)

(declare-fun e!46229 () Bool)

(assert (=> b!70989 (=> (not res!58520) (not e!46229))))

(declare-fun lt!114475 () tuple2!6134)

(assert (=> b!70989 (= res!58520 (invariant!0 (currentBit!3450 (_2!3181 lt!114475)) (currentByte!3455 (_2!3181 lt!114475)) (size!1360 (buf!1741 (_2!3181 lt!114475)))))))

(declare-fun b!70990 () Bool)

(declare-fun res!58517 () Bool)

(assert (=> b!70990 (=> (not res!58517) (not e!46229))))

(assert (=> b!70990 (= res!58517 (= (size!1360 (buf!1741 (_2!3181 lt!114475))) (size!1360 (buf!1741 (_2!3181 lt!113646)))))))

(declare-fun b!70991 () Bool)

(declare-fun e!46228 () tuple2!6134)

(declare-fun Unit!4742 () Unit!4725)

(assert (=> b!70991 (= e!46228 (tuple2!6135 Unit!4742 (_2!3181 lt!113646)))))

(assert (=> b!70991 (= (size!1360 (buf!1741 (_2!3181 lt!113646))) (size!1360 (buf!1741 (_2!3181 lt!113646))))))

(declare-fun lt!114509 () Unit!4725)

(declare-fun Unit!4743 () Unit!4725)

(assert (=> b!70991 (= lt!114509 Unit!4743)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2312 array!2921 array!2921 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!70991 (checkByteArrayBitContent!0 (_2!3181 lt!113646) srcBuffer!2 (_1!3186 (readBits!0 (_1!3180 call!922) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun d!22828 () Bool)

(assert (=> d!22828 e!46229))

(declare-fun res!58522 () Bool)

(assert (=> d!22828 (=> (not res!58522) (not e!46229))))

(declare-fun lt!114487 () (_ BitVec 64))

(assert (=> d!22828 (= res!58522 (= (bitIndex!0 (size!1360 (buf!1741 (_2!3181 lt!114475))) (currentByte!3455 (_2!3181 lt!114475)) (currentBit!3450 (_2!3181 lt!114475))) (bvsub lt!114487 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!22828 (or (= (bvand lt!114487 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!114487 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!114487 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!114511 () (_ BitVec 64))

(assert (=> d!22828 (= lt!114487 (bvadd lt!114511 to!314))))

(assert (=> d!22828 (or (not (= (bvand lt!114511 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!114511 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!114511 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!22828 (= lt!114511 (bitIndex!0 (size!1360 (buf!1741 (_2!3181 lt!113646))) (currentByte!3455 (_2!3181 lt!113646)) (currentBit!3450 (_2!3181 lt!113646))))))

(assert (=> d!22828 (= lt!114475 e!46228)))

(assert (=> d!22828 (= c!5326 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!114505 () Unit!4725)

(declare-fun lt!114479 () Unit!4725)

(assert (=> d!22828 (= lt!114505 lt!114479)))

(assert (=> d!22828 (isPrefixOf!0 (_2!3181 lt!113646) (_2!3181 lt!113646))))

(assert (=> d!22828 (= lt!114479 (lemmaIsPrefixRefl!0 (_2!3181 lt!113646)))))

(declare-fun lt!114483 () (_ BitVec 64))

(assert (=> d!22828 (= lt!114483 (bitIndex!0 (size!1360 (buf!1741 (_2!3181 lt!113646))) (currentByte!3455 (_2!3181 lt!113646)) (currentBit!3450 (_2!3181 lt!113646))))))

(assert (=> d!22828 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22828 (= (appendBitsMSBFirstLoop!0 (_2!3181 lt!113646) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!114475)))

(declare-fun b!70992 () Bool)

(declare-fun lt!114480 () tuple2!6132)

(assert (=> b!70992 (= e!46229 (= (bitStreamReadBitsIntoList!0 (_2!3181 lt!114475) (_1!3180 lt!114480) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!3181 lt!114475) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!70992 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!70992 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!114482 () Unit!4725)

(declare-fun lt!114490 () Unit!4725)

(assert (=> b!70992 (= lt!114482 lt!114490)))

(declare-fun lt!114491 () (_ BitVec 64))

(assert (=> b!70992 (validate_offset_bits!1 ((_ sign_extend 32) (size!1360 (buf!1741 (_2!3181 lt!114475)))) ((_ sign_extend 32) (currentByte!3455 (_2!3181 lt!113646))) ((_ sign_extend 32) (currentBit!3450 (_2!3181 lt!113646))) lt!114491)))

(assert (=> b!70992 (= lt!114490 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3181 lt!113646) (buf!1741 (_2!3181 lt!114475)) lt!114491))))

(declare-fun e!46227 () Bool)

(assert (=> b!70992 e!46227))

(declare-fun res!58521 () Bool)

(assert (=> b!70992 (=> (not res!58521) (not e!46227))))

(assert (=> b!70992 (= res!58521 (and (= (size!1360 (buf!1741 (_2!3181 lt!113646))) (size!1360 (buf!1741 (_2!3181 lt!114475)))) (bvsge lt!114491 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!70992 (= lt!114491 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!70992 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!70992 (= lt!114480 (reader!0 (_2!3181 lt!113646) (_2!3181 lt!114475)))))

(declare-fun b!70993 () Bool)

(assert (=> b!70993 (= e!46227 (validate_offset_bits!1 ((_ sign_extend 32) (size!1360 (buf!1741 (_2!3181 lt!113646)))) ((_ sign_extend 32) (currentByte!3455 (_2!3181 lt!113646))) ((_ sign_extend 32) (currentBit!3450 (_2!3181 lt!113646))) lt!114491))))

(declare-fun b!70994 () Bool)

(declare-fun lt!114506 () tuple2!6134)

(declare-fun Unit!4744 () Unit!4725)

(assert (=> b!70994 (= e!46228 (tuple2!6135 Unit!4744 (_2!3181 lt!114506)))))

(assert (=> b!70994 (= lt!114473 (appendBitFromByte!0 (_2!3181 lt!113646) (select (arr!1945 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!114501 () (_ BitVec 64))

(assert (=> b!70994 (= lt!114501 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!114477 () (_ BitVec 64))

(assert (=> b!70994 (= lt!114477 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!114492 () Unit!4725)

(assert (=> b!70994 (= lt!114492 (validateOffsetBitsIneqLemma!0 (_2!3181 lt!113646) (_2!3181 lt!114473) lt!114501 lt!114477))))

(assert (=> b!70994 (validate_offset_bits!1 ((_ sign_extend 32) (size!1360 (buf!1741 (_2!3181 lt!114473)))) ((_ sign_extend 32) (currentByte!3455 (_2!3181 lt!114473))) ((_ sign_extend 32) (currentBit!3450 (_2!3181 lt!114473))) (bvsub lt!114501 lt!114477))))

(declare-fun lt!114478 () Unit!4725)

(assert (=> b!70994 (= lt!114478 lt!114492)))

(declare-fun lt!114495 () tuple2!6132)

(assert (=> b!70994 (= lt!114495 call!922)))

(declare-fun lt!114493 () (_ BitVec 64))

(assert (=> b!70994 (= lt!114493 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!114499 () Unit!4725)

(assert (=> b!70994 (= lt!114499 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3181 lt!113646) (buf!1741 (_2!3181 lt!114473)) lt!114493))))

(assert (=> b!70994 (validate_offset_bits!1 ((_ sign_extend 32) (size!1360 (buf!1741 (_2!3181 lt!114473)))) ((_ sign_extend 32) (currentByte!3455 (_2!3181 lt!113646))) ((_ sign_extend 32) (currentBit!3450 (_2!3181 lt!113646))) lt!114493)))

(declare-fun lt!114504 () Unit!4725)

(assert (=> b!70994 (= lt!114504 lt!114499)))

(assert (=> b!70994 (= (head!550 (byteArrayBitContentToList!0 (_2!3181 lt!114473) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!550 (bitStreamReadBitsIntoList!0 (_2!3181 lt!114473) (_1!3180 lt!114495) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!114513 () Unit!4725)

(declare-fun Unit!4745 () Unit!4725)

(assert (=> b!70994 (= lt!114513 Unit!4745)))

(assert (=> b!70994 (= lt!114506 (appendBitsMSBFirstLoop!0 (_2!3181 lt!114473) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!114503 () Unit!4725)

(assert (=> b!70994 (= lt!114503 (lemmaIsPrefixTransitive!0 (_2!3181 lt!113646) (_2!3181 lt!114473) (_2!3181 lt!114506)))))

(assert (=> b!70994 (isPrefixOf!0 (_2!3181 lt!113646) (_2!3181 lt!114506))))

(declare-fun lt!114481 () Unit!4725)

(assert (=> b!70994 (= lt!114481 lt!114503)))

(assert (=> b!70994 (= (size!1360 (buf!1741 (_2!3181 lt!114506))) (size!1360 (buf!1741 (_2!3181 lt!113646))))))

(declare-fun lt!114510 () Unit!4725)

(declare-fun Unit!4746 () Unit!4725)

(assert (=> b!70994 (= lt!114510 Unit!4746)))

(assert (=> b!70994 (= (bitIndex!0 (size!1360 (buf!1741 (_2!3181 lt!114506))) (currentByte!3455 (_2!3181 lt!114506)) (currentBit!3450 (_2!3181 lt!114506))) (bvsub (bvadd (bitIndex!0 (size!1360 (buf!1741 (_2!3181 lt!113646))) (currentByte!3455 (_2!3181 lt!113646)) (currentBit!3450 (_2!3181 lt!113646))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!114502 () Unit!4725)

(declare-fun Unit!4747 () Unit!4725)

(assert (=> b!70994 (= lt!114502 Unit!4747)))

(assert (=> b!70994 (= (bitIndex!0 (size!1360 (buf!1741 (_2!3181 lt!114506))) (currentByte!3455 (_2!3181 lt!114506)) (currentBit!3450 (_2!3181 lt!114506))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1360 (buf!1741 (_2!3181 lt!114473))) (currentByte!3455 (_2!3181 lt!114473)) (currentBit!3450 (_2!3181 lt!114473))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!114489 () Unit!4725)

(declare-fun Unit!4748 () Unit!4725)

(assert (=> b!70994 (= lt!114489 Unit!4748)))

(declare-fun lt!114496 () tuple2!6132)

(assert (=> b!70994 (= lt!114496 (reader!0 (_2!3181 lt!113646) (_2!3181 lt!114506)))))

(declare-fun lt!114497 () (_ BitVec 64))

(assert (=> b!70994 (= lt!114497 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!114484 () Unit!4725)

(assert (=> b!70994 (= lt!114484 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3181 lt!113646) (buf!1741 (_2!3181 lt!114506)) lt!114497))))

(assert (=> b!70994 (validate_offset_bits!1 ((_ sign_extend 32) (size!1360 (buf!1741 (_2!3181 lt!114506)))) ((_ sign_extend 32) (currentByte!3455 (_2!3181 lt!113646))) ((_ sign_extend 32) (currentBit!3450 (_2!3181 lt!113646))) lt!114497)))

(declare-fun lt!114514 () Unit!4725)

(assert (=> b!70994 (= lt!114514 lt!114484)))

(declare-fun lt!114471 () tuple2!6132)

(assert (=> b!70994 (= lt!114471 (reader!0 (_2!3181 lt!114473) (_2!3181 lt!114506)))))

(declare-fun lt!114485 () (_ BitVec 64))

(assert (=> b!70994 (= lt!114485 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!114498 () Unit!4725)

(assert (=> b!70994 (= lt!114498 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3181 lt!114473) (buf!1741 (_2!3181 lt!114506)) lt!114485))))

(assert (=> b!70994 (validate_offset_bits!1 ((_ sign_extend 32) (size!1360 (buf!1741 (_2!3181 lt!114506)))) ((_ sign_extend 32) (currentByte!3455 (_2!3181 lt!114473))) ((_ sign_extend 32) (currentBit!3450 (_2!3181 lt!114473))) lt!114485)))

(declare-fun lt!114500 () Unit!4725)

(assert (=> b!70994 (= lt!114500 lt!114498)))

(declare-fun lt!114494 () List!731)

(assert (=> b!70994 (= lt!114494 (byteArrayBitContentToList!0 (_2!3181 lt!114506) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!114507 () List!731)

(assert (=> b!70994 (= lt!114507 (byteArrayBitContentToList!0 (_2!3181 lt!114506) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!114512 () List!731)

(assert (=> b!70994 (= lt!114512 (bitStreamReadBitsIntoList!0 (_2!3181 lt!114506) (_1!3180 lt!114496) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!114508 () List!731)

(assert (=> b!70994 (= lt!114508 (bitStreamReadBitsIntoList!0 (_2!3181 lt!114506) (_1!3180 lt!114471) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!114486 () (_ BitVec 64))

(assert (=> b!70994 (= lt!114486 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!114488 () Unit!4725)

(assert (=> b!70994 (= lt!114488 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3181 lt!114506) (_2!3181 lt!114506) (_1!3180 lt!114496) (_1!3180 lt!114471) lt!114486 lt!114512))))

(assert (=> b!70994 (= (bitStreamReadBitsIntoList!0 (_2!3181 lt!114506) (_1!3180 lt!114471) (bvsub lt!114486 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!335 lt!114512))))

(declare-fun lt!114476 () Unit!4725)

(assert (=> b!70994 (= lt!114476 lt!114488)))

(declare-fun lt!114474 () Unit!4725)

(assert (=> b!70994 (= lt!114474 (arrayBitRangesEqImpliesEq!0 (buf!1741 (_2!3181 lt!114473)) (buf!1741 (_2!3181 lt!114506)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!114483 (bitIndex!0 (size!1360 (buf!1741 (_2!3181 lt!114473))) (currentByte!3455 (_2!3181 lt!114473)) (currentBit!3450 (_2!3181 lt!114473)))))))

(assert (=> b!70994 (= (bitAt!0 (buf!1741 (_2!3181 lt!114473)) lt!114483) (bitAt!0 (buf!1741 (_2!3181 lt!114506)) lt!114483))))

(declare-fun lt!114472 () Unit!4725)

(assert (=> b!70994 (= lt!114472 lt!114474)))

(declare-fun b!70995 () Bool)

(declare-fun res!58519 () Bool)

(assert (=> b!70995 (=> (not res!58519) (not e!46229))))

(assert (=> b!70995 (= res!58519 (= (size!1360 (buf!1741 (_2!3181 lt!113646))) (size!1360 (buf!1741 (_2!3181 lt!114475)))))))

(declare-fun b!70996 () Bool)

(declare-fun res!58518 () Bool)

(assert (=> b!70996 (=> (not res!58518) (not e!46229))))

(assert (=> b!70996 (= res!58518 (isPrefixOf!0 (_2!3181 lt!113646) (_2!3181 lt!114475)))))

(assert (= (and d!22828 c!5326) b!70994))

(assert (= (and d!22828 (not c!5326)) b!70991))

(assert (= (or b!70994 b!70991) bm!919))

(assert (= (and d!22828 res!58522) b!70989))

(assert (= (and b!70989 res!58520) b!70995))

(assert (= (and b!70995 res!58519) b!70996))

(assert (= (and b!70996 res!58518) b!70990))

(assert (= (and b!70990 res!58517) b!70992))

(assert (= (and b!70992 res!58521) b!70993))

(declare-fun m!113765 () Bool)

(assert (=> b!70992 m!113765))

(declare-fun m!113767 () Bool)

(assert (=> b!70992 m!113767))

(declare-fun m!113769 () Bool)

(assert (=> b!70992 m!113769))

(declare-fun m!113771 () Bool)

(assert (=> b!70992 m!113771))

(declare-fun m!113773 () Bool)

(assert (=> b!70992 m!113773))

(declare-fun m!113775 () Bool)

(assert (=> b!70991 m!113775))

(declare-fun m!113777 () Bool)

(assert (=> b!70991 m!113777))

(declare-fun m!113779 () Bool)

(assert (=> b!70994 m!113779))

(declare-fun m!113781 () Bool)

(assert (=> b!70994 m!113781))

(declare-fun m!113783 () Bool)

(assert (=> b!70994 m!113783))

(declare-fun m!113785 () Bool)

(assert (=> b!70994 m!113785))

(declare-fun m!113787 () Bool)

(assert (=> b!70994 m!113787))

(declare-fun m!113789 () Bool)

(assert (=> b!70994 m!113789))

(declare-fun m!113791 () Bool)

(assert (=> b!70994 m!113791))

(declare-fun m!113793 () Bool)

(assert (=> b!70994 m!113793))

(declare-fun m!113795 () Bool)

(assert (=> b!70994 m!113795))

(declare-fun m!113797 () Bool)

(assert (=> b!70994 m!113797))

(declare-fun m!113799 () Bool)

(assert (=> b!70994 m!113799))

(declare-fun m!113801 () Bool)

(assert (=> b!70994 m!113801))

(declare-fun m!113803 () Bool)

(assert (=> b!70994 m!113803))

(declare-fun m!113805 () Bool)

(assert (=> b!70994 m!113805))

(declare-fun m!113807 () Bool)

(assert (=> b!70994 m!113807))

(declare-fun m!113809 () Bool)

(assert (=> b!70994 m!113809))

(declare-fun m!113811 () Bool)

(assert (=> b!70994 m!113811))

(declare-fun m!113813 () Bool)

(assert (=> b!70994 m!113813))

(declare-fun m!113815 () Bool)

(assert (=> b!70994 m!113815))

(declare-fun m!113817 () Bool)

(assert (=> b!70994 m!113817))

(declare-fun m!113819 () Bool)

(assert (=> b!70994 m!113819))

(assert (=> b!70994 m!113815))

(declare-fun m!113821 () Bool)

(assert (=> b!70994 m!113821))

(assert (=> b!70994 m!113121))

(declare-fun m!113823 () Bool)

(assert (=> b!70994 m!113823))

(assert (=> b!70994 m!113789))

(declare-fun m!113825 () Bool)

(assert (=> b!70994 m!113825))

(declare-fun m!113827 () Bool)

(assert (=> b!70994 m!113827))

(declare-fun m!113829 () Bool)

(assert (=> b!70994 m!113829))

(assert (=> b!70994 m!113783))

(declare-fun m!113831 () Bool)

(assert (=> b!70994 m!113831))

(assert (=> b!70994 m!113825))

(declare-fun m!113833 () Bool)

(assert (=> b!70994 m!113833))

(declare-fun m!113835 () Bool)

(assert (=> b!70994 m!113835))

(declare-fun m!113837 () Bool)

(assert (=> b!70994 m!113837))

(declare-fun m!113839 () Bool)

(assert (=> b!70994 m!113839))

(declare-fun m!113841 () Bool)

(assert (=> b!70989 m!113841))

(declare-fun m!113843 () Bool)

(assert (=> b!70993 m!113843))

(declare-fun m!113845 () Bool)

(assert (=> d!22828 m!113845))

(assert (=> d!22828 m!113121))

(assert (=> d!22828 m!113435))

(assert (=> d!22828 m!113431))

(declare-fun m!113847 () Bool)

(assert (=> b!70996 m!113847))

(declare-fun m!113849 () Bool)

(assert (=> bm!919 m!113849))

(assert (=> b!70616 d!22828))

(declare-fun d!22916 () Bool)

(declare-fun res!58524 () Bool)

(declare-fun e!46231 () Bool)

(assert (=> d!22916 (=> (not res!58524) (not e!46231))))

(assert (=> d!22916 (= res!58524 (= (size!1360 (buf!1741 (_2!3181 lt!113646))) (size!1360 (buf!1741 (_2!3181 lt!113649)))))))

(assert (=> d!22916 (= (isPrefixOf!0 (_2!3181 lt!113646) (_2!3181 lt!113649)) e!46231)))

(declare-fun b!70997 () Bool)

(declare-fun res!58523 () Bool)

(assert (=> b!70997 (=> (not res!58523) (not e!46231))))

(assert (=> b!70997 (= res!58523 (bvsle (bitIndex!0 (size!1360 (buf!1741 (_2!3181 lt!113646))) (currentByte!3455 (_2!3181 lt!113646)) (currentBit!3450 (_2!3181 lt!113646))) (bitIndex!0 (size!1360 (buf!1741 (_2!3181 lt!113649))) (currentByte!3455 (_2!3181 lt!113649)) (currentBit!3450 (_2!3181 lt!113649)))))))

(declare-fun b!70998 () Bool)

(declare-fun e!46230 () Bool)

(assert (=> b!70998 (= e!46231 e!46230)))

(declare-fun res!58525 () Bool)

(assert (=> b!70998 (=> res!58525 e!46230)))

(assert (=> b!70998 (= res!58525 (= (size!1360 (buf!1741 (_2!3181 lt!113646))) #b00000000000000000000000000000000))))

(declare-fun b!70999 () Bool)

(assert (=> b!70999 (= e!46230 (arrayBitRangesEq!0 (buf!1741 (_2!3181 lt!113646)) (buf!1741 (_2!3181 lt!113649)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1360 (buf!1741 (_2!3181 lt!113646))) (currentByte!3455 (_2!3181 lt!113646)) (currentBit!3450 (_2!3181 lt!113646)))))))

(assert (= (and d!22916 res!58524) b!70997))

(assert (= (and b!70997 res!58523) b!70998))

(assert (= (and b!70998 (not res!58525)) b!70999))

(assert (=> b!70997 m!113121))

(assert (=> b!70997 m!113109))

(assert (=> b!70999 m!113121))

(assert (=> b!70999 m!113121))

(declare-fun m!113851 () Bool)

(assert (=> b!70999 m!113851))

(assert (=> b!70616 d!22916))

(declare-fun d!22918 () Bool)

(assert (=> d!22918 (isPrefixOf!0 thiss!1379 (_2!3181 lt!113649))))

(declare-fun lt!114517 () Unit!4725)

(declare-fun choose!30 (BitStream!2312 BitStream!2312 BitStream!2312) Unit!4725)

(assert (=> d!22918 (= lt!114517 (choose!30 thiss!1379 (_2!3181 lt!113646) (_2!3181 lt!113649)))))

(assert (=> d!22918 (isPrefixOf!0 thiss!1379 (_2!3181 lt!113646))))

(assert (=> d!22918 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3181 lt!113646) (_2!3181 lt!113649)) lt!114517)))

(declare-fun bs!5488 () Bool)

(assert (= bs!5488 d!22918))

(assert (=> bs!5488 m!113129))

(declare-fun m!113853 () Bool)

(assert (=> bs!5488 m!113853))

(assert (=> bs!5488 m!113111))

(assert (=> b!70616 d!22918))

(declare-fun d!22920 () Bool)

(declare-fun res!58527 () Bool)

(declare-fun e!46233 () Bool)

(assert (=> d!22920 (=> (not res!58527) (not e!46233))))

(assert (=> d!22920 (= res!58527 (= (size!1360 (buf!1741 thiss!1379)) (size!1360 (buf!1741 (_2!3181 lt!113649)))))))

(assert (=> d!22920 (= (isPrefixOf!0 thiss!1379 (_2!3181 lt!113649)) e!46233)))

(declare-fun b!71000 () Bool)

(declare-fun res!58526 () Bool)

(assert (=> b!71000 (=> (not res!58526) (not e!46233))))

(assert (=> b!71000 (= res!58526 (bvsle (bitIndex!0 (size!1360 (buf!1741 thiss!1379)) (currentByte!3455 thiss!1379) (currentBit!3450 thiss!1379)) (bitIndex!0 (size!1360 (buf!1741 (_2!3181 lt!113649))) (currentByte!3455 (_2!3181 lt!113649)) (currentBit!3450 (_2!3181 lt!113649)))))))

(declare-fun b!71001 () Bool)

(declare-fun e!46232 () Bool)

(assert (=> b!71001 (= e!46233 e!46232)))

(declare-fun res!58528 () Bool)

(assert (=> b!71001 (=> res!58528 e!46232)))

(assert (=> b!71001 (= res!58528 (= (size!1360 (buf!1741 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!71002 () Bool)

(assert (=> b!71002 (= e!46232 (arrayBitRangesEq!0 (buf!1741 thiss!1379) (buf!1741 (_2!3181 lt!113649)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1360 (buf!1741 thiss!1379)) (currentByte!3455 thiss!1379) (currentBit!3450 thiss!1379))))))

(assert (= (and d!22920 res!58527) b!71000))

(assert (= (and b!71000 res!58526) b!71001))

(assert (= (and b!71001 (not res!58528)) b!71002))

(assert (=> b!71000 m!113079))

(assert (=> b!71000 m!113109))

(assert (=> b!71002 m!113079))

(assert (=> b!71002 m!113079))

(declare-fun m!113855 () Bool)

(assert (=> b!71002 m!113855))

(assert (=> b!70616 d!22920))

(declare-fun d!22922 () Bool)

(assert (=> d!22922 (validate_offset_bits!1 ((_ sign_extend 32) (size!1360 (buf!1741 (_2!3181 lt!113646)))) ((_ sign_extend 32) (currentByte!3455 thiss!1379)) ((_ sign_extend 32) (currentBit!3450 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!114518 () Unit!4725)

(assert (=> d!22922 (= lt!114518 (choose!9 thiss!1379 (buf!1741 (_2!3181 lt!113646)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2313 (buf!1741 (_2!3181 lt!113646)) (currentByte!3455 thiss!1379) (currentBit!3450 thiss!1379))))))

(assert (=> d!22922 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1741 (_2!3181 lt!113646)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!114518)))

(declare-fun bs!5489 () Bool)

(assert (= bs!5489 d!22922))

(assert (=> bs!5489 m!113131))

(declare-fun m!113857 () Bool)

(assert (=> bs!5489 m!113857))

(assert (=> b!70616 d!22922))

(push 1)

(assert (not b!70827))

(assert (not b!70818))

(assert (not b!70836))

(assert (not b!70994))

(assert (not d!22736))

(assert (not b!70763))

(assert (not d!22786))

(assert (not d!22758))

(assert (not b!70834))

(assert (not b!70997))

(assert (not d!22918))

(assert (not b!70772))

(assert (not d!22828))

(assert (not b!70996))

(assert (not b!70993))

(assert (not d!22824))

(assert (not d!22808))

(assert (not b!70992))

(assert (not b!71000))

(assert (not b!70814))

(assert (not d!22770))

(assert (not b!70736))

(assert (not d!22790))

(assert (not b!70766))

(assert (not b!70840))

(assert (not b!70738))

(assert (not d!22764))

(assert (not d!22738))

(assert (not d!22818))

(assert (not b!70829))

(assert (not b!70759))

(assert (not b!70999))

(assert (not bm!919))

(assert (not b!70782))

(assert (not b!70788))

(assert (not b!70991))

(assert (not d!22802))

(assert (not b!70741))

(assert (not b!70839))

(assert (not b!70819))

(assert (not b!70815))

(assert (not d!22784))

(assert (not b!70847))

(assert (not b!70786))

(assert (not b!70760))

(assert (not d!22794))

(assert (not d!22756))

(assert (not b!70787))

(assert (not b!70765))

(assert (not b!70844))

(assert (not d!22792))

(assert (not d!22768))

(assert (not b!70846))

(assert (not d!22762))

(assert (not d!22774))

(assert (not b!70838))

(assert (not b!70812))

(assert (not b!70783))

(assert (not d!22826))

(assert (not b!70813))

(assert (not b!70764))

(assert (not d!22922))

(assert (not b!70761))

(assert (not b!70845))

(assert (not b!70820))

(assert (not d!22740))

(assert (not b!70817))

(assert (not d!22750))

(assert (not b!70762))

(assert (not b!71002))

(assert (not b!70989))

(assert (not b!70784))

(check-sat)

(pop 1)

(push 1)

(check-sat)

