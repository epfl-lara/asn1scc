; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28026 () Bool)

(assert start!28026)

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6618 0))(
  ( (array!6619 (arr!3730 (Array (_ BitVec 32) (_ BitVec 8))) (size!2997 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5252 0))(
  ( (BitStream!5253 (buf!3436 array!6618) (currentByte!6326 (_ BitVec 32)) (currentBit!6321 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!13018 0))(
  ( (tuple2!13019 (_1!6855 BitStream!5252) (_2!6855 array!6618)) )
))
(declare-fun lt!225198 () tuple2!13018)

(declare-fun arr!237 () array!6618)

(declare-fun b!145385 () Bool)

(declare-fun e!96939 () Bool)

(declare-fun arrayRangesEq!313 (array!6618 array!6618 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!145385 (= e!96939 (not (arrayRangesEq!313 arr!237 (_2!6855 lt!225198) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!145386 () Bool)

(declare-fun e!96933 () Bool)

(declare-datatypes ((tuple2!13020 0))(
  ( (tuple2!13021 (_1!6856 BitStream!5252) (_2!6856 (_ BitVec 8))) )
))
(declare-fun lt!225206 () tuple2!13020)

(declare-fun lt!225199 () tuple2!13020)

(assert (=> b!145386 (= e!96933 (= (_2!6856 lt!225206) (_2!6856 lt!225199)))))

(declare-fun res!121567 () Bool)

(declare-fun e!96935 () Bool)

(assert (=> start!28026 (=> (not res!121567) (not e!96935))))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!28026 (= res!121567 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2997 arr!237))))))

(assert (=> start!28026 e!96935))

(assert (=> start!28026 true))

(declare-fun array_inv!2786 (array!6618) Bool)

(assert (=> start!28026 (array_inv!2786 arr!237)))

(declare-fun thiss!1634 () BitStream!5252)

(declare-fun e!96932 () Bool)

(declare-fun inv!12 (BitStream!5252) Bool)

(assert (=> start!28026 (and (inv!12 thiss!1634) e!96932)))

(declare-fun b!145387 () Bool)

(declare-fun res!121566 () Bool)

(assert (=> b!145387 (=> (not res!121566) (not e!96935))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!145387 (= res!121566 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2997 (buf!3436 thiss!1634))) ((_ sign_extend 32) (currentByte!6326 thiss!1634)) ((_ sign_extend 32) (currentBit!6321 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!145388 () Bool)

(declare-fun res!121569 () Bool)

(assert (=> b!145388 (=> (not res!121569) (not e!96935))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!145388 (= res!121569 (invariant!0 (currentBit!6321 thiss!1634) (currentByte!6326 thiss!1634) (size!2997 (buf!3436 thiss!1634))))))

(declare-fun b!145389 () Bool)

(declare-fun e!96942 () Bool)

(declare-fun e!96936 () Bool)

(assert (=> b!145389 (= e!96942 e!96936)))

(declare-fun res!121573 () Bool)

(assert (=> b!145389 (=> (not res!121573) (not e!96936))))

(declare-fun lt!225195 () (_ BitVec 64))

(declare-datatypes ((Unit!9067 0))(
  ( (Unit!9068) )
))
(declare-datatypes ((tuple2!13022 0))(
  ( (tuple2!13023 (_1!6857 Unit!9067) (_2!6857 BitStream!5252)) )
))
(declare-fun lt!225200 () tuple2!13022)

(declare-fun lt!225205 () tuple2!13022)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!145389 (= res!121573 (= (bitIndex!0 (size!2997 (buf!3436 (_2!6857 lt!225205))) (currentByte!6326 (_2!6857 lt!225205)) (currentBit!6321 (_2!6857 lt!225205))) (bvadd (bitIndex!0 (size!2997 (buf!3436 (_2!6857 lt!225200))) (currentByte!6326 (_2!6857 lt!225200)) (currentBit!6321 (_2!6857 lt!225200))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!225195))))))

(assert (=> b!145389 (= lt!225195 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!145390 () Bool)

(declare-fun res!121574 () Bool)

(declare-fun e!96938 () Bool)

(assert (=> b!145390 (=> (not res!121574) (not e!96938))))

(declare-fun isPrefixOf!0 (BitStream!5252 BitStream!5252) Bool)

(assert (=> b!145390 (= res!121574 (isPrefixOf!0 thiss!1634 (_2!6857 lt!225200)))))

(declare-datatypes ((tuple2!13024 0))(
  ( (tuple2!13025 (_1!6858 BitStream!5252) (_2!6858 BitStream!5252)) )
))
(declare-fun lt!225191 () tuple2!13024)

(declare-fun e!96940 () Bool)

(declare-fun b!145391 () Bool)

(declare-fun readByteArrayLoopPure!0 (BitStream!5252 array!6618 (_ BitVec 32) (_ BitVec 32)) tuple2!13018)

(assert (=> b!145391 (= e!96940 (= (_1!6855 (readByteArrayLoopPure!0 (_1!6858 lt!225191) arr!237 from!447 to!404)) (_2!6858 lt!225191)))))

(declare-fun b!145392 () Bool)

(assert (=> b!145392 (= e!96935 (not true))))

(declare-fun lt!225203 () tuple2!13024)

(declare-fun lt!225204 () tuple2!13020)

(declare-fun lt!225188 () tuple2!13018)

(assert (=> b!145392 (= lt!225188 (readByteArrayLoopPure!0 (_1!6858 lt!225203) (array!6619 (store (arr!3730 arr!237) from!447 (_2!6856 lt!225204)) (size!2997 arr!237)) (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!225193 () (_ BitVec 32))

(assert (=> b!145392 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2997 (buf!3436 (_2!6857 lt!225205)))) ((_ sign_extend 32) (currentByte!6326 (_2!6857 lt!225200))) ((_ sign_extend 32) (currentBit!6321 (_2!6857 lt!225200))) lt!225193)))

(declare-fun lt!225202 () Unit!9067)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5252 array!6618 (_ BitVec 32)) Unit!9067)

(assert (=> b!145392 (= lt!225202 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6857 lt!225200) (buf!3436 (_2!6857 lt!225205)) lt!225193))))

(assert (=> b!145392 e!96940))

(declare-fun res!121563 () Bool)

(assert (=> b!145392 (=> (not res!121563) (not e!96940))))

(assert (=> b!145392 (= res!121563 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2997 (buf!3436 (_2!6857 lt!225205)))) ((_ sign_extend 32) (currentByte!6326 thiss!1634)) ((_ sign_extend 32) (currentBit!6321 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!225189 () Unit!9067)

(assert (=> b!145392 (= lt!225189 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3436 (_2!6857 lt!225205)) (bvsub to!404 from!447)))))

(assert (=> b!145392 (= (_2!6856 lt!225204) (select (arr!3730 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!5252) tuple2!13020)

(assert (=> b!145392 (= lt!225204 (readBytePure!0 (_1!6858 lt!225191)))))

(declare-fun reader!0 (BitStream!5252 BitStream!5252) tuple2!13024)

(assert (=> b!145392 (= lt!225203 (reader!0 (_2!6857 lt!225200) (_2!6857 lt!225205)))))

(assert (=> b!145392 (= lt!225191 (reader!0 thiss!1634 (_2!6857 lt!225205)))))

(assert (=> b!145392 e!96933))

(declare-fun res!121575 () Bool)

(assert (=> b!145392 (=> (not res!121575) (not e!96933))))

(assert (=> b!145392 (= res!121575 (= (bitIndex!0 (size!2997 (buf!3436 (_1!6856 lt!225206))) (currentByte!6326 (_1!6856 lt!225206)) (currentBit!6321 (_1!6856 lt!225206))) (bitIndex!0 (size!2997 (buf!3436 (_1!6856 lt!225199))) (currentByte!6326 (_1!6856 lt!225199)) (currentBit!6321 (_1!6856 lt!225199)))))))

(declare-fun lt!225190 () Unit!9067)

(declare-fun lt!225187 () BitStream!5252)

(declare-fun readBytePrefixLemma!0 (BitStream!5252 BitStream!5252) Unit!9067)

(assert (=> b!145392 (= lt!225190 (readBytePrefixLemma!0 lt!225187 (_2!6857 lt!225205)))))

(assert (=> b!145392 (= lt!225199 (readBytePure!0 (BitStream!5253 (buf!3436 (_2!6857 lt!225205)) (currentByte!6326 thiss!1634) (currentBit!6321 thiss!1634))))))

(assert (=> b!145392 (= lt!225206 (readBytePure!0 lt!225187))))

(assert (=> b!145392 (= lt!225187 (BitStream!5253 (buf!3436 (_2!6857 lt!225200)) (currentByte!6326 thiss!1634) (currentBit!6321 thiss!1634)))))

(declare-fun e!96941 () Bool)

(assert (=> b!145392 e!96941))

(declare-fun res!121571 () Bool)

(assert (=> b!145392 (=> (not res!121571) (not e!96941))))

(assert (=> b!145392 (= res!121571 (isPrefixOf!0 thiss!1634 (_2!6857 lt!225205)))))

(declare-fun lt!225201 () Unit!9067)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5252 BitStream!5252 BitStream!5252) Unit!9067)

(assert (=> b!145392 (= lt!225201 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6857 lt!225200) (_2!6857 lt!225205)))))

(assert (=> b!145392 e!96942))

(declare-fun res!121568 () Bool)

(assert (=> b!145392 (=> (not res!121568) (not e!96942))))

(assert (=> b!145392 (= res!121568 (= (size!2997 (buf!3436 (_2!6857 lt!225200))) (size!2997 (buf!3436 (_2!6857 lt!225205)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5252 array!6618 (_ BitVec 32) (_ BitVec 32)) tuple2!13022)

(assert (=> b!145392 (= lt!225205 (appendByteArrayLoop!0 (_2!6857 lt!225200) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!145392 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2997 (buf!3436 (_2!6857 lt!225200)))) ((_ sign_extend 32) (currentByte!6326 (_2!6857 lt!225200))) ((_ sign_extend 32) (currentBit!6321 (_2!6857 lt!225200))) lt!225193)))

(assert (=> b!145392 (= lt!225193 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!225196 () Unit!9067)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5252 BitStream!5252 (_ BitVec 64) (_ BitVec 32)) Unit!9067)

(assert (=> b!145392 (= lt!225196 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6857 lt!225200) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!145392 e!96938))

(declare-fun res!121576 () Bool)

(assert (=> b!145392 (=> (not res!121576) (not e!96938))))

(assert (=> b!145392 (= res!121576 (= (size!2997 (buf!3436 thiss!1634)) (size!2997 (buf!3436 (_2!6857 lt!225200)))))))

(declare-fun appendByte!0 (BitStream!5252 (_ BitVec 8)) tuple2!13022)

(assert (=> b!145392 (= lt!225200 (appendByte!0 thiss!1634 (select (arr!3730 arr!237) from!447)))))

(declare-fun b!145393 () Bool)

(declare-fun res!121564 () Bool)

(assert (=> b!145393 (=> (not res!121564) (not e!96938))))

(assert (=> b!145393 (= res!121564 (= (bitIndex!0 (size!2997 (buf!3436 (_2!6857 lt!225200))) (currentByte!6326 (_2!6857 lt!225200)) (currentBit!6321 (_2!6857 lt!225200))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2997 (buf!3436 thiss!1634)) (currentByte!6326 thiss!1634) (currentBit!6321 thiss!1634)))))))

(declare-fun lt!225194 () tuple2!13020)

(declare-fun lt!225192 () tuple2!13024)

(declare-fun b!145394 () Bool)

(assert (=> b!145394 (= e!96938 (and (= (_2!6856 lt!225194) (select (arr!3730 arr!237) from!447)) (= (_1!6856 lt!225194) (_2!6858 lt!225192))))))

(assert (=> b!145394 (= lt!225194 (readBytePure!0 (_1!6858 lt!225192)))))

(assert (=> b!145394 (= lt!225192 (reader!0 thiss!1634 (_2!6857 lt!225200)))))

(declare-fun b!145395 () Bool)

(assert (=> b!145395 (= e!96932 (array_inv!2786 (buf!3436 thiss!1634)))))

(declare-fun b!145396 () Bool)

(declare-fun res!121565 () Bool)

(assert (=> b!145396 (=> (not res!121565) (not e!96935))))

(assert (=> b!145396 (= res!121565 (bvslt from!447 to!404))))

(declare-fun b!145397 () Bool)

(declare-fun res!121572 () Bool)

(assert (=> b!145397 (=> (not res!121572) (not e!96936))))

(assert (=> b!145397 (= res!121572 (isPrefixOf!0 (_2!6857 lt!225200) (_2!6857 lt!225205)))))

(declare-fun b!145398 () Bool)

(assert (=> b!145398 (= e!96936 (not e!96939))))

(declare-fun res!121570 () Bool)

(assert (=> b!145398 (=> res!121570 e!96939)))

(declare-fun lt!225197 () tuple2!13024)

(assert (=> b!145398 (= res!121570 (or (not (= (size!2997 (_2!6855 lt!225198)) (size!2997 arr!237))) (not (= (_1!6855 lt!225198) (_2!6858 lt!225197)))))))

(assert (=> b!145398 (= lt!225198 (readByteArrayLoopPure!0 (_1!6858 lt!225197) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!145398 (validate_offset_bits!1 ((_ sign_extend 32) (size!2997 (buf!3436 (_2!6857 lt!225205)))) ((_ sign_extend 32) (currentByte!6326 (_2!6857 lt!225200))) ((_ sign_extend 32) (currentBit!6321 (_2!6857 lt!225200))) lt!225195)))

(declare-fun lt!225207 () Unit!9067)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5252 array!6618 (_ BitVec 64)) Unit!9067)

(assert (=> b!145398 (= lt!225207 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6857 lt!225200) (buf!3436 (_2!6857 lt!225205)) lt!225195))))

(assert (=> b!145398 (= lt!225197 (reader!0 (_2!6857 lt!225200) (_2!6857 lt!225205)))))

(declare-fun b!145399 () Bool)

(assert (=> b!145399 (= e!96941 (invariant!0 (currentBit!6321 thiss!1634) (currentByte!6326 thiss!1634) (size!2997 (buf!3436 (_2!6857 lt!225200)))))))

(assert (= (and start!28026 res!121567) b!145387))

(assert (= (and b!145387 res!121566) b!145396))

(assert (= (and b!145396 res!121565) b!145388))

(assert (= (and b!145388 res!121569) b!145392))

(assert (= (and b!145392 res!121576) b!145393))

(assert (= (and b!145393 res!121564) b!145390))

(assert (= (and b!145390 res!121574) b!145394))

(assert (= (and b!145392 res!121568) b!145389))

(assert (= (and b!145389 res!121573) b!145397))

(assert (= (and b!145397 res!121572) b!145398))

(assert (= (and b!145398 (not res!121570)) b!145385))

(assert (= (and b!145392 res!121571) b!145399))

(assert (= (and b!145392 res!121575) b!145386))

(assert (= (and b!145392 res!121563) b!145391))

(assert (= start!28026 b!145395))

(declare-fun m!223661 () Bool)

(assert (=> b!145397 m!223661))

(declare-fun m!223663 () Bool)

(assert (=> b!145395 m!223663))

(declare-fun m!223665 () Bool)

(assert (=> b!145394 m!223665))

(declare-fun m!223667 () Bool)

(assert (=> b!145394 m!223667))

(declare-fun m!223669 () Bool)

(assert (=> b!145394 m!223669))

(declare-fun m!223671 () Bool)

(assert (=> b!145391 m!223671))

(declare-fun m!223673 () Bool)

(assert (=> start!28026 m!223673))

(declare-fun m!223675 () Bool)

(assert (=> start!28026 m!223675))

(declare-fun m!223677 () Bool)

(assert (=> b!145398 m!223677))

(declare-fun m!223679 () Bool)

(assert (=> b!145398 m!223679))

(declare-fun m!223681 () Bool)

(assert (=> b!145398 m!223681))

(declare-fun m!223683 () Bool)

(assert (=> b!145398 m!223683))

(declare-fun m!223685 () Bool)

(assert (=> b!145387 m!223685))

(declare-fun m!223687 () Bool)

(assert (=> b!145388 m!223687))

(declare-fun m!223689 () Bool)

(assert (=> b!145389 m!223689))

(declare-fun m!223691 () Bool)

(assert (=> b!145389 m!223691))

(declare-fun m!223693 () Bool)

(assert (=> b!145385 m!223693))

(declare-fun m!223695 () Bool)

(assert (=> b!145390 m!223695))

(declare-fun m!223697 () Bool)

(assert (=> b!145392 m!223697))

(declare-fun m!223699 () Bool)

(assert (=> b!145392 m!223699))

(declare-fun m!223701 () Bool)

(assert (=> b!145392 m!223701))

(declare-fun m!223703 () Bool)

(assert (=> b!145392 m!223703))

(declare-fun m!223705 () Bool)

(assert (=> b!145392 m!223705))

(assert (=> b!145392 m!223683))

(declare-fun m!223707 () Bool)

(assert (=> b!145392 m!223707))

(declare-fun m!223709 () Bool)

(assert (=> b!145392 m!223709))

(declare-fun m!223711 () Bool)

(assert (=> b!145392 m!223711))

(declare-fun m!223713 () Bool)

(assert (=> b!145392 m!223713))

(declare-fun m!223715 () Bool)

(assert (=> b!145392 m!223715))

(declare-fun m!223717 () Bool)

(assert (=> b!145392 m!223717))

(declare-fun m!223719 () Bool)

(assert (=> b!145392 m!223719))

(declare-fun m!223721 () Bool)

(assert (=> b!145392 m!223721))

(declare-fun m!223723 () Bool)

(assert (=> b!145392 m!223723))

(declare-fun m!223725 () Bool)

(assert (=> b!145392 m!223725))

(declare-fun m!223727 () Bool)

(assert (=> b!145392 m!223727))

(assert (=> b!145392 m!223665))

(declare-fun m!223729 () Bool)

(assert (=> b!145392 m!223729))

(assert (=> b!145392 m!223665))

(declare-fun m!223731 () Bool)

(assert (=> b!145392 m!223731))

(declare-fun m!223733 () Bool)

(assert (=> b!145392 m!223733))

(assert (=> b!145393 m!223691))

(declare-fun m!223735 () Bool)

(assert (=> b!145393 m!223735))

(declare-fun m!223737 () Bool)

(assert (=> b!145399 m!223737))

(push 1)

(assert (not b!145389))

(assert (not start!28026))

(assert (not b!145392))

(assert (not b!145391))

(assert (not b!145394))

(assert (not b!145385))

(assert (not b!145397))

(assert (not b!145388))

(assert (not b!145395))

(assert (not b!145387))

(assert (not b!145399))

(assert (not b!145393))

(assert (not b!145390))

(assert (not b!145398))

(check-sat)

(pop 1)

