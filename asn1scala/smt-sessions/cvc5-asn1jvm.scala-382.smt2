; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9278 () Bool)

(assert start!9278)

(declare-fun b!46170 () Bool)

(declare-fun res!39023 () Bool)

(declare-fun e!30706 () Bool)

(assert (=> b!46170 (=> (not res!39023) (not e!30706))))

(declare-datatypes ((array!2284 0))(
  ( (array!2285 (arr!1547 (Array (_ BitVec 32) (_ BitVec 8))) (size!1030 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1798 0))(
  ( (BitStream!1799 (buf!1379 array!2284) (currentByte!2878 (_ BitVec 32)) (currentBit!2873 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1798)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!46170 (= res!39023 (validate_offset_bits!1 ((_ sign_extend 32) (size!1030 (buf!1379 thiss!1379))) ((_ sign_extend 32) (currentByte!2878 thiss!1379)) ((_ sign_extend 32) (currentBit!2873 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun srcBuffer!2 () array!2284)

(declare-datatypes ((Unit!3273 0))(
  ( (Unit!3274) )
))
(declare-datatypes ((tuple2!4488 0))(
  ( (tuple2!4489 (_1!2337 Unit!3273) (_2!2337 BitStream!1798)) )
))
(declare-fun lt!71106 () tuple2!4488)

(declare-fun b!46171 () Bool)

(declare-fun e!30704 () Bool)

(declare-datatypes ((tuple2!4490 0))(
  ( (tuple2!4491 (_1!2338 BitStream!1798) (_2!2338 BitStream!1798)) )
))
(declare-fun lt!71113 () tuple2!4490)

(declare-datatypes ((List!540 0))(
  ( (Nil!537) (Cons!536 (h!655 Bool) (t!1290 List!540)) )
))
(declare-fun head!359 (List!540) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1798 array!2284 (_ BitVec 64) (_ BitVec 64)) List!540)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1798 BitStream!1798 (_ BitVec 64)) List!540)

(assert (=> b!46171 (= e!30704 (= (head!359 (byteArrayBitContentToList!0 (_2!2337 lt!71106) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!359 (bitStreamReadBitsIntoList!0 (_2!2337 lt!71106) (_1!2338 lt!71113) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!71116 () (_ BitVec 64))

(declare-fun e!30702 () Bool)

(declare-fun b!46172 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!46172 (= e!30702 (= lt!71116 (bvsub (bvsub (bvadd (bitIndex!0 (size!1030 (buf!1379 (_2!2337 lt!71106))) (currentByte!2878 (_2!2337 lt!71106)) (currentBit!2873 (_2!2337 lt!71106))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!46173 () Bool)

(declare-fun res!39015 () Bool)

(declare-fun e!30705 () Bool)

(assert (=> b!46173 (=> res!39015 e!30705)))

(declare-fun lt!71114 () List!540)

(declare-fun length!235 (List!540) Int)

(assert (=> b!46173 (= res!39015 (<= (length!235 lt!71114) 0))))

(declare-fun lt!71103 () tuple2!4490)

(declare-fun lt!71105 () tuple2!4490)

(declare-fun lt!71110 () (_ BitVec 64))

(declare-fun e!30712 () Bool)

(declare-fun b!46174 () Bool)

(declare-fun bitAt!0 (array!2284 (_ BitVec 64)) Bool)

(assert (=> b!46174 (= e!30712 (= (bitAt!0 (buf!1379 (_1!2338 lt!71103)) lt!71110) (bitAt!0 (buf!1379 (_1!2338 lt!71105)) lt!71110)))))

(declare-fun b!46175 () Bool)

(declare-fun res!39014 () Bool)

(declare-fun e!30713 () Bool)

(assert (=> b!46175 (=> res!39014 e!30713)))

(declare-fun lt!71112 () tuple2!4488)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!46175 (= res!39014 (not (invariant!0 (currentBit!2873 (_2!2337 lt!71112)) (currentByte!2878 (_2!2337 lt!71112)) (size!1030 (buf!1379 (_2!2337 lt!71112))))))))

(declare-fun b!46176 () Bool)

(declare-fun e!30711 () Bool)

(assert (=> b!46176 (= e!30711 e!30713)))

(declare-fun res!39020 () Bool)

(assert (=> b!46176 (=> res!39020 e!30713)))

(assert (=> b!46176 (= res!39020 (not (= lt!71116 (bvsub (bvadd lt!71110 to!314) i!635))))))

(assert (=> b!46176 (= lt!71116 (bitIndex!0 (size!1030 (buf!1379 (_2!2337 lt!71112))) (currentByte!2878 (_2!2337 lt!71112)) (currentBit!2873 (_2!2337 lt!71112))))))

(declare-fun b!46177 () Bool)

(declare-fun e!30710 () Bool)

(declare-fun e!30703 () Bool)

(assert (=> b!46177 (= e!30710 e!30703)))

(declare-fun res!39018 () Bool)

(assert (=> b!46177 (=> res!39018 e!30703)))

(declare-fun isPrefixOf!0 (BitStream!1798 BitStream!1798) Bool)

(assert (=> b!46177 (= res!39018 (not (isPrefixOf!0 thiss!1379 (_2!2337 lt!71106))))))

(declare-fun lt!71115 () (_ BitVec 64))

(assert (=> b!46177 (validate_offset_bits!1 ((_ sign_extend 32) (size!1030 (buf!1379 (_2!2337 lt!71106)))) ((_ sign_extend 32) (currentByte!2878 (_2!2337 lt!71106))) ((_ sign_extend 32) (currentBit!2873 (_2!2337 lt!71106))) lt!71115)))

(assert (=> b!46177 (= lt!71115 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!71107 () Unit!3273)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1798 BitStream!1798 (_ BitVec 64) (_ BitVec 64)) Unit!3273)

(assert (=> b!46177 (= lt!71107 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2337 lt!71106) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1798 (_ BitVec 8) (_ BitVec 32)) tuple2!4488)

(assert (=> b!46177 (= lt!71106 (appendBitFromByte!0 thiss!1379 (select (arr!1547 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!46178 () Bool)

(declare-fun res!39009 () Bool)

(declare-fun e!30701 () Bool)

(assert (=> b!46178 (=> res!39009 e!30701)))

(assert (=> b!46178 (= res!39009 (not (invariant!0 (currentBit!2873 (_2!2337 lt!71106)) (currentByte!2878 (_2!2337 lt!71106)) (size!1030 (buf!1379 (_2!2337 lt!71106))))))))

(declare-fun b!46179 () Bool)

(assert (=> b!46179 (= e!30713 e!30701)))

(declare-fun res!39012 () Bool)

(assert (=> b!46179 (=> res!39012 e!30701)))

(assert (=> b!46179 (= res!39012 (not (= (size!1030 (buf!1379 (_2!2337 lt!71106))) (size!1030 (buf!1379 (_2!2337 lt!71112))))))))

(assert (=> b!46179 e!30702))

(declare-fun res!39022 () Bool)

(assert (=> b!46179 (=> (not res!39022) (not e!30702))))

(assert (=> b!46179 (= res!39022 (= (size!1030 (buf!1379 (_2!2337 lt!71112))) (size!1030 (buf!1379 thiss!1379))))))

(declare-fun b!46180 () Bool)

(declare-fun res!39010 () Bool)

(assert (=> b!46180 (=> res!39010 e!30701)))

(assert (=> b!46180 (= res!39010 (not (invariant!0 (currentBit!2873 (_2!2337 lt!71106)) (currentByte!2878 (_2!2337 lt!71106)) (size!1030 (buf!1379 (_2!2337 lt!71112))))))))

(declare-fun b!46181 () Bool)

(assert (=> b!46181 (= e!30703 e!30711)))

(declare-fun res!39021 () Bool)

(assert (=> b!46181 (=> res!39021 e!30711)))

(assert (=> b!46181 (= res!39021 (not (isPrefixOf!0 (_2!2337 lt!71106) (_2!2337 lt!71112))))))

(assert (=> b!46181 (isPrefixOf!0 thiss!1379 (_2!2337 lt!71112))))

(declare-fun lt!71111 () Unit!3273)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1798 BitStream!1798 BitStream!1798) Unit!3273)

(assert (=> b!46181 (= lt!71111 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2337 lt!71106) (_2!2337 lt!71112)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1798 array!2284 (_ BitVec 64) (_ BitVec 64)) tuple2!4488)

(assert (=> b!46181 (= lt!71112 (appendBitsMSBFirstLoop!0 (_2!2337 lt!71106) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!46181 e!30704))

(declare-fun res!39024 () Bool)

(assert (=> b!46181 (=> (not res!39024) (not e!30704))))

(assert (=> b!46181 (= res!39024 (validate_offset_bits!1 ((_ sign_extend 32) (size!1030 (buf!1379 (_2!2337 lt!71106)))) ((_ sign_extend 32) (currentByte!2878 thiss!1379)) ((_ sign_extend 32) (currentBit!2873 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!71102 () Unit!3273)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1798 array!2284 (_ BitVec 64)) Unit!3273)

(assert (=> b!46181 (= lt!71102 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1379 (_2!2337 lt!71106)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1798 BitStream!1798) tuple2!4490)

(assert (=> b!46181 (= lt!71113 (reader!0 thiss!1379 (_2!2337 lt!71106)))))

(declare-fun res!39013 () Bool)

(assert (=> start!9278 (=> (not res!39013) (not e!30706))))

(assert (=> start!9278 (= res!39013 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1030 srcBuffer!2))))))))

(assert (=> start!9278 e!30706))

(assert (=> start!9278 true))

(declare-fun array_inv!952 (array!2284) Bool)

(assert (=> start!9278 (array_inv!952 srcBuffer!2)))

(declare-fun e!30707 () Bool)

(declare-fun inv!12 (BitStream!1798) Bool)

(assert (=> start!9278 (and (inv!12 thiss!1379) e!30707)))

(declare-fun b!46182 () Bool)

(assert (=> b!46182 (= e!30707 (array_inv!952 (buf!1379 thiss!1379)))))

(declare-fun b!46183 () Bool)

(assert (=> b!46183 (= e!30705 e!30712)))

(declare-fun res!39011 () Bool)

(assert (=> b!46183 (=> res!39011 e!30712)))

(declare-fun lt!71109 () List!540)

(declare-fun lt!71104 () List!540)

(assert (=> b!46183 (= res!39011 (not (= lt!71109 lt!71104)))))

(assert (=> b!46183 (= lt!71104 lt!71109)))

(declare-fun tail!226 (List!540) List!540)

(assert (=> b!46183 (= lt!71109 (tail!226 lt!71114))))

(declare-fun lt!71119 () Unit!3273)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1798 BitStream!1798 BitStream!1798 BitStream!1798 (_ BitVec 64) List!540) Unit!3273)

(assert (=> b!46183 (= lt!71119 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2337 lt!71112) (_2!2337 lt!71112) (_1!2338 lt!71103) (_1!2338 lt!71105) (bvsub to!314 i!635) lt!71114))))

(declare-fun b!46184 () Bool)

(assert (=> b!46184 (= e!30701 e!30705)))

(declare-fun res!39016 () Bool)

(assert (=> b!46184 (=> res!39016 e!30705)))

(assert (=> b!46184 (= res!39016 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!46184 (= lt!71104 (bitStreamReadBitsIntoList!0 (_2!2337 lt!71112) (_1!2338 lt!71105) lt!71115))))

(assert (=> b!46184 (= lt!71114 (bitStreamReadBitsIntoList!0 (_2!2337 lt!71112) (_1!2338 lt!71103) (bvsub to!314 i!635)))))

(assert (=> b!46184 (validate_offset_bits!1 ((_ sign_extend 32) (size!1030 (buf!1379 (_2!2337 lt!71112)))) ((_ sign_extend 32) (currentByte!2878 (_2!2337 lt!71106))) ((_ sign_extend 32) (currentBit!2873 (_2!2337 lt!71106))) lt!71115)))

(declare-fun lt!71117 () Unit!3273)

(assert (=> b!46184 (= lt!71117 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2337 lt!71106) (buf!1379 (_2!2337 lt!71112)) lt!71115))))

(assert (=> b!46184 (= lt!71105 (reader!0 (_2!2337 lt!71106) (_2!2337 lt!71112)))))

(assert (=> b!46184 (validate_offset_bits!1 ((_ sign_extend 32) (size!1030 (buf!1379 (_2!2337 lt!71112)))) ((_ sign_extend 32) (currentByte!2878 thiss!1379)) ((_ sign_extend 32) (currentBit!2873 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!71118 () Unit!3273)

(assert (=> b!46184 (= lt!71118 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1379 (_2!2337 lt!71112)) (bvsub to!314 i!635)))))

(assert (=> b!46184 (= lt!71103 (reader!0 thiss!1379 (_2!2337 lt!71112)))))

(declare-fun b!46185 () Bool)

(assert (=> b!46185 (= e!30706 (not e!30710))))

(declare-fun res!39019 () Bool)

(assert (=> b!46185 (=> res!39019 e!30710)))

(assert (=> b!46185 (= res!39019 (bvsge i!635 to!314))))

(assert (=> b!46185 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!71108 () Unit!3273)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1798) Unit!3273)

(assert (=> b!46185 (= lt!71108 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!46185 (= lt!71110 (bitIndex!0 (size!1030 (buf!1379 thiss!1379)) (currentByte!2878 thiss!1379) (currentBit!2873 thiss!1379)))))

(declare-fun b!46186 () Bool)

(declare-fun res!39017 () Bool)

(assert (=> b!46186 (=> res!39017 e!30713)))

(assert (=> b!46186 (= res!39017 (not (= (size!1030 (buf!1379 thiss!1379)) (size!1030 (buf!1379 (_2!2337 lt!71112))))))))

(assert (= (and start!9278 res!39013) b!46170))

(assert (= (and b!46170 res!39023) b!46185))

(assert (= (and b!46185 (not res!39019)) b!46177))

(assert (= (and b!46177 (not res!39018)) b!46181))

(assert (= (and b!46181 res!39024) b!46171))

(assert (= (and b!46181 (not res!39021)) b!46176))

(assert (= (and b!46176 (not res!39020)) b!46175))

(assert (= (and b!46175 (not res!39014)) b!46186))

(assert (= (and b!46186 (not res!39017)) b!46179))

(assert (= (and b!46179 res!39022) b!46172))

(assert (= (and b!46179 (not res!39012)) b!46178))

(assert (= (and b!46178 (not res!39009)) b!46180))

(assert (= (and b!46180 (not res!39010)) b!46184))

(assert (= (and b!46184 (not res!39016)) b!46173))

(assert (= (and b!46173 (not res!39015)) b!46183))

(assert (= (and b!46183 (not res!39011)) b!46174))

(assert (= start!9278 b!46182))

(declare-fun m!70627 () Bool)

(assert (=> b!46181 m!70627))

(declare-fun m!70629 () Bool)

(assert (=> b!46181 m!70629))

(declare-fun m!70631 () Bool)

(assert (=> b!46181 m!70631))

(declare-fun m!70633 () Bool)

(assert (=> b!46181 m!70633))

(declare-fun m!70635 () Bool)

(assert (=> b!46181 m!70635))

(declare-fun m!70637 () Bool)

(assert (=> b!46181 m!70637))

(declare-fun m!70639 () Bool)

(assert (=> b!46181 m!70639))

(declare-fun m!70641 () Bool)

(assert (=> b!46180 m!70641))

(declare-fun m!70643 () Bool)

(assert (=> b!46171 m!70643))

(assert (=> b!46171 m!70643))

(declare-fun m!70645 () Bool)

(assert (=> b!46171 m!70645))

(declare-fun m!70647 () Bool)

(assert (=> b!46171 m!70647))

(assert (=> b!46171 m!70647))

(declare-fun m!70649 () Bool)

(assert (=> b!46171 m!70649))

(declare-fun m!70651 () Bool)

(assert (=> b!46182 m!70651))

(declare-fun m!70653 () Bool)

(assert (=> b!46185 m!70653))

(declare-fun m!70655 () Bool)

(assert (=> b!46185 m!70655))

(declare-fun m!70657 () Bool)

(assert (=> b!46185 m!70657))

(declare-fun m!70659 () Bool)

(assert (=> b!46184 m!70659))

(declare-fun m!70661 () Bool)

(assert (=> b!46184 m!70661))

(declare-fun m!70663 () Bool)

(assert (=> b!46184 m!70663))

(declare-fun m!70665 () Bool)

(assert (=> b!46184 m!70665))

(declare-fun m!70667 () Bool)

(assert (=> b!46184 m!70667))

(declare-fun m!70669 () Bool)

(assert (=> b!46184 m!70669))

(declare-fun m!70671 () Bool)

(assert (=> b!46184 m!70671))

(declare-fun m!70673 () Bool)

(assert (=> b!46184 m!70673))

(declare-fun m!70675 () Bool)

(assert (=> b!46170 m!70675))

(declare-fun m!70677 () Bool)

(assert (=> b!46183 m!70677))

(declare-fun m!70679 () Bool)

(assert (=> b!46183 m!70679))

(declare-fun m!70681 () Bool)

(assert (=> b!46178 m!70681))

(declare-fun m!70683 () Bool)

(assert (=> b!46175 m!70683))

(declare-fun m!70685 () Bool)

(assert (=> start!9278 m!70685))

(declare-fun m!70687 () Bool)

(assert (=> start!9278 m!70687))

(declare-fun m!70689 () Bool)

(assert (=> b!46173 m!70689))

(declare-fun m!70691 () Bool)

(assert (=> b!46172 m!70691))

(declare-fun m!70693 () Bool)

(assert (=> b!46177 m!70693))

(declare-fun m!70695 () Bool)

(assert (=> b!46177 m!70695))

(assert (=> b!46177 m!70693))

(declare-fun m!70697 () Bool)

(assert (=> b!46177 m!70697))

(declare-fun m!70699 () Bool)

(assert (=> b!46177 m!70699))

(declare-fun m!70701 () Bool)

(assert (=> b!46177 m!70701))

(declare-fun m!70703 () Bool)

(assert (=> b!46174 m!70703))

(declare-fun m!70705 () Bool)

(assert (=> b!46174 m!70705))

(declare-fun m!70707 () Bool)

(assert (=> b!46176 m!70707))

(push 1)

(assert (not b!46183))

(assert (not b!46185))

(assert (not b!46184))

(assert (not b!46175))

(assert (not b!46180))

(assert (not b!46176))

(assert (not b!46181))

(assert (not b!46182))

(assert (not b!46178))

(assert (not b!46171))

(assert (not b!46174))

(assert (not start!9278))

(assert (not b!46170))

(assert (not b!46173))

(assert (not b!46177))

(assert (not b!46172))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!13466 () Bool)

(assert (=> d!13466 (= (invariant!0 (currentBit!2873 (_2!2337 lt!71112)) (currentByte!2878 (_2!2337 lt!71112)) (size!1030 (buf!1379 (_2!2337 lt!71112)))) (and (bvsge (currentBit!2873 (_2!2337 lt!71112)) #b00000000000000000000000000000000) (bvslt (currentBit!2873 (_2!2337 lt!71112)) #b00000000000000000000000000001000) (bvsge (currentByte!2878 (_2!2337 lt!71112)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2878 (_2!2337 lt!71112)) (size!1030 (buf!1379 (_2!2337 lt!71112)))) (and (= (currentBit!2873 (_2!2337 lt!71112)) #b00000000000000000000000000000000) (= (currentByte!2878 (_2!2337 lt!71112)) (size!1030 (buf!1379 (_2!2337 lt!71112))))))))))

(assert (=> b!46175 d!13466))

(declare-fun d!13468 () Bool)

(declare-fun e!30834 () Bool)

(assert (=> d!13468 e!30834))

(declare-fun res!39194 () Bool)

(assert (=> d!13468 (=> (not res!39194) (not e!30834))))

(declare-fun lt!71391 () (_ BitVec 64))

(declare-fun lt!71395 () (_ BitVec 64))

(declare-fun lt!71393 () (_ BitVec 64))

(assert (=> d!13468 (= res!39194 (= lt!71395 (bvsub lt!71391 lt!71393)))))

(assert (=> d!13468 (or (= (bvand lt!71391 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!71393 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!71391 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!71391 lt!71393) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!13468 (= lt!71393 (remainingBits!0 ((_ sign_extend 32) (size!1030 (buf!1379 (_2!2337 lt!71112)))) ((_ sign_extend 32) (currentByte!2878 (_2!2337 lt!71112))) ((_ sign_extend 32) (currentBit!2873 (_2!2337 lt!71112)))))))

(declare-fun lt!71394 () (_ BitVec 64))

(declare-fun lt!71390 () (_ BitVec 64))

(assert (=> d!13468 (= lt!71391 (bvmul lt!71394 lt!71390))))

(assert (=> d!13468 (or (= lt!71394 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!71390 (bvsdiv (bvmul lt!71394 lt!71390) lt!71394)))))

(assert (=> d!13468 (= lt!71390 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!13468 (= lt!71394 ((_ sign_extend 32) (size!1030 (buf!1379 (_2!2337 lt!71112)))))))

(assert (=> d!13468 (= lt!71395 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2878 (_2!2337 lt!71112))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2873 (_2!2337 lt!71112)))))))

(assert (=> d!13468 (invariant!0 (currentBit!2873 (_2!2337 lt!71112)) (currentByte!2878 (_2!2337 lt!71112)) (size!1030 (buf!1379 (_2!2337 lt!71112))))))

(assert (=> d!13468 (= (bitIndex!0 (size!1030 (buf!1379 (_2!2337 lt!71112))) (currentByte!2878 (_2!2337 lt!71112)) (currentBit!2873 (_2!2337 lt!71112))) lt!71395)))

(declare-fun b!46368 () Bool)

(declare-fun res!39193 () Bool)

(assert (=> b!46368 (=> (not res!39193) (not e!30834))))

(assert (=> b!46368 (= res!39193 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!71395))))

(declare-fun b!46369 () Bool)

(declare-fun lt!71392 () (_ BitVec 64))

(assert (=> b!46369 (= e!30834 (bvsle lt!71395 (bvmul lt!71392 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!46369 (or (= lt!71392 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!71392 #b0000000000000000000000000000000000000000000000000000000000001000) lt!71392)))))

(assert (=> b!46369 (= lt!71392 ((_ sign_extend 32) (size!1030 (buf!1379 (_2!2337 lt!71112)))))))

(assert (= (and d!13468 res!39194) b!46368))

(assert (= (and b!46368 res!39193) b!46369))

(declare-fun m!70959 () Bool)

(assert (=> d!13468 m!70959))

(assert (=> d!13468 m!70683))

(assert (=> b!46176 d!13468))

(declare-fun d!13478 () Bool)

(assert (=> d!13478 (= (array_inv!952 srcBuffer!2) (bvsge (size!1030 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!9278 d!13478))

(declare-fun d!13480 () Bool)

(assert (=> d!13480 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2873 thiss!1379) (currentByte!2878 thiss!1379) (size!1030 (buf!1379 thiss!1379))))))

(declare-fun bs!3558 () Bool)

(assert (= bs!3558 d!13480))

(declare-fun m!70963 () Bool)

(assert (=> bs!3558 m!70963))

(assert (=> start!9278 d!13480))

(declare-fun d!13484 () Bool)

(declare-fun res!39215 () Bool)

(declare-fun e!30849 () Bool)

(assert (=> d!13484 (=> (not res!39215) (not e!30849))))

(assert (=> d!13484 (= res!39215 (= (size!1030 (buf!1379 thiss!1379)) (size!1030 (buf!1379 (_2!2337 lt!71106)))))))

(assert (=> d!13484 (= (isPrefixOf!0 thiss!1379 (_2!2337 lt!71106)) e!30849)))

(declare-fun b!46388 () Bool)

(declare-fun res!39214 () Bool)

(assert (=> b!46388 (=> (not res!39214) (not e!30849))))

(assert (=> b!46388 (= res!39214 (bvsle (bitIndex!0 (size!1030 (buf!1379 thiss!1379)) (currentByte!2878 thiss!1379) (currentBit!2873 thiss!1379)) (bitIndex!0 (size!1030 (buf!1379 (_2!2337 lt!71106))) (currentByte!2878 (_2!2337 lt!71106)) (currentBit!2873 (_2!2337 lt!71106)))))))

(declare-fun b!46389 () Bool)

(declare-fun e!30848 () Bool)

(assert (=> b!46389 (= e!30849 e!30848)))

(declare-fun res!39213 () Bool)

(assert (=> b!46389 (=> res!39213 e!30848)))

(assert (=> b!46389 (= res!39213 (= (size!1030 (buf!1379 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!46390 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2284 array!2284 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!46390 (= e!30848 (arrayBitRangesEq!0 (buf!1379 thiss!1379) (buf!1379 (_2!2337 lt!71106)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1030 (buf!1379 thiss!1379)) (currentByte!2878 thiss!1379) (currentBit!2873 thiss!1379))))))

(assert (= (and d!13484 res!39215) b!46388))

(assert (= (and b!46388 res!39214) b!46389))

(assert (= (and b!46389 (not res!39213)) b!46390))

(assert (=> b!46388 m!70657))

(assert (=> b!46388 m!70691))

(assert (=> b!46390 m!70657))

(assert (=> b!46390 m!70657))

(declare-fun m!70969 () Bool)

(assert (=> b!46390 m!70969))

(assert (=> b!46177 d!13484))

(declare-fun d!13490 () Bool)

(assert (=> d!13490 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1030 (buf!1379 (_2!2337 lt!71106)))) ((_ sign_extend 32) (currentByte!2878 (_2!2337 lt!71106))) ((_ sign_extend 32) (currentBit!2873 (_2!2337 lt!71106))) lt!71115) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1030 (buf!1379 (_2!2337 lt!71106)))) ((_ sign_extend 32) (currentByte!2878 (_2!2337 lt!71106))) ((_ sign_extend 32) (currentBit!2873 (_2!2337 lt!71106)))) lt!71115))))

(declare-fun bs!3560 () Bool)

(assert (= bs!3560 d!13490))

(declare-fun m!70971 () Bool)

(assert (=> bs!3560 m!70971))

(assert (=> b!46177 d!13490))

(declare-fun d!13492 () Bool)

(declare-fun e!30852 () Bool)

(assert (=> d!13492 e!30852))

(declare-fun res!39218 () Bool)

(assert (=> d!13492 (=> (not res!39218) (not e!30852))))

(assert (=> d!13492 (= res!39218 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!71401 () Unit!3273)

(declare-fun choose!27 (BitStream!1798 BitStream!1798 (_ BitVec 64) (_ BitVec 64)) Unit!3273)

(assert (=> d!13492 (= lt!71401 (choose!27 thiss!1379 (_2!2337 lt!71106) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!13492 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!13492 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2337 lt!71106) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!71401)))

(declare-fun b!46393 () Bool)

(assert (=> b!46393 (= e!30852 (validate_offset_bits!1 ((_ sign_extend 32) (size!1030 (buf!1379 (_2!2337 lt!71106)))) ((_ sign_extend 32) (currentByte!2878 (_2!2337 lt!71106))) ((_ sign_extend 32) (currentBit!2873 (_2!2337 lt!71106))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!13492 res!39218) b!46393))

(declare-fun m!70973 () Bool)

(assert (=> d!13492 m!70973))

(declare-fun m!70975 () Bool)

(assert (=> b!46393 m!70975))

(assert (=> b!46177 d!13492))

(declare-fun b!46444 () Bool)

(declare-fun res!39268 () Bool)

(declare-fun e!30881 () Bool)

(assert (=> b!46444 (=> (not res!39268) (not e!30881))))

(declare-fun lt!71488 () tuple2!4488)

(assert (=> b!46444 (= res!39268 (= (bitIndex!0 (size!1030 (buf!1379 (_2!2337 lt!71488))) (currentByte!2878 (_2!2337 lt!71488)) (currentBit!2873 (_2!2337 lt!71488))) (bvadd (bitIndex!0 (size!1030 (buf!1379 thiss!1379)) (currentByte!2878 thiss!1379) (currentBit!2873 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!46445 () Bool)

(declare-fun res!39270 () Bool)

(assert (=> b!46445 (=> (not res!39270) (not e!30881))))

(assert (=> b!46445 (= res!39270 (isPrefixOf!0 thiss!1379 (_2!2337 lt!71488)))))

(declare-fun b!46446 () Bool)

(declare-fun res!39267 () Bool)

(declare-fun e!30879 () Bool)

(assert (=> b!46446 (=> (not res!39267) (not e!30879))))

(declare-fun lt!71481 () tuple2!4488)

(assert (=> b!46446 (= res!39267 (isPrefixOf!0 thiss!1379 (_2!2337 lt!71481)))))

(declare-fun b!46447 () Bool)

(declare-fun e!30882 () Bool)

(declare-datatypes ((tuple2!4508 0))(
  ( (tuple2!4509 (_1!2347 BitStream!1798) (_2!2347 Bool)) )
))
(declare-fun lt!71491 () tuple2!4508)

(assert (=> b!46447 (= e!30882 (= (bitIndex!0 (size!1030 (buf!1379 (_1!2347 lt!71491))) (currentByte!2878 (_1!2347 lt!71491)) (currentBit!2873 (_1!2347 lt!71491))) (bitIndex!0 (size!1030 (buf!1379 (_2!2337 lt!71488))) (currentByte!2878 (_2!2337 lt!71488)) (currentBit!2873 (_2!2337 lt!71488)))))))

(declare-fun d!13494 () Bool)

(assert (=> d!13494 e!30879))

(declare-fun res!39271 () Bool)

(assert (=> d!13494 (=> (not res!39271) (not e!30879))))

(assert (=> d!13494 (= res!39271 (= (size!1030 (buf!1379 (_2!2337 lt!71481))) (size!1030 (buf!1379 thiss!1379))))))

(declare-fun lt!71484 () (_ BitVec 8))

(declare-fun lt!71486 () array!2284)

(assert (=> d!13494 (= lt!71484 (select (arr!1547 lt!71486) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!13494 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1030 lt!71486)))))

(assert (=> d!13494 (= lt!71486 (array!2285 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!71485 () tuple2!4488)

(assert (=> d!13494 (= lt!71481 (tuple2!4489 (_1!2337 lt!71485) (_2!2337 lt!71485)))))

(assert (=> d!13494 (= lt!71485 lt!71488)))

(assert (=> d!13494 e!30881))

(declare-fun res!39274 () Bool)

(assert (=> d!13494 (=> (not res!39274) (not e!30881))))

(assert (=> d!13494 (= res!39274 (= (size!1030 (buf!1379 thiss!1379)) (size!1030 (buf!1379 (_2!2337 lt!71488)))))))

(declare-fun lt!71480 () Bool)

(declare-fun appendBit!0 (BitStream!1798 Bool) tuple2!4488)

(assert (=> d!13494 (= lt!71488 (appendBit!0 thiss!1379 lt!71480))))

(assert (=> d!13494 (= lt!71480 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1547 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!13494 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!13494 (= (appendBitFromByte!0 thiss!1379 (select (arr!1547 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!71481)))

(declare-fun b!46448 () Bool)

(declare-fun res!39272 () Bool)

(assert (=> b!46448 (=> (not res!39272) (not e!30879))))

(declare-fun lt!71483 () (_ BitVec 64))

(declare-fun lt!71489 () (_ BitVec 64))

(assert (=> b!46448 (= res!39272 (= (bitIndex!0 (size!1030 (buf!1379 (_2!2337 lt!71481))) (currentByte!2878 (_2!2337 lt!71481)) (currentBit!2873 (_2!2337 lt!71481))) (bvadd lt!71483 lt!71489)))))

(assert (=> b!46448 (or (not (= (bvand lt!71483 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!71489 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!71483 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!71483 lt!71489) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!46448 (= lt!71489 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!46448 (= lt!71483 (bitIndex!0 (size!1030 (buf!1379 thiss!1379)) (currentByte!2878 thiss!1379) (currentBit!2873 thiss!1379)))))

(declare-fun b!46449 () Bool)

(declare-fun e!30880 () Bool)

(assert (=> b!46449 (= e!30879 e!30880)))

(declare-fun res!39273 () Bool)

(assert (=> b!46449 (=> (not res!39273) (not e!30880))))

(declare-fun lt!71482 () tuple2!4508)

(assert (=> b!46449 (= res!39273 (and (= (_2!2347 lt!71482) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1547 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!71484)) #b00000000000000000000000000000000))) (= (_1!2347 lt!71482) (_2!2337 lt!71481))))))

(declare-datatypes ((tuple2!4510 0))(
  ( (tuple2!4511 (_1!2348 array!2284) (_2!2348 BitStream!1798)) )
))
(declare-fun lt!71487 () tuple2!4510)

(declare-fun lt!71490 () BitStream!1798)

(declare-fun readBits!0 (BitStream!1798 (_ BitVec 64)) tuple2!4510)

(assert (=> b!46449 (= lt!71487 (readBits!0 lt!71490 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1798) tuple2!4508)

(assert (=> b!46449 (= lt!71482 (readBitPure!0 lt!71490))))

(declare-fun readerFrom!0 (BitStream!1798 (_ BitVec 32) (_ BitVec 32)) BitStream!1798)

(assert (=> b!46449 (= lt!71490 (readerFrom!0 (_2!2337 lt!71481) (currentBit!2873 thiss!1379) (currentByte!2878 thiss!1379)))))

(declare-fun b!46450 () Bool)

(assert (=> b!46450 (= e!30881 e!30882)))

(declare-fun res!39269 () Bool)

(assert (=> b!46450 (=> (not res!39269) (not e!30882))))

(assert (=> b!46450 (= res!39269 (and (= (_2!2347 lt!71491) lt!71480) (= (_1!2347 lt!71491) (_2!2337 lt!71488))))))

(assert (=> b!46450 (= lt!71491 (readBitPure!0 (readerFrom!0 (_2!2337 lt!71488) (currentBit!2873 thiss!1379) (currentByte!2878 thiss!1379))))))

(declare-fun b!46451 () Bool)

(assert (=> b!46451 (= e!30880 (= (bitIndex!0 (size!1030 (buf!1379 (_1!2347 lt!71482))) (currentByte!2878 (_1!2347 lt!71482)) (currentBit!2873 (_1!2347 lt!71482))) (bitIndex!0 (size!1030 (buf!1379 (_2!2337 lt!71481))) (currentByte!2878 (_2!2337 lt!71481)) (currentBit!2873 (_2!2337 lt!71481)))))))

(assert (= (and d!13494 res!39274) b!46444))

(assert (= (and b!46444 res!39268) b!46445))

(assert (= (and b!46445 res!39270) b!46450))

(assert (= (and b!46450 res!39269) b!46447))

(assert (= (and d!13494 res!39271) b!46448))

(assert (= (and b!46448 res!39272) b!46446))

(assert (= (and b!46446 res!39267) b!46449))

(assert (= (and b!46449 res!39273) b!46451))

(declare-fun m!71019 () Bool)

(assert (=> b!46447 m!71019))

(declare-fun m!71021 () Bool)

(assert (=> b!46447 m!71021))

(declare-fun m!71023 () Bool)

(assert (=> b!46446 m!71023))

(declare-fun m!71025 () Bool)

(assert (=> d!13494 m!71025))

(declare-fun m!71027 () Bool)

(assert (=> d!13494 m!71027))

(declare-fun m!71029 () Bool)

(assert (=> d!13494 m!71029))

(declare-fun m!71031 () Bool)

(assert (=> b!46448 m!71031))

(assert (=> b!46448 m!70657))

(declare-fun m!71033 () Bool)

(assert (=> b!46450 m!71033))

(assert (=> b!46450 m!71033))

(declare-fun m!71035 () Bool)

(assert (=> b!46450 m!71035))

(declare-fun m!71037 () Bool)

(assert (=> b!46449 m!71037))

(declare-fun m!71039 () Bool)

(assert (=> b!46449 m!71039))

(declare-fun m!71041 () Bool)

(assert (=> b!46449 m!71041))

(declare-fun m!71043 () Bool)

(assert (=> b!46445 m!71043))

(assert (=> b!46444 m!71021))

(assert (=> b!46444 m!70657))

(declare-fun m!71045 () Bool)

(assert (=> b!46451 m!71045))

(assert (=> b!46451 m!71031))

(assert (=> b!46177 d!13494))

(declare-fun d!13512 () Bool)

(assert (=> d!13512 (= (invariant!0 (currentBit!2873 (_2!2337 lt!71106)) (currentByte!2878 (_2!2337 lt!71106)) (size!1030 (buf!1379 (_2!2337 lt!71106)))) (and (bvsge (currentBit!2873 (_2!2337 lt!71106)) #b00000000000000000000000000000000) (bvslt (currentBit!2873 (_2!2337 lt!71106)) #b00000000000000000000000000001000) (bvsge (currentByte!2878 (_2!2337 lt!71106)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2878 (_2!2337 lt!71106)) (size!1030 (buf!1379 (_2!2337 lt!71106)))) (and (= (currentBit!2873 (_2!2337 lt!71106)) #b00000000000000000000000000000000) (= (currentByte!2878 (_2!2337 lt!71106)) (size!1030 (buf!1379 (_2!2337 lt!71106))))))))))

(assert (=> b!46178 d!13512))

(declare-fun d!13514 () Bool)

(assert (=> d!13514 (= (invariant!0 (currentBit!2873 (_2!2337 lt!71106)) (currentByte!2878 (_2!2337 lt!71106)) (size!1030 (buf!1379 (_2!2337 lt!71112)))) (and (bvsge (currentBit!2873 (_2!2337 lt!71106)) #b00000000000000000000000000000000) (bvslt (currentBit!2873 (_2!2337 lt!71106)) #b00000000000000000000000000001000) (bvsge (currentByte!2878 (_2!2337 lt!71106)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2878 (_2!2337 lt!71106)) (size!1030 (buf!1379 (_2!2337 lt!71112)))) (and (= (currentBit!2873 (_2!2337 lt!71106)) #b00000000000000000000000000000000) (= (currentByte!2878 (_2!2337 lt!71106)) (size!1030 (buf!1379 (_2!2337 lt!71112))))))))))

(assert (=> b!46180 d!13514))

(declare-fun d!13516 () Bool)

(assert (=> d!13516 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1030 (buf!1379 thiss!1379))) ((_ sign_extend 32) (currentByte!2878 thiss!1379)) ((_ sign_extend 32) (currentBit!2873 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1030 (buf!1379 thiss!1379))) ((_ sign_extend 32) (currentByte!2878 thiss!1379)) ((_ sign_extend 32) (currentBit!2873 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3564 () Bool)

(assert (= bs!3564 d!13516))

(declare-fun m!71047 () Bool)

(assert (=> bs!3564 m!71047))

(assert (=> b!46170 d!13516))

(declare-fun d!13518 () Bool)

(declare-fun res!39277 () Bool)

(declare-fun e!30884 () Bool)

(assert (=> d!13518 (=> (not res!39277) (not e!30884))))

(assert (=> d!13518 (= res!39277 (= (size!1030 (buf!1379 (_2!2337 lt!71106))) (size!1030 (buf!1379 (_2!2337 lt!71112)))))))

(assert (=> d!13518 (= (isPrefixOf!0 (_2!2337 lt!71106) (_2!2337 lt!71112)) e!30884)))

(declare-fun b!46452 () Bool)

(declare-fun res!39276 () Bool)

(assert (=> b!46452 (=> (not res!39276) (not e!30884))))

(assert (=> b!46452 (= res!39276 (bvsle (bitIndex!0 (size!1030 (buf!1379 (_2!2337 lt!71106))) (currentByte!2878 (_2!2337 lt!71106)) (currentBit!2873 (_2!2337 lt!71106))) (bitIndex!0 (size!1030 (buf!1379 (_2!2337 lt!71112))) (currentByte!2878 (_2!2337 lt!71112)) (currentBit!2873 (_2!2337 lt!71112)))))))

(declare-fun b!46453 () Bool)

(declare-fun e!30883 () Bool)

(assert (=> b!46453 (= e!30884 e!30883)))

(declare-fun res!39275 () Bool)

(assert (=> b!46453 (=> res!39275 e!30883)))

(assert (=> b!46453 (= res!39275 (= (size!1030 (buf!1379 (_2!2337 lt!71106))) #b00000000000000000000000000000000))))

(declare-fun b!46454 () Bool)

(assert (=> b!46454 (= e!30883 (arrayBitRangesEq!0 (buf!1379 (_2!2337 lt!71106)) (buf!1379 (_2!2337 lt!71112)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1030 (buf!1379 (_2!2337 lt!71106))) (currentByte!2878 (_2!2337 lt!71106)) (currentBit!2873 (_2!2337 lt!71106)))))))

(assert (= (and d!13518 res!39277) b!46452))

(assert (= (and b!46452 res!39276) b!46453))

(assert (= (and b!46453 (not res!39275)) b!46454))

(assert (=> b!46452 m!70691))

(assert (=> b!46452 m!70707))

(assert (=> b!46454 m!70691))

(assert (=> b!46454 m!70691))

(declare-fun m!71049 () Bool)

(assert (=> b!46454 m!71049))

(assert (=> b!46181 d!13518))

(declare-fun b!46480 () Bool)

(declare-fun e!30896 () Unit!3273)

(declare-fun lt!71601 () Unit!3273)

(assert (=> b!46480 (= e!30896 lt!71601)))

(declare-fun lt!71598 () (_ BitVec 64))

(assert (=> b!46480 (= lt!71598 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!71597 () (_ BitVec 64))

(assert (=> b!46480 (= lt!71597 (bitIndex!0 (size!1030 (buf!1379 thiss!1379)) (currentByte!2878 thiss!1379) (currentBit!2873 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2284 array!2284 (_ BitVec 64) (_ BitVec 64)) Unit!3273)

(assert (=> b!46480 (= lt!71601 (arrayBitRangesEqSymmetric!0 (buf!1379 thiss!1379) (buf!1379 (_2!2337 lt!71106)) lt!71598 lt!71597))))

(assert (=> b!46480 (arrayBitRangesEq!0 (buf!1379 (_2!2337 lt!71106)) (buf!1379 thiss!1379) lt!71598 lt!71597)))

(declare-fun d!13520 () Bool)

(declare-fun e!30895 () Bool)

(assert (=> d!13520 e!30895))

(declare-fun res!39295 () Bool)

(assert (=> d!13520 (=> (not res!39295) (not e!30895))))

(declare-fun lt!71608 () tuple2!4490)

(assert (=> d!13520 (= res!39295 (isPrefixOf!0 (_1!2338 lt!71608) (_2!2338 lt!71608)))))

(declare-fun lt!71602 () BitStream!1798)

(assert (=> d!13520 (= lt!71608 (tuple2!4491 lt!71602 (_2!2337 lt!71106)))))

(declare-fun lt!71605 () Unit!3273)

(declare-fun lt!71595 () Unit!3273)

(assert (=> d!13520 (= lt!71605 lt!71595)))

(assert (=> d!13520 (isPrefixOf!0 lt!71602 (_2!2337 lt!71106))))

(assert (=> d!13520 (= lt!71595 (lemmaIsPrefixTransitive!0 lt!71602 (_2!2337 lt!71106) (_2!2337 lt!71106)))))

(declare-fun lt!71594 () Unit!3273)

(declare-fun lt!71593 () Unit!3273)

(assert (=> d!13520 (= lt!71594 lt!71593)))

(assert (=> d!13520 (isPrefixOf!0 lt!71602 (_2!2337 lt!71106))))

(assert (=> d!13520 (= lt!71593 (lemmaIsPrefixTransitive!0 lt!71602 thiss!1379 (_2!2337 lt!71106)))))

(declare-fun lt!71610 () Unit!3273)

(assert (=> d!13520 (= lt!71610 e!30896)))

(declare-fun c!3120 () Bool)

(assert (=> d!13520 (= c!3120 (not (= (size!1030 (buf!1379 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!71600 () Unit!3273)

(declare-fun lt!71607 () Unit!3273)

(assert (=> d!13520 (= lt!71600 lt!71607)))

(assert (=> d!13520 (isPrefixOf!0 (_2!2337 lt!71106) (_2!2337 lt!71106))))

(assert (=> d!13520 (= lt!71607 (lemmaIsPrefixRefl!0 (_2!2337 lt!71106)))))

(declare-fun lt!71599 () Unit!3273)

(declare-fun lt!71611 () Unit!3273)

(assert (=> d!13520 (= lt!71599 lt!71611)))

(assert (=> d!13520 (= lt!71611 (lemmaIsPrefixRefl!0 (_2!2337 lt!71106)))))

(declare-fun lt!71592 () Unit!3273)

(declare-fun lt!71604 () Unit!3273)

(assert (=> d!13520 (= lt!71592 lt!71604)))

(assert (=> d!13520 (isPrefixOf!0 lt!71602 lt!71602)))

(assert (=> d!13520 (= lt!71604 (lemmaIsPrefixRefl!0 lt!71602))))

(declare-fun lt!71606 () Unit!3273)

(declare-fun lt!71596 () Unit!3273)

(assert (=> d!13520 (= lt!71606 lt!71596)))

(assert (=> d!13520 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!13520 (= lt!71596 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!13520 (= lt!71602 (BitStream!1799 (buf!1379 (_2!2337 lt!71106)) (currentByte!2878 thiss!1379) (currentBit!2873 thiss!1379)))))

(assert (=> d!13520 (isPrefixOf!0 thiss!1379 (_2!2337 lt!71106))))

(assert (=> d!13520 (= (reader!0 thiss!1379 (_2!2337 lt!71106)) lt!71608)))

(declare-fun b!46481 () Bool)

(declare-fun res!39294 () Bool)

(assert (=> b!46481 (=> (not res!39294) (not e!30895))))

(assert (=> b!46481 (= res!39294 (isPrefixOf!0 (_1!2338 lt!71608) thiss!1379))))

(declare-fun lt!71603 () (_ BitVec 64))

(declare-fun b!46482 () Bool)

(declare-fun lt!71609 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1798 (_ BitVec 64)) BitStream!1798)

(assert (=> b!46482 (= e!30895 (= (_1!2338 lt!71608) (withMovedBitIndex!0 (_2!2338 lt!71608) (bvsub lt!71603 lt!71609))))))

(assert (=> b!46482 (or (= (bvand lt!71603 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!71609 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!71603 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!71603 lt!71609) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!46482 (= lt!71609 (bitIndex!0 (size!1030 (buf!1379 (_2!2337 lt!71106))) (currentByte!2878 (_2!2337 lt!71106)) (currentBit!2873 (_2!2337 lt!71106))))))

(assert (=> b!46482 (= lt!71603 (bitIndex!0 (size!1030 (buf!1379 thiss!1379)) (currentByte!2878 thiss!1379) (currentBit!2873 thiss!1379)))))

(declare-fun b!46483 () Bool)

(declare-fun Unit!3289 () Unit!3273)

(assert (=> b!46483 (= e!30896 Unit!3289)))

(declare-fun b!46484 () Bool)

(declare-fun res!39293 () Bool)

(assert (=> b!46484 (=> (not res!39293) (not e!30895))))

(assert (=> b!46484 (= res!39293 (isPrefixOf!0 (_2!2338 lt!71608) (_2!2337 lt!71106)))))

(assert (= (and d!13520 c!3120) b!46480))

(assert (= (and d!13520 (not c!3120)) b!46483))

(assert (= (and d!13520 res!39295) b!46481))

(assert (= (and b!46481 res!39294) b!46484))

(assert (= (and b!46484 res!39293) b!46482))

(declare-fun m!71077 () Bool)

(assert (=> b!46484 m!71077))

(declare-fun m!71079 () Bool)

(assert (=> b!46481 m!71079))

(declare-fun m!71081 () Bool)

(assert (=> b!46482 m!71081))

(assert (=> b!46482 m!70691))

(assert (=> b!46482 m!70657))

(assert (=> d!13520 m!70653))

(assert (=> d!13520 m!70655))

(declare-fun m!71083 () Bool)

(assert (=> d!13520 m!71083))

(declare-fun m!71085 () Bool)

(assert (=> d!13520 m!71085))

(declare-fun m!71087 () Bool)

(assert (=> d!13520 m!71087))

(declare-fun m!71089 () Bool)

(assert (=> d!13520 m!71089))

(declare-fun m!71091 () Bool)

(assert (=> d!13520 m!71091))

(assert (=> d!13520 m!70695))

(declare-fun m!71093 () Bool)

(assert (=> d!13520 m!71093))

(declare-fun m!71095 () Bool)

(assert (=> d!13520 m!71095))

(declare-fun m!71097 () Bool)

(assert (=> d!13520 m!71097))

(assert (=> b!46480 m!70657))

(declare-fun m!71099 () Bool)

(assert (=> b!46480 m!71099))

(declare-fun m!71101 () Bool)

(assert (=> b!46480 m!71101))

(assert (=> b!46181 d!13520))

(declare-fun b!46582 () Bool)

(declare-fun res!39354 () Bool)

(declare-fun e!30939 () Bool)

(assert (=> b!46582 (=> (not res!39354) (not e!30939))))

(declare-fun lt!71995 () tuple2!4488)

(assert (=> b!46582 (= res!39354 (isPrefixOf!0 (_2!2337 lt!71106) (_2!2337 lt!71995)))))

(declare-fun b!46583 () Bool)

(declare-fun res!39352 () Bool)

(assert (=> b!46583 (=> (not res!39352) (not e!30939))))

(assert (=> b!46583 (= res!39352 (= (size!1030 (buf!1379 (_2!2337 lt!71106))) (size!1030 (buf!1379 (_2!2337 lt!71995)))))))

(declare-fun b!46584 () Bool)

(declare-fun lt!72007 () tuple2!4490)

(assert (=> b!46584 (= e!30939 (= (bitStreamReadBitsIntoList!0 (_2!2337 lt!71995) (_1!2338 lt!72007) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2337 lt!71995) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!46584 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!46584 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!72025 () Unit!3273)

(declare-fun lt!72003 () Unit!3273)

(assert (=> b!46584 (= lt!72025 lt!72003)))

(declare-fun lt!71991 () (_ BitVec 64))

(assert (=> b!46584 (validate_offset_bits!1 ((_ sign_extend 32) (size!1030 (buf!1379 (_2!2337 lt!71995)))) ((_ sign_extend 32) (currentByte!2878 (_2!2337 lt!71106))) ((_ sign_extend 32) (currentBit!2873 (_2!2337 lt!71106))) lt!71991)))

(assert (=> b!46584 (= lt!72003 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2337 lt!71106) (buf!1379 (_2!2337 lt!71995)) lt!71991))))

(declare-fun e!30940 () Bool)

(assert (=> b!46584 e!30940))

(declare-fun res!39353 () Bool)

(assert (=> b!46584 (=> (not res!39353) (not e!30940))))

(assert (=> b!46584 (= res!39353 (and (= (size!1030 (buf!1379 (_2!2337 lt!71106))) (size!1030 (buf!1379 (_2!2337 lt!71995)))) (bvsge lt!71991 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!46584 (= lt!71991 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!46584 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!46584 (= lt!72007 (reader!0 (_2!2337 lt!71106) (_2!2337 lt!71995)))))

(declare-fun b!46585 () Bool)

(declare-fun e!30941 () tuple2!4488)

(declare-fun Unit!3290 () Unit!3273)

(assert (=> b!46585 (= e!30941 (tuple2!4489 Unit!3290 (_2!2337 lt!71106)))))

(assert (=> b!46585 (= (size!1030 (buf!1379 (_2!2337 lt!71106))) (size!1030 (buf!1379 (_2!2337 lt!71106))))))

(declare-fun lt!72031 () Unit!3273)

(declare-fun Unit!3291 () Unit!3273)

(assert (=> b!46585 (= lt!72031 Unit!3291)))

(declare-fun call!561 () tuple2!4490)

(declare-fun checkByteArrayBitContent!0 (BitStream!1798 array!2284 array!2284 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!46585 (checkByteArrayBitContent!0 (_2!2337 lt!71106) srcBuffer!2 (_1!2348 (readBits!0 (_1!2338 call!561) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun d!13524 () Bool)

(assert (=> d!13524 e!30939))

(declare-fun res!39351 () Bool)

(assert (=> d!13524 (=> (not res!39351) (not e!30939))))

(declare-fun lt!71999 () (_ BitVec 64))

(assert (=> d!13524 (= res!39351 (= (bitIndex!0 (size!1030 (buf!1379 (_2!2337 lt!71995))) (currentByte!2878 (_2!2337 lt!71995)) (currentBit!2873 (_2!2337 lt!71995))) (bvsub lt!71999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!13524 (or (= (bvand lt!71999 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!71999 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!71999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!72020 () (_ BitVec 64))

(assert (=> d!13524 (= lt!71999 (bvadd lt!72020 to!314))))

(assert (=> d!13524 (or (not (= (bvand lt!72020 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!72020 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!72020 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13524 (= lt!72020 (bitIndex!0 (size!1030 (buf!1379 (_2!2337 lt!71106))) (currentByte!2878 (_2!2337 lt!71106)) (currentBit!2873 (_2!2337 lt!71106))))))

(assert (=> d!13524 (= lt!71995 e!30941)))

(declare-fun c!3143 () Bool)

(assert (=> d!13524 (= c!3143 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!72028 () Unit!3273)

(declare-fun lt!72016 () Unit!3273)

(assert (=> d!13524 (= lt!72028 lt!72016)))

(assert (=> d!13524 (isPrefixOf!0 (_2!2337 lt!71106) (_2!2337 lt!71106))))

(assert (=> d!13524 (= lt!72016 (lemmaIsPrefixRefl!0 (_2!2337 lt!71106)))))

(declare-fun lt!72008 () (_ BitVec 64))

(assert (=> d!13524 (= lt!72008 (bitIndex!0 (size!1030 (buf!1379 (_2!2337 lt!71106))) (currentByte!2878 (_2!2337 lt!71106)) (currentBit!2873 (_2!2337 lt!71106))))))

(assert (=> d!13524 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13524 (= (appendBitsMSBFirstLoop!0 (_2!2337 lt!71106) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!71995)))

(declare-fun b!46586 () Bool)

(declare-fun res!39349 () Bool)

(assert (=> b!46586 (=> (not res!39349) (not e!30939))))

(assert (=> b!46586 (= res!39349 (invariant!0 (currentBit!2873 (_2!2337 lt!71995)) (currentByte!2878 (_2!2337 lt!71995)) (size!1030 (buf!1379 (_2!2337 lt!71995)))))))

(declare-fun b!46587 () Bool)

(declare-fun res!39350 () Bool)

(assert (=> b!46587 (=> (not res!39350) (not e!30939))))

(assert (=> b!46587 (= res!39350 (= (size!1030 (buf!1379 (_2!2337 lt!71995))) (size!1030 (buf!1379 (_2!2337 lt!71106)))))))

(declare-fun lt!72017 () tuple2!4488)

(declare-fun bm!558 () Bool)

(assert (=> bm!558 (= call!561 (reader!0 (_2!2337 lt!71106) (ite c!3143 (_2!2337 lt!72017) (_2!2337 lt!71106))))))

(declare-fun b!46588 () Bool)

(assert (=> b!46588 (= e!30940 (validate_offset_bits!1 ((_ sign_extend 32) (size!1030 (buf!1379 (_2!2337 lt!71106)))) ((_ sign_extend 32) (currentByte!2878 (_2!2337 lt!71106))) ((_ sign_extend 32) (currentBit!2873 (_2!2337 lt!71106))) lt!71991))))

(declare-fun b!46589 () Bool)

(declare-fun lt!72006 () tuple2!4488)

(declare-fun Unit!3292 () Unit!3273)

(assert (=> b!46589 (= e!30941 (tuple2!4489 Unit!3292 (_2!2337 lt!72006)))))

(assert (=> b!46589 (= lt!72017 (appendBitFromByte!0 (_2!2337 lt!71106) (select (arr!1547 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!72010 () (_ BitVec 64))

(assert (=> b!46589 (= lt!72010 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!71994 () (_ BitVec 64))

(assert (=> b!46589 (= lt!71994 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!72011 () Unit!3273)

(assert (=> b!46589 (= lt!72011 (validateOffsetBitsIneqLemma!0 (_2!2337 lt!71106) (_2!2337 lt!72017) lt!72010 lt!71994))))

(assert (=> b!46589 (validate_offset_bits!1 ((_ sign_extend 32) (size!1030 (buf!1379 (_2!2337 lt!72017)))) ((_ sign_extend 32) (currentByte!2878 (_2!2337 lt!72017))) ((_ sign_extend 32) (currentBit!2873 (_2!2337 lt!72017))) (bvsub lt!72010 lt!71994))))

(declare-fun lt!72026 () Unit!3273)

(assert (=> b!46589 (= lt!72026 lt!72011)))

(declare-fun lt!71997 () tuple2!4490)

(assert (=> b!46589 (= lt!71997 call!561)))

(declare-fun lt!72012 () (_ BitVec 64))

(assert (=> b!46589 (= lt!72012 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!72015 () Unit!3273)

(assert (=> b!46589 (= lt!72015 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2337 lt!71106) (buf!1379 (_2!2337 lt!72017)) lt!72012))))

(assert (=> b!46589 (validate_offset_bits!1 ((_ sign_extend 32) (size!1030 (buf!1379 (_2!2337 lt!72017)))) ((_ sign_extend 32) (currentByte!2878 (_2!2337 lt!71106))) ((_ sign_extend 32) (currentBit!2873 (_2!2337 lt!71106))) lt!72012)))

(declare-fun lt!72030 () Unit!3273)

(assert (=> b!46589 (= lt!72030 lt!72015)))

(assert (=> b!46589 (= (head!359 (byteArrayBitContentToList!0 (_2!2337 lt!72017) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!359 (bitStreamReadBitsIntoList!0 (_2!2337 lt!72017) (_1!2338 lt!71997) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!71989 () Unit!3273)

(declare-fun Unit!3293 () Unit!3273)

(assert (=> b!46589 (= lt!71989 Unit!3293)))

(assert (=> b!46589 (= lt!72006 (appendBitsMSBFirstLoop!0 (_2!2337 lt!72017) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!72029 () Unit!3273)

(assert (=> b!46589 (= lt!72029 (lemmaIsPrefixTransitive!0 (_2!2337 lt!71106) (_2!2337 lt!72017) (_2!2337 lt!72006)))))

(assert (=> b!46589 (isPrefixOf!0 (_2!2337 lt!71106) (_2!2337 lt!72006))))

(declare-fun lt!72004 () Unit!3273)

(assert (=> b!46589 (= lt!72004 lt!72029)))

(assert (=> b!46589 (= (size!1030 (buf!1379 (_2!2337 lt!72006))) (size!1030 (buf!1379 (_2!2337 lt!71106))))))

(declare-fun lt!72022 () Unit!3273)

(declare-fun Unit!3294 () Unit!3273)

(assert (=> b!46589 (= lt!72022 Unit!3294)))

(assert (=> b!46589 (= (bitIndex!0 (size!1030 (buf!1379 (_2!2337 lt!72006))) (currentByte!2878 (_2!2337 lt!72006)) (currentBit!2873 (_2!2337 lt!72006))) (bvsub (bvadd (bitIndex!0 (size!1030 (buf!1379 (_2!2337 lt!71106))) (currentByte!2878 (_2!2337 lt!71106)) (currentBit!2873 (_2!2337 lt!71106))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!72021 () Unit!3273)

(declare-fun Unit!3295 () Unit!3273)

(assert (=> b!46589 (= lt!72021 Unit!3295)))

(assert (=> b!46589 (= (bitIndex!0 (size!1030 (buf!1379 (_2!2337 lt!72006))) (currentByte!2878 (_2!2337 lt!72006)) (currentBit!2873 (_2!2337 lt!72006))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1030 (buf!1379 (_2!2337 lt!72017))) (currentByte!2878 (_2!2337 lt!72017)) (currentBit!2873 (_2!2337 lt!72017))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!72009 () Unit!3273)

(declare-fun Unit!3296 () Unit!3273)

(assert (=> b!46589 (= lt!72009 Unit!3296)))

(declare-fun lt!72005 () tuple2!4490)

(assert (=> b!46589 (= lt!72005 (reader!0 (_2!2337 lt!71106) (_2!2337 lt!72006)))))

(declare-fun lt!72000 () (_ BitVec 64))

(assert (=> b!46589 (= lt!72000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!72019 () Unit!3273)

(assert (=> b!46589 (= lt!72019 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2337 lt!71106) (buf!1379 (_2!2337 lt!72006)) lt!72000))))

(assert (=> b!46589 (validate_offset_bits!1 ((_ sign_extend 32) (size!1030 (buf!1379 (_2!2337 lt!72006)))) ((_ sign_extend 32) (currentByte!2878 (_2!2337 lt!71106))) ((_ sign_extend 32) (currentBit!2873 (_2!2337 lt!71106))) lt!72000)))

(declare-fun lt!72018 () Unit!3273)

(assert (=> b!46589 (= lt!72018 lt!72019)))

(declare-fun lt!72024 () tuple2!4490)

(assert (=> b!46589 (= lt!72024 (reader!0 (_2!2337 lt!72017) (_2!2337 lt!72006)))))

(declare-fun lt!71990 () (_ BitVec 64))

(assert (=> b!46589 (= lt!71990 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!72014 () Unit!3273)

(assert (=> b!46589 (= lt!72014 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2337 lt!72017) (buf!1379 (_2!2337 lt!72006)) lt!71990))))

(assert (=> b!46589 (validate_offset_bits!1 ((_ sign_extend 32) (size!1030 (buf!1379 (_2!2337 lt!72006)))) ((_ sign_extend 32) (currentByte!2878 (_2!2337 lt!72017))) ((_ sign_extend 32) (currentBit!2873 (_2!2337 lt!72017))) lt!71990)))

(declare-fun lt!72002 () Unit!3273)

(assert (=> b!46589 (= lt!72002 lt!72014)))

(declare-fun lt!71992 () List!540)

(assert (=> b!46589 (= lt!71992 (byteArrayBitContentToList!0 (_2!2337 lt!72006) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!72013 () List!540)

(assert (=> b!46589 (= lt!72013 (byteArrayBitContentToList!0 (_2!2337 lt!72006) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!71996 () List!540)

(assert (=> b!46589 (= lt!71996 (bitStreamReadBitsIntoList!0 (_2!2337 lt!72006) (_1!2338 lt!72005) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!72001 () List!540)

(assert (=> b!46589 (= lt!72001 (bitStreamReadBitsIntoList!0 (_2!2337 lt!72006) (_1!2338 lt!72024) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!71993 () (_ BitVec 64))

(assert (=> b!46589 (= lt!71993 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!72027 () Unit!3273)

(assert (=> b!46589 (= lt!72027 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2337 lt!72006) (_2!2337 lt!72006) (_1!2338 lt!72005) (_1!2338 lt!72024) lt!71993 lt!71996))))

(assert (=> b!46589 (= (bitStreamReadBitsIntoList!0 (_2!2337 lt!72006) (_1!2338 lt!72024) (bvsub lt!71993 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!226 lt!71996))))

(declare-fun lt!71998 () Unit!3273)

(assert (=> b!46589 (= lt!71998 lt!72027)))

(declare-fun lt!72032 () Unit!3273)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2284 array!2284 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3273)

(assert (=> b!46589 (= lt!72032 (arrayBitRangesEqImpliesEq!0 (buf!1379 (_2!2337 lt!72017)) (buf!1379 (_2!2337 lt!72006)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!72008 (bitIndex!0 (size!1030 (buf!1379 (_2!2337 lt!72017))) (currentByte!2878 (_2!2337 lt!72017)) (currentBit!2873 (_2!2337 lt!72017)))))))

(assert (=> b!46589 (= (bitAt!0 (buf!1379 (_2!2337 lt!72017)) lt!72008) (bitAt!0 (buf!1379 (_2!2337 lt!72006)) lt!72008))))

(declare-fun lt!72023 () Unit!3273)

(assert (=> b!46589 (= lt!72023 lt!72032)))

(assert (= (and d!13524 c!3143) b!46589))

(assert (= (and d!13524 (not c!3143)) b!46585))

(assert (= (or b!46589 b!46585) bm!558))

(assert (= (and d!13524 res!39351) b!46586))

(assert (= (and b!46586 res!39349) b!46583))

(assert (= (and b!46583 res!39352) b!46582))

(assert (= (and b!46582 res!39354) b!46587))

(assert (= (and b!46587 res!39350) b!46584))

(assert (= (and b!46584 res!39353) b!46588))

(declare-fun m!71283 () Bool)

(assert (=> b!46588 m!71283))

(declare-fun m!71285 () Bool)

(assert (=> d!13524 m!71285))

(assert (=> d!13524 m!70691))

(assert (=> d!13524 m!71087))

(assert (=> d!13524 m!71083))

(declare-fun m!71287 () Bool)

(assert (=> b!46584 m!71287))

(declare-fun m!71289 () Bool)

(assert (=> b!46584 m!71289))

(declare-fun m!71291 () Bool)

(assert (=> b!46584 m!71291))

(declare-fun m!71293 () Bool)

(assert (=> b!46584 m!71293))

(declare-fun m!71295 () Bool)

(assert (=> b!46584 m!71295))

(declare-fun m!71297 () Bool)

(assert (=> bm!558 m!71297))

(declare-fun m!71299 () Bool)

(assert (=> b!46585 m!71299))

(declare-fun m!71301 () Bool)

(assert (=> b!46585 m!71301))

(declare-fun m!71303 () Bool)

(assert (=> b!46589 m!71303))

(declare-fun m!71305 () Bool)

(assert (=> b!46589 m!71305))

(declare-fun m!71307 () Bool)

(assert (=> b!46589 m!71307))

(declare-fun m!71309 () Bool)

(assert (=> b!46589 m!71309))

(declare-fun m!71311 () Bool)

(assert (=> b!46589 m!71311))

(assert (=> b!46589 m!71305))

(declare-fun m!71313 () Bool)

(assert (=> b!46589 m!71313))

(declare-fun m!71315 () Bool)

(assert (=> b!46589 m!71315))

(declare-fun m!71317 () Bool)

(assert (=> b!46589 m!71317))

(declare-fun m!71319 () Bool)

(assert (=> b!46589 m!71319))

(declare-fun m!71321 () Bool)

(assert (=> b!46589 m!71321))

(declare-fun m!71323 () Bool)

(assert (=> b!46589 m!71323))

(assert (=> b!46589 m!70691))

(declare-fun m!71325 () Bool)

(assert (=> b!46589 m!71325))

(declare-fun m!71327 () Bool)

(assert (=> b!46589 m!71327))

(declare-fun m!71329 () Bool)

(assert (=> b!46589 m!71329))

(declare-fun m!71331 () Bool)

(assert (=> b!46589 m!71331))

(declare-fun m!71333 () Bool)

(assert (=> b!46589 m!71333))

(assert (=> b!46589 m!71315))

(declare-fun m!71335 () Bool)

(assert (=> b!46589 m!71335))

(assert (=> b!46589 m!71327))

(declare-fun m!71337 () Bool)

(assert (=> b!46589 m!71337))

(declare-fun m!71339 () Bool)

(assert (=> b!46589 m!71339))

(declare-fun m!71341 () Bool)

(assert (=> b!46589 m!71341))

(declare-fun m!71343 () Bool)

(assert (=> b!46589 m!71343))

(declare-fun m!71345 () Bool)

(assert (=> b!46589 m!71345))

(declare-fun m!71347 () Bool)

(assert (=> b!46589 m!71347))

(declare-fun m!71349 () Bool)

(assert (=> b!46589 m!71349))

(declare-fun m!71351 () Bool)

(assert (=> b!46589 m!71351))

(declare-fun m!71353 () Bool)

(assert (=> b!46589 m!71353))

(declare-fun m!71355 () Bool)

(assert (=> b!46589 m!71355))

(assert (=> b!46589 m!71355))

(declare-fun m!71357 () Bool)

(assert (=> b!46589 m!71357))

(declare-fun m!71359 () Bool)

(assert (=> b!46589 m!71359))

(declare-fun m!71361 () Bool)

(assert (=> b!46589 m!71361))

(declare-fun m!71363 () Bool)

(assert (=> b!46589 m!71363))

(declare-fun m!71365 () Bool)

(assert (=> b!46586 m!71365))

(declare-fun m!71367 () Bool)

(assert (=> b!46582 m!71367))

(assert (=> b!46181 d!13524))

(declare-fun d!13572 () Bool)

(assert (=> d!13572 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1030 (buf!1379 (_2!2337 lt!71106)))) ((_ sign_extend 32) (currentByte!2878 thiss!1379)) ((_ sign_extend 32) (currentBit!2873 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1030 (buf!1379 (_2!2337 lt!71106)))) ((_ sign_extend 32) (currentByte!2878 thiss!1379)) ((_ sign_extend 32) (currentBit!2873 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!3573 () Bool)

(assert (= bs!3573 d!13572))

(declare-fun m!71369 () Bool)

(assert (=> bs!3573 m!71369))

(assert (=> b!46181 d!13572))

(declare-fun d!13574 () Bool)

(assert (=> d!13574 (isPrefixOf!0 thiss!1379 (_2!2337 lt!71112))))

(declare-fun lt!72035 () Unit!3273)

(declare-fun choose!30 (BitStream!1798 BitStream!1798 BitStream!1798) Unit!3273)

(assert (=> d!13574 (= lt!72035 (choose!30 thiss!1379 (_2!2337 lt!71106) (_2!2337 lt!71112)))))

(assert (=> d!13574 (isPrefixOf!0 thiss!1379 (_2!2337 lt!71106))))

(assert (=> d!13574 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2337 lt!71106) (_2!2337 lt!71112)) lt!72035)))

(declare-fun bs!3574 () Bool)

(assert (= bs!3574 d!13574))

(assert (=> bs!3574 m!70635))

(declare-fun m!71371 () Bool)

(assert (=> bs!3574 m!71371))

(assert (=> bs!3574 m!70695))

(assert (=> b!46181 d!13574))

(declare-fun d!13576 () Bool)

(assert (=> d!13576 (validate_offset_bits!1 ((_ sign_extend 32) (size!1030 (buf!1379 (_2!2337 lt!71106)))) ((_ sign_extend 32) (currentByte!2878 thiss!1379)) ((_ sign_extend 32) (currentBit!2873 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!72082 () Unit!3273)

(declare-fun choose!9 (BitStream!1798 array!2284 (_ BitVec 64) BitStream!1798) Unit!3273)

(assert (=> d!13576 (= lt!72082 (choose!9 thiss!1379 (buf!1379 (_2!2337 lt!71106)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1799 (buf!1379 (_2!2337 lt!71106)) (currentByte!2878 thiss!1379) (currentBit!2873 thiss!1379))))))

(assert (=> d!13576 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1379 (_2!2337 lt!71106)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!72082)))

(declare-fun bs!3575 () Bool)

(assert (= bs!3575 d!13576))

(assert (=> bs!3575 m!70627))

(declare-fun m!71373 () Bool)

(assert (=> bs!3575 m!71373))

(assert (=> b!46181 d!13576))

(declare-fun d!13578 () Bool)

(declare-fun res!39363 () Bool)

(declare-fun e!30946 () Bool)

(assert (=> d!13578 (=> (not res!39363) (not e!30946))))

(assert (=> d!13578 (= res!39363 (= (size!1030 (buf!1379 thiss!1379)) (size!1030 (buf!1379 (_2!2337 lt!71112)))))))

(assert (=> d!13578 (= (isPrefixOf!0 thiss!1379 (_2!2337 lt!71112)) e!30946)))

(declare-fun b!46598 () Bool)

(declare-fun res!39362 () Bool)

(assert (=> b!46598 (=> (not res!39362) (not e!30946))))

(assert (=> b!46598 (= res!39362 (bvsle (bitIndex!0 (size!1030 (buf!1379 thiss!1379)) (currentByte!2878 thiss!1379) (currentBit!2873 thiss!1379)) (bitIndex!0 (size!1030 (buf!1379 (_2!2337 lt!71112))) (currentByte!2878 (_2!2337 lt!71112)) (currentBit!2873 (_2!2337 lt!71112)))))))

(declare-fun b!46599 () Bool)

(declare-fun e!30945 () Bool)

(assert (=> b!46599 (= e!30946 e!30945)))

(declare-fun res!39361 () Bool)

(assert (=> b!46599 (=> res!39361 e!30945)))

(assert (=> b!46599 (= res!39361 (= (size!1030 (buf!1379 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!46600 () Bool)

(assert (=> b!46600 (= e!30945 (arrayBitRangesEq!0 (buf!1379 thiss!1379) (buf!1379 (_2!2337 lt!71112)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1030 (buf!1379 thiss!1379)) (currentByte!2878 thiss!1379) (currentBit!2873 thiss!1379))))))

(assert (= (and d!13578 res!39363) b!46598))

(assert (= (and b!46598 res!39362) b!46599))

(assert (= (and b!46599 (not res!39361)) b!46600))

(assert (=> b!46598 m!70657))

(assert (=> b!46598 m!70707))

(assert (=> b!46600 m!70657))

(assert (=> b!46600 m!70657))

(declare-fun m!71375 () Bool)

(assert (=> b!46600 m!71375))

(assert (=> b!46181 d!13578))

(declare-fun d!13580 () Bool)

(assert (=> d!13580 (= (array_inv!952 (buf!1379 thiss!1379)) (bvsge (size!1030 (buf!1379 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!46182 d!13580))

(declare-fun d!13582 () Bool)

(assert (=> d!13582 (= (head!359 (byteArrayBitContentToList!0 (_2!2337 lt!71106) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!655 (byteArrayBitContentToList!0 (_2!2337 lt!71106) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!46171 d!13582))

(declare-fun d!13584 () Bool)

(declare-fun c!3147 () Bool)

(assert (=> d!13584 (= c!3147 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!30951 () List!540)

(assert (=> d!13584 (= (byteArrayBitContentToList!0 (_2!2337 lt!71106) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!30951)))

(declare-fun b!46608 () Bool)

(assert (=> b!46608 (= e!30951 Nil!537)))

(declare-fun b!46609 () Bool)

(assert (=> b!46609 (= e!30951 (Cons!536 (not (= (bvand ((_ sign_extend 24) (select (arr!1547 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2337 lt!71106) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!13584 c!3147) b!46608))

(assert (= (and d!13584 (not c!3147)) b!46609))

(assert (=> b!46609 m!70693))

(assert (=> b!46609 m!71029))

(declare-fun m!71467 () Bool)

(assert (=> b!46609 m!71467))

(assert (=> b!46171 d!13584))

(declare-fun d!13592 () Bool)

(assert (=> d!13592 (= (head!359 (bitStreamReadBitsIntoList!0 (_2!2337 lt!71106) (_1!2338 lt!71113) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!655 (bitStreamReadBitsIntoList!0 (_2!2337 lt!71106) (_1!2338 lt!71113) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!46171 d!13592))

(declare-fun b!46626 () Bool)

(declare-fun e!30958 () Bool)

(declare-fun lt!72113 () List!540)

(assert (=> b!46626 (= e!30958 (> (length!235 lt!72113) 0))))

(declare-fun b!46625 () Bool)

(declare-fun isEmpty!135 (List!540) Bool)

(assert (=> b!46625 (= e!30958 (isEmpty!135 lt!72113))))

(declare-fun b!46623 () Bool)

(declare-datatypes ((tuple2!4516 0))(
  ( (tuple2!4517 (_1!2351 List!540) (_2!2351 BitStream!1798)) )
))
(declare-fun e!30959 () tuple2!4516)

(assert (=> b!46623 (= e!30959 (tuple2!4517 Nil!537 (_1!2338 lt!71113)))))

(declare-fun d!13594 () Bool)

(assert (=> d!13594 e!30958))

(declare-fun c!3154 () Bool)

(assert (=> d!13594 (= c!3154 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13594 (= lt!72113 (_1!2351 e!30959))))

(declare-fun c!3153 () Bool)

(assert (=> d!13594 (= c!3153 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13594 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13594 (= (bitStreamReadBitsIntoList!0 (_2!2337 lt!71106) (_1!2338 lt!71113) #b0000000000000000000000000000000000000000000000000000000000000001) lt!72113)))

(declare-fun b!46624 () Bool)

(declare-datatypes ((tuple2!4518 0))(
  ( (tuple2!4519 (_1!2352 Bool) (_2!2352 BitStream!1798)) )
))
(declare-fun lt!72111 () tuple2!4518)

(declare-fun lt!72112 () (_ BitVec 64))

(assert (=> b!46624 (= e!30959 (tuple2!4517 (Cons!536 (_1!2352 lt!72111) (bitStreamReadBitsIntoList!0 (_2!2337 lt!71106) (_2!2352 lt!72111) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!72112))) (_2!2352 lt!72111)))))

(declare-fun readBit!0 (BitStream!1798) tuple2!4518)

(assert (=> b!46624 (= lt!72111 (readBit!0 (_1!2338 lt!71113)))))

(assert (=> b!46624 (= lt!72112 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!13594 c!3153) b!46623))

(assert (= (and d!13594 (not c!3153)) b!46624))

(assert (= (and d!13594 c!3154) b!46625))

(assert (= (and d!13594 (not c!3154)) b!46626))

(declare-fun m!71507 () Bool)

(assert (=> b!46626 m!71507))

(declare-fun m!71509 () Bool)

(assert (=> b!46625 m!71509))

(declare-fun m!71511 () Bool)

(assert (=> b!46624 m!71511))

(declare-fun m!71513 () Bool)

(assert (=> b!46624 m!71513))

(assert (=> b!46171 d!13594))

(declare-fun d!13612 () Bool)

(declare-fun e!30960 () Bool)

(assert (=> d!13612 e!30960))

(declare-fun res!39371 () Bool)

(assert (=> d!13612 (=> (not res!39371) (not e!30960))))

(declare-fun lt!72115 () (_ BitVec 64))

(declare-fun lt!72119 () (_ BitVec 64))

(declare-fun lt!72117 () (_ BitVec 64))

(assert (=> d!13612 (= res!39371 (= lt!72119 (bvsub lt!72115 lt!72117)))))

(assert (=> d!13612 (or (= (bvand lt!72115 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!72117 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!72115 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!72115 lt!72117) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13612 (= lt!72117 (remainingBits!0 ((_ sign_extend 32) (size!1030 (buf!1379 (_2!2337 lt!71106)))) ((_ sign_extend 32) (currentByte!2878 (_2!2337 lt!71106))) ((_ sign_extend 32) (currentBit!2873 (_2!2337 lt!71106)))))))

(declare-fun lt!72118 () (_ BitVec 64))

(declare-fun lt!72114 () (_ BitVec 64))

(assert (=> d!13612 (= lt!72115 (bvmul lt!72118 lt!72114))))

(assert (=> d!13612 (or (= lt!72118 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!72114 (bvsdiv (bvmul lt!72118 lt!72114) lt!72118)))))

(assert (=> d!13612 (= lt!72114 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!13612 (= lt!72118 ((_ sign_extend 32) (size!1030 (buf!1379 (_2!2337 lt!71106)))))))

(assert (=> d!13612 (= lt!72119 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2878 (_2!2337 lt!71106))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2873 (_2!2337 lt!71106)))))))

(assert (=> d!13612 (invariant!0 (currentBit!2873 (_2!2337 lt!71106)) (currentByte!2878 (_2!2337 lt!71106)) (size!1030 (buf!1379 (_2!2337 lt!71106))))))

(assert (=> d!13612 (= (bitIndex!0 (size!1030 (buf!1379 (_2!2337 lt!71106))) (currentByte!2878 (_2!2337 lt!71106)) (currentBit!2873 (_2!2337 lt!71106))) lt!72119)))

(declare-fun b!46627 () Bool)

(declare-fun res!39370 () Bool)

(assert (=> b!46627 (=> (not res!39370) (not e!30960))))

(assert (=> b!46627 (= res!39370 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!72119))))

(declare-fun b!46628 () Bool)

(declare-fun lt!72116 () (_ BitVec 64))

(assert (=> b!46628 (= e!30960 (bvsle lt!72119 (bvmul lt!72116 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!46628 (or (= lt!72116 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!72116 #b0000000000000000000000000000000000000000000000000000000000001000) lt!72116)))))

(assert (=> b!46628 (= lt!72116 ((_ sign_extend 32) (size!1030 (buf!1379 (_2!2337 lt!71106)))))))

(assert (= (and d!13612 res!39371) b!46627))

(assert (= (and b!46627 res!39370) b!46628))

(assert (=> d!13612 m!70971))

(assert (=> d!13612 m!70681))

(assert (=> b!46172 d!13612))

(declare-fun d!13614 () Bool)

(assert (=> d!13614 (= (tail!226 lt!71114) (t!1290 lt!71114))))

(assert (=> b!46183 d!13614))

(declare-fun d!13616 () Bool)

(declare-fun e!30965 () Bool)

(assert (=> d!13616 e!30965))

(declare-fun res!39374 () Bool)

(assert (=> d!13616 (=> (not res!39374) (not e!30965))))

(declare-fun lt!72131 () (_ BitVec 64))

(assert (=> d!13616 (= res!39374 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!72131 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!72131) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!13616 (= lt!72131 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!72130 () Unit!3273)

(declare-fun choose!42 (BitStream!1798 BitStream!1798 BitStream!1798 BitStream!1798 (_ BitVec 64) List!540) Unit!3273)

(assert (=> d!13616 (= lt!72130 (choose!42 (_2!2337 lt!71112) (_2!2337 lt!71112) (_1!2338 lt!71103) (_1!2338 lt!71105) (bvsub to!314 i!635) lt!71114))))

(assert (=> d!13616 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13616 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2337 lt!71112) (_2!2337 lt!71112) (_1!2338 lt!71103) (_1!2338 lt!71105) (bvsub to!314 i!635) lt!71114) lt!72130)))

(declare-fun b!46635 () Bool)

(assert (=> b!46635 (= e!30965 (= (bitStreamReadBitsIntoList!0 (_2!2337 lt!71112) (_1!2338 lt!71105) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!226 lt!71114)))))

(assert (= (and d!13616 res!39374) b!46635))

(declare-fun m!71515 () Bool)

(assert (=> d!13616 m!71515))

(declare-fun m!71517 () Bool)

(assert (=> b!46635 m!71517))

(assert (=> b!46635 m!70677))

(assert (=> b!46183 d!13616))

(declare-fun b!46643 () Bool)

(declare-fun e!30968 () Bool)

(declare-fun lt!72134 () List!540)

(assert (=> b!46643 (= e!30968 (> (length!235 lt!72134) 0))))

(declare-fun b!46642 () Bool)

(assert (=> b!46642 (= e!30968 (isEmpty!135 lt!72134))))

(declare-fun b!46640 () Bool)

(declare-fun e!30969 () tuple2!4516)

(assert (=> b!46640 (= e!30969 (tuple2!4517 Nil!537 (_1!2338 lt!71103)))))

(declare-fun d!13618 () Bool)

(assert (=> d!13618 e!30968))

(declare-fun c!3160 () Bool)

(assert (=> d!13618 (= c!3160 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13618 (= lt!72134 (_1!2351 e!30969))))

(declare-fun c!3159 () Bool)

(assert (=> d!13618 (= c!3159 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13618 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13618 (= (bitStreamReadBitsIntoList!0 (_2!2337 lt!71112) (_1!2338 lt!71103) (bvsub to!314 i!635)) lt!72134)))

(declare-fun lt!72132 () tuple2!4518)

(declare-fun b!46641 () Bool)

(declare-fun lt!72133 () (_ BitVec 64))

(assert (=> b!46641 (= e!30969 (tuple2!4517 (Cons!536 (_1!2352 lt!72132) (bitStreamReadBitsIntoList!0 (_2!2337 lt!71112) (_2!2352 lt!72132) (bvsub (bvsub to!314 i!635) lt!72133))) (_2!2352 lt!72132)))))

(assert (=> b!46641 (= lt!72132 (readBit!0 (_1!2338 lt!71103)))))

(assert (=> b!46641 (= lt!72133 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!13618 c!3159) b!46640))

(assert (= (and d!13618 (not c!3159)) b!46641))

(assert (= (and d!13618 c!3160) b!46642))

(assert (= (and d!13618 (not c!3160)) b!46643))

(declare-fun m!71519 () Bool)

(assert (=> b!46643 m!71519))

(declare-fun m!71521 () Bool)

(assert (=> b!46642 m!71521))

(declare-fun m!71523 () Bool)

(assert (=> b!46641 m!71523))

(declare-fun m!71525 () Bool)

(assert (=> b!46641 m!71525))

(assert (=> b!46184 d!13618))

(declare-fun d!13620 () Bool)

(assert (=> d!13620 (validate_offset_bits!1 ((_ sign_extend 32) (size!1030 (buf!1379 (_2!2337 lt!71112)))) ((_ sign_extend 32) (currentByte!2878 thiss!1379)) ((_ sign_extend 32) (currentBit!2873 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!72135 () Unit!3273)

(assert (=> d!13620 (= lt!72135 (choose!9 thiss!1379 (buf!1379 (_2!2337 lt!71112)) (bvsub to!314 i!635) (BitStream!1799 (buf!1379 (_2!2337 lt!71112)) (currentByte!2878 thiss!1379) (currentBit!2873 thiss!1379))))))

(assert (=> d!13620 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1379 (_2!2337 lt!71112)) (bvsub to!314 i!635)) lt!72135)))

(declare-fun bs!3582 () Bool)

(assert (= bs!3582 d!13620))

(assert (=> bs!3582 m!70671))

(declare-fun m!71527 () Bool)

(assert (=> bs!3582 m!71527))

(assert (=> b!46184 d!13620))

(declare-fun d!13622 () Bool)

(assert (=> d!13622 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1030 (buf!1379 (_2!2337 lt!71112)))) ((_ sign_extend 32) (currentByte!2878 thiss!1379)) ((_ sign_extend 32) (currentBit!2873 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1030 (buf!1379 (_2!2337 lt!71112)))) ((_ sign_extend 32) (currentByte!2878 thiss!1379)) ((_ sign_extend 32) (currentBit!2873 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3583 () Bool)

(assert (= bs!3583 d!13622))

(declare-fun m!71529 () Bool)

(assert (=> bs!3583 m!71529))

(assert (=> b!46184 d!13622))

(declare-fun d!13624 () Bool)

(assert (=> d!13624 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1030 (buf!1379 (_2!2337 lt!71112)))) ((_ sign_extend 32) (currentByte!2878 (_2!2337 lt!71106))) ((_ sign_extend 32) (currentBit!2873 (_2!2337 lt!71106))) lt!71115) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1030 (buf!1379 (_2!2337 lt!71112)))) ((_ sign_extend 32) (currentByte!2878 (_2!2337 lt!71106))) ((_ sign_extend 32) (currentBit!2873 (_2!2337 lt!71106)))) lt!71115))))

(declare-fun bs!3584 () Bool)

(assert (= bs!3584 d!13624))

(declare-fun m!71531 () Bool)

(assert (=> bs!3584 m!71531))

(assert (=> b!46184 d!13624))

(declare-fun b!46647 () Bool)

(declare-fun e!30970 () Bool)

(declare-fun lt!72138 () List!540)

(assert (=> b!46647 (= e!30970 (> (length!235 lt!72138) 0))))

(declare-fun b!46646 () Bool)

(assert (=> b!46646 (= e!30970 (isEmpty!135 lt!72138))))

(declare-fun b!46644 () Bool)

(declare-fun e!30971 () tuple2!4516)

(assert (=> b!46644 (= e!30971 (tuple2!4517 Nil!537 (_1!2338 lt!71105)))))

(declare-fun d!13626 () Bool)

(assert (=> d!13626 e!30970))

(declare-fun c!3162 () Bool)

(assert (=> d!13626 (= c!3162 (= lt!71115 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13626 (= lt!72138 (_1!2351 e!30971))))

(declare-fun c!3161 () Bool)

(assert (=> d!13626 (= c!3161 (= lt!71115 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13626 (bvsge lt!71115 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13626 (= (bitStreamReadBitsIntoList!0 (_2!2337 lt!71112) (_1!2338 lt!71105) lt!71115) lt!72138)))

(declare-fun lt!72137 () (_ BitVec 64))

(declare-fun lt!72136 () tuple2!4518)

(declare-fun b!46645 () Bool)

(assert (=> b!46645 (= e!30971 (tuple2!4517 (Cons!536 (_1!2352 lt!72136) (bitStreamReadBitsIntoList!0 (_2!2337 lt!71112) (_2!2352 lt!72136) (bvsub lt!71115 lt!72137))) (_2!2352 lt!72136)))))

(assert (=> b!46645 (= lt!72136 (readBit!0 (_1!2338 lt!71105)))))

(assert (=> b!46645 (= lt!72137 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!13626 c!3161) b!46644))

(assert (= (and d!13626 (not c!3161)) b!46645))

(assert (= (and d!13626 c!3162) b!46646))

(assert (= (and d!13626 (not c!3162)) b!46647))

(declare-fun m!71533 () Bool)

(assert (=> b!46647 m!71533))

(declare-fun m!71535 () Bool)

(assert (=> b!46646 m!71535))

(declare-fun m!71537 () Bool)

(assert (=> b!46645 m!71537))

(declare-fun m!71539 () Bool)

(assert (=> b!46645 m!71539))

(assert (=> b!46184 d!13626))

(declare-fun d!13628 () Bool)

(assert (=> d!13628 (validate_offset_bits!1 ((_ sign_extend 32) (size!1030 (buf!1379 (_2!2337 lt!71112)))) ((_ sign_extend 32) (currentByte!2878 (_2!2337 lt!71106))) ((_ sign_extend 32) (currentBit!2873 (_2!2337 lt!71106))) lt!71115)))

(declare-fun lt!72142 () Unit!3273)

(assert (=> d!13628 (= lt!72142 (choose!9 (_2!2337 lt!71106) (buf!1379 (_2!2337 lt!71112)) lt!71115 (BitStream!1799 (buf!1379 (_2!2337 lt!71112)) (currentByte!2878 (_2!2337 lt!71106)) (currentBit!2873 (_2!2337 lt!71106)))))))

(assert (=> d!13628 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2337 lt!71106) (buf!1379 (_2!2337 lt!71112)) lt!71115) lt!72142)))

(declare-fun bs!3585 () Bool)

(assert (= bs!3585 d!13628))

(assert (=> bs!3585 m!70667))

(declare-fun m!71549 () Bool)

(assert (=> bs!3585 m!71549))

(assert (=> b!46184 d!13628))

(declare-fun b!46656 () Bool)

(declare-fun e!30977 () Unit!3273)

(declare-fun lt!72155 () Unit!3273)

(assert (=> b!46656 (= e!30977 lt!72155)))

(declare-fun lt!72152 () (_ BitVec 64))

(assert (=> b!46656 (= lt!72152 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72151 () (_ BitVec 64))

(assert (=> b!46656 (= lt!72151 (bitIndex!0 (size!1030 (buf!1379 thiss!1379)) (currentByte!2878 thiss!1379) (currentBit!2873 thiss!1379)))))

(assert (=> b!46656 (= lt!72155 (arrayBitRangesEqSymmetric!0 (buf!1379 thiss!1379) (buf!1379 (_2!2337 lt!71112)) lt!72152 lt!72151))))

(assert (=> b!46656 (arrayBitRangesEq!0 (buf!1379 (_2!2337 lt!71112)) (buf!1379 thiss!1379) lt!72152 lt!72151)))

(declare-fun d!13632 () Bool)

(declare-fun e!30976 () Bool)

(assert (=> d!13632 e!30976))

(declare-fun res!39377 () Bool)

(assert (=> d!13632 (=> (not res!39377) (not e!30976))))

(declare-fun lt!72162 () tuple2!4490)

(assert (=> d!13632 (= res!39377 (isPrefixOf!0 (_1!2338 lt!72162) (_2!2338 lt!72162)))))

(declare-fun lt!72156 () BitStream!1798)

(assert (=> d!13632 (= lt!72162 (tuple2!4491 lt!72156 (_2!2337 lt!71112)))))

(declare-fun lt!72159 () Unit!3273)

(declare-fun lt!72149 () Unit!3273)

(assert (=> d!13632 (= lt!72159 lt!72149)))

(assert (=> d!13632 (isPrefixOf!0 lt!72156 (_2!2337 lt!71112))))

(assert (=> d!13632 (= lt!72149 (lemmaIsPrefixTransitive!0 lt!72156 (_2!2337 lt!71112) (_2!2337 lt!71112)))))

(declare-fun lt!72148 () Unit!3273)

(declare-fun lt!72147 () Unit!3273)

(assert (=> d!13632 (= lt!72148 lt!72147)))

(assert (=> d!13632 (isPrefixOf!0 lt!72156 (_2!2337 lt!71112))))

(assert (=> d!13632 (= lt!72147 (lemmaIsPrefixTransitive!0 lt!72156 thiss!1379 (_2!2337 lt!71112)))))

(declare-fun lt!72164 () Unit!3273)

(assert (=> d!13632 (= lt!72164 e!30977)))

(declare-fun c!3167 () Bool)

(assert (=> d!13632 (= c!3167 (not (= (size!1030 (buf!1379 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!72154 () Unit!3273)

(declare-fun lt!72161 () Unit!3273)

(assert (=> d!13632 (= lt!72154 lt!72161)))

(assert (=> d!13632 (isPrefixOf!0 (_2!2337 lt!71112) (_2!2337 lt!71112))))

(assert (=> d!13632 (= lt!72161 (lemmaIsPrefixRefl!0 (_2!2337 lt!71112)))))

(declare-fun lt!72153 () Unit!3273)

(declare-fun lt!72165 () Unit!3273)

(assert (=> d!13632 (= lt!72153 lt!72165)))

(assert (=> d!13632 (= lt!72165 (lemmaIsPrefixRefl!0 (_2!2337 lt!71112)))))

(declare-fun lt!72146 () Unit!3273)

(declare-fun lt!72158 () Unit!3273)

(assert (=> d!13632 (= lt!72146 lt!72158)))

(assert (=> d!13632 (isPrefixOf!0 lt!72156 lt!72156)))

(assert (=> d!13632 (= lt!72158 (lemmaIsPrefixRefl!0 lt!72156))))

(declare-fun lt!72160 () Unit!3273)

(declare-fun lt!72150 () Unit!3273)

(assert (=> d!13632 (= lt!72160 lt!72150)))

(assert (=> d!13632 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!13632 (= lt!72150 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!13632 (= lt!72156 (BitStream!1799 (buf!1379 (_2!2337 lt!71112)) (currentByte!2878 thiss!1379) (currentBit!2873 thiss!1379)))))

(assert (=> d!13632 (isPrefixOf!0 thiss!1379 (_2!2337 lt!71112))))

(assert (=> d!13632 (= (reader!0 thiss!1379 (_2!2337 lt!71112)) lt!72162)))

(declare-fun b!46657 () Bool)

(declare-fun res!39376 () Bool)

(assert (=> b!46657 (=> (not res!39376) (not e!30976))))

(assert (=> b!46657 (= res!39376 (isPrefixOf!0 (_1!2338 lt!72162) thiss!1379))))

(declare-fun lt!72163 () (_ BitVec 64))

(declare-fun b!46658 () Bool)

(declare-fun lt!72157 () (_ BitVec 64))

(assert (=> b!46658 (= e!30976 (= (_1!2338 lt!72162) (withMovedBitIndex!0 (_2!2338 lt!72162) (bvsub lt!72157 lt!72163))))))

(assert (=> b!46658 (or (= (bvand lt!72157 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!72163 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!72157 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!72157 lt!72163) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!46658 (= lt!72163 (bitIndex!0 (size!1030 (buf!1379 (_2!2337 lt!71112))) (currentByte!2878 (_2!2337 lt!71112)) (currentBit!2873 (_2!2337 lt!71112))))))

(assert (=> b!46658 (= lt!72157 (bitIndex!0 (size!1030 (buf!1379 thiss!1379)) (currentByte!2878 thiss!1379) (currentBit!2873 thiss!1379)))))

(declare-fun b!46659 () Bool)

(declare-fun Unit!3303 () Unit!3273)

(assert (=> b!46659 (= e!30977 Unit!3303)))

(declare-fun b!46660 () Bool)

(declare-fun res!39375 () Bool)

(assert (=> b!46660 (=> (not res!39375) (not e!30976))))

(assert (=> b!46660 (= res!39375 (isPrefixOf!0 (_2!2338 lt!72162) (_2!2337 lt!71112)))))

(assert (= (and d!13632 c!3167) b!46656))

(assert (= (and d!13632 (not c!3167)) b!46659))

(assert (= (and d!13632 res!39377) b!46657))

(assert (= (and b!46657 res!39376) b!46660))

(assert (= (and b!46660 res!39375) b!46658))

(declare-fun m!71559 () Bool)

(assert (=> b!46660 m!71559))

(declare-fun m!71561 () Bool)

(assert (=> b!46657 m!71561))

(declare-fun m!71563 () Bool)

(assert (=> b!46658 m!71563))

(assert (=> b!46658 m!70707))

(assert (=> b!46658 m!70657))

(assert (=> d!13632 m!70653))

(assert (=> d!13632 m!70655))

(declare-fun m!71565 () Bool)

(assert (=> d!13632 m!71565))

(declare-fun m!71567 () Bool)

(assert (=> d!13632 m!71567))

(declare-fun m!71569 () Bool)

(assert (=> d!13632 m!71569))

(declare-fun m!71571 () Bool)

(assert (=> d!13632 m!71571))

(declare-fun m!71573 () Bool)

(assert (=> d!13632 m!71573))

(assert (=> d!13632 m!70635))

(declare-fun m!71575 () Bool)

(assert (=> d!13632 m!71575))

(declare-fun m!71579 () Bool)

(assert (=> d!13632 m!71579))

(declare-fun m!71582 () Bool)

(assert (=> d!13632 m!71582))

(assert (=> b!46656 m!70657))

(declare-fun m!71587 () Bool)

(assert (=> b!46656 m!71587))

(declare-fun m!71589 () Bool)

(assert (=> b!46656 m!71589))

(assert (=> b!46184 d!13632))

(declare-fun b!46666 () Bool)

(declare-fun e!30981 () Unit!3273)

(declare-fun lt!72195 () Unit!3273)

(assert (=> b!46666 (= e!30981 lt!72195)))

(declare-fun lt!72192 () (_ BitVec 64))

(assert (=> b!46666 (= lt!72192 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72191 () (_ BitVec 64))

(assert (=> b!46666 (= lt!72191 (bitIndex!0 (size!1030 (buf!1379 (_2!2337 lt!71106))) (currentByte!2878 (_2!2337 lt!71106)) (currentBit!2873 (_2!2337 lt!71106))))))

(assert (=> b!46666 (= lt!72195 (arrayBitRangesEqSymmetric!0 (buf!1379 (_2!2337 lt!71106)) (buf!1379 (_2!2337 lt!71112)) lt!72192 lt!72191))))

(assert (=> b!46666 (arrayBitRangesEq!0 (buf!1379 (_2!2337 lt!71112)) (buf!1379 (_2!2337 lt!71106)) lt!72192 lt!72191)))

(declare-fun d!13636 () Bool)

(declare-fun e!30980 () Bool)

(assert (=> d!13636 e!30980))

(declare-fun res!39383 () Bool)

(assert (=> d!13636 (=> (not res!39383) (not e!30980))))

(declare-fun lt!72202 () tuple2!4490)

(assert (=> d!13636 (= res!39383 (isPrefixOf!0 (_1!2338 lt!72202) (_2!2338 lt!72202)))))

(declare-fun lt!72196 () BitStream!1798)

(assert (=> d!13636 (= lt!72202 (tuple2!4491 lt!72196 (_2!2337 lt!71112)))))

(declare-fun lt!72199 () Unit!3273)

(declare-fun lt!72189 () Unit!3273)

(assert (=> d!13636 (= lt!72199 lt!72189)))

(assert (=> d!13636 (isPrefixOf!0 lt!72196 (_2!2337 lt!71112))))

(assert (=> d!13636 (= lt!72189 (lemmaIsPrefixTransitive!0 lt!72196 (_2!2337 lt!71112) (_2!2337 lt!71112)))))

(declare-fun lt!72188 () Unit!3273)

(declare-fun lt!72187 () Unit!3273)

(assert (=> d!13636 (= lt!72188 lt!72187)))

(assert (=> d!13636 (isPrefixOf!0 lt!72196 (_2!2337 lt!71112))))

(assert (=> d!13636 (= lt!72187 (lemmaIsPrefixTransitive!0 lt!72196 (_2!2337 lt!71106) (_2!2337 lt!71112)))))

(declare-fun lt!72204 () Unit!3273)

(assert (=> d!13636 (= lt!72204 e!30981)))

(declare-fun c!3169 () Bool)

(assert (=> d!13636 (= c!3169 (not (= (size!1030 (buf!1379 (_2!2337 lt!71106))) #b00000000000000000000000000000000)))))

(declare-fun lt!72194 () Unit!3273)

(declare-fun lt!72201 () Unit!3273)

(assert (=> d!13636 (= lt!72194 lt!72201)))

(assert (=> d!13636 (isPrefixOf!0 (_2!2337 lt!71112) (_2!2337 lt!71112))))

(assert (=> d!13636 (= lt!72201 (lemmaIsPrefixRefl!0 (_2!2337 lt!71112)))))

(declare-fun lt!72193 () Unit!3273)

(declare-fun lt!72205 () Unit!3273)

(assert (=> d!13636 (= lt!72193 lt!72205)))

(assert (=> d!13636 (= lt!72205 (lemmaIsPrefixRefl!0 (_2!2337 lt!71112)))))

(declare-fun lt!72186 () Unit!3273)

(declare-fun lt!72198 () Unit!3273)

(assert (=> d!13636 (= lt!72186 lt!72198)))

(assert (=> d!13636 (isPrefixOf!0 lt!72196 lt!72196)))

(assert (=> d!13636 (= lt!72198 (lemmaIsPrefixRefl!0 lt!72196))))

(declare-fun lt!72200 () Unit!3273)

(declare-fun lt!72190 () Unit!3273)

(assert (=> d!13636 (= lt!72200 lt!72190)))

(assert (=> d!13636 (isPrefixOf!0 (_2!2337 lt!71106) (_2!2337 lt!71106))))

(assert (=> d!13636 (= lt!72190 (lemmaIsPrefixRefl!0 (_2!2337 lt!71106)))))

(assert (=> d!13636 (= lt!72196 (BitStream!1799 (buf!1379 (_2!2337 lt!71112)) (currentByte!2878 (_2!2337 lt!71106)) (currentBit!2873 (_2!2337 lt!71106))))))

(assert (=> d!13636 (isPrefixOf!0 (_2!2337 lt!71106) (_2!2337 lt!71112))))

(assert (=> d!13636 (= (reader!0 (_2!2337 lt!71106) (_2!2337 lt!71112)) lt!72202)))

(declare-fun b!46667 () Bool)

(declare-fun res!39382 () Bool)

(assert (=> b!46667 (=> (not res!39382) (not e!30980))))

(assert (=> b!46667 (= res!39382 (isPrefixOf!0 (_1!2338 lt!72202) (_2!2337 lt!71106)))))

(declare-fun lt!72197 () (_ BitVec 64))

(declare-fun lt!72203 () (_ BitVec 64))

(declare-fun b!46668 () Bool)

(assert (=> b!46668 (= e!30980 (= (_1!2338 lt!72202) (withMovedBitIndex!0 (_2!2338 lt!72202) (bvsub lt!72197 lt!72203))))))

(assert (=> b!46668 (or (= (bvand lt!72197 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!72203 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!72197 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!72197 lt!72203) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!46668 (= lt!72203 (bitIndex!0 (size!1030 (buf!1379 (_2!2337 lt!71112))) (currentByte!2878 (_2!2337 lt!71112)) (currentBit!2873 (_2!2337 lt!71112))))))

(assert (=> b!46668 (= lt!72197 (bitIndex!0 (size!1030 (buf!1379 (_2!2337 lt!71106))) (currentByte!2878 (_2!2337 lt!71106)) (currentBit!2873 (_2!2337 lt!71106))))))

(declare-fun b!46669 () Bool)

(declare-fun Unit!3306 () Unit!3273)

(assert (=> b!46669 (= e!30981 Unit!3306)))

(declare-fun b!46670 () Bool)

(declare-fun res!39381 () Bool)

(assert (=> b!46670 (=> (not res!39381) (not e!30980))))

(assert (=> b!46670 (= res!39381 (isPrefixOf!0 (_2!2338 lt!72202) (_2!2337 lt!71112)))))

(assert (= (and d!13636 c!3169) b!46666))

(assert (= (and d!13636 (not c!3169)) b!46669))

(assert (= (and d!13636 res!39383) b!46667))

(assert (= (and b!46667 res!39382) b!46670))

(assert (= (and b!46670 res!39381) b!46668))

(declare-fun m!71609 () Bool)

(assert (=> b!46670 m!71609))

(declare-fun m!71611 () Bool)

(assert (=> b!46667 m!71611))

(declare-fun m!71613 () Bool)

(assert (=> b!46668 m!71613))

(assert (=> b!46668 m!70707))

(assert (=> b!46668 m!70691))

(assert (=> d!13636 m!71087))

(assert (=> d!13636 m!71083))

(assert (=> d!13636 m!71565))

(declare-fun m!71615 () Bool)

(assert (=> d!13636 m!71615))

(assert (=> d!13636 m!71569))

(declare-fun m!71617 () Bool)

(assert (=> d!13636 m!71617))

(declare-fun m!71619 () Bool)

(assert (=> d!13636 m!71619))

(assert (=> d!13636 m!70631))

(declare-fun m!71621 () Bool)

(assert (=> d!13636 m!71621))

(declare-fun m!71623 () Bool)

(assert (=> d!13636 m!71623))

(declare-fun m!71625 () Bool)

(assert (=> d!13636 m!71625))

(assert (=> b!46666 m!70691))

(declare-fun m!71627 () Bool)

(assert (=> b!46666 m!71627))

(declare-fun m!71629 () Bool)

(assert (=> b!46666 m!71629))

(assert (=> b!46184 d!13636))

(declare-fun d!13644 () Bool)

(declare-fun size!1034 (List!540) Int)

(assert (=> d!13644 (= (length!235 lt!71114) (size!1034 lt!71114))))

(declare-fun bs!3587 () Bool)

(assert (= bs!3587 d!13644))

(declare-fun m!71631 () Bool)

(assert (=> bs!3587 m!71631))

(assert (=> b!46173 d!13644))

(declare-fun d!13646 () Bool)

(assert (=> d!13646 (= (bitAt!0 (buf!1379 (_1!2338 lt!71103)) lt!71110) (not (= (bvand ((_ sign_extend 24) (select (arr!1547 (buf!1379 (_1!2338 lt!71103))) ((_ extract 31 0) (bvsdiv lt!71110 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!71110 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3588 () Bool)

(assert (= bs!3588 d!13646))

(declare-fun m!71633 () Bool)

(assert (=> bs!3588 m!71633))

(declare-fun m!71635 () Bool)

(assert (=> bs!3588 m!71635))

(assert (=> b!46174 d!13646))

(declare-fun d!13648 () Bool)

(assert (=> d!13648 (= (bitAt!0 (buf!1379 (_1!2338 lt!71105)) lt!71110) (not (= (bvand ((_ sign_extend 24) (select (arr!1547 (buf!1379 (_1!2338 lt!71105))) ((_ extract 31 0) (bvsdiv lt!71110 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!71110 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3589 () Bool)

(assert (= bs!3589 d!13648))

(declare-fun m!71637 () Bool)

(assert (=> bs!3589 m!71637))

(assert (=> bs!3589 m!71635))

(assert (=> b!46174 d!13648))

(declare-fun d!13650 () Bool)

(declare-fun res!39386 () Bool)

(declare-fun e!30983 () Bool)

(assert (=> d!13650 (=> (not res!39386) (not e!30983))))

(assert (=> d!13650 (= res!39386 (= (size!1030 (buf!1379 thiss!1379)) (size!1030 (buf!1379 thiss!1379))))))

(assert (=> d!13650 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!30983)))

(declare-fun b!46671 () Bool)

(declare-fun res!39385 () Bool)

(assert (=> b!46671 (=> (not res!39385) (not e!30983))))

(assert (=> b!46671 (= res!39385 (bvsle (bitIndex!0 (size!1030 (buf!1379 thiss!1379)) (currentByte!2878 thiss!1379) (currentBit!2873 thiss!1379)) (bitIndex!0 (size!1030 (buf!1379 thiss!1379)) (currentByte!2878 thiss!1379) (currentBit!2873 thiss!1379))))))

(declare-fun b!46672 () Bool)

(declare-fun e!30982 () Bool)

(assert (=> b!46672 (= e!30983 e!30982)))

(declare-fun res!39384 () Bool)

(assert (=> b!46672 (=> res!39384 e!30982)))

(assert (=> b!46672 (= res!39384 (= (size!1030 (buf!1379 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!46673 () Bool)

(assert (=> b!46673 (= e!30982 (arrayBitRangesEq!0 (buf!1379 thiss!1379) (buf!1379 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1030 (buf!1379 thiss!1379)) (currentByte!2878 thiss!1379) (currentBit!2873 thiss!1379))))))

(assert (= (and d!13650 res!39386) b!46671))

(assert (= (and b!46671 res!39385) b!46672))

(assert (= (and b!46672 (not res!39384)) b!46673))

(assert (=> b!46671 m!70657))

(assert (=> b!46671 m!70657))

(assert (=> b!46673 m!70657))

(assert (=> b!46673 m!70657))

(declare-fun m!71639 () Bool)

(assert (=> b!46673 m!71639))

(assert (=> b!46185 d!13650))

(declare-fun d!13652 () Bool)

(assert (=> d!13652 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!72208 () Unit!3273)

(declare-fun choose!11 (BitStream!1798) Unit!3273)

(assert (=> d!13652 (= lt!72208 (choose!11 thiss!1379))))

(assert (=> d!13652 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!72208)))

(declare-fun bs!3591 () Bool)

(assert (= bs!3591 d!13652))

(assert (=> bs!3591 m!70653))

(declare-fun m!71643 () Bool)

(assert (=> bs!3591 m!71643))

(assert (=> b!46185 d!13652))

(declare-fun d!13658 () Bool)

(declare-fun e!30989 () Bool)

(assert (=> d!13658 e!30989))

(declare-fun res!39388 () Bool)

(assert (=> d!13658 (=> (not res!39388) (not e!30989))))

(declare-fun lt!72217 () (_ BitVec 64))

(declare-fun lt!72215 () (_ BitVec 64))

(declare-fun lt!72213 () (_ BitVec 64))

(assert (=> d!13658 (= res!39388 (= lt!72217 (bvsub lt!72213 lt!72215)))))

(assert (=> d!13658 (or (= (bvand lt!72213 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!72215 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!72213 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!72213 lt!72215) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13658 (= lt!72215 (remainingBits!0 ((_ sign_extend 32) (size!1030 (buf!1379 thiss!1379))) ((_ sign_extend 32) (currentByte!2878 thiss!1379)) ((_ sign_extend 32) (currentBit!2873 thiss!1379))))))

(declare-fun lt!72216 () (_ BitVec 64))

(declare-fun lt!72212 () (_ BitVec 64))

(assert (=> d!13658 (= lt!72213 (bvmul lt!72216 lt!72212))))

(assert (=> d!13658 (or (= lt!72216 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!72212 (bvsdiv (bvmul lt!72216 lt!72212) lt!72216)))))

(assert (=> d!13658 (= lt!72212 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!13658 (= lt!72216 ((_ sign_extend 32) (size!1030 (buf!1379 thiss!1379))))))

(assert (=> d!13658 (= lt!72217 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2878 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2873 thiss!1379))))))

(assert (=> d!13658 (invariant!0 (currentBit!2873 thiss!1379) (currentByte!2878 thiss!1379) (size!1030 (buf!1379 thiss!1379)))))

(assert (=> d!13658 (= (bitIndex!0 (size!1030 (buf!1379 thiss!1379)) (currentByte!2878 thiss!1379) (currentBit!2873 thiss!1379)) lt!72217)))

(declare-fun b!46684 () Bool)

(declare-fun res!39387 () Bool)

(assert (=> b!46684 (=> (not res!39387) (not e!30989))))

(assert (=> b!46684 (= res!39387 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!72217))))

(declare-fun b!46685 () Bool)

(declare-fun lt!72214 () (_ BitVec 64))

(assert (=> b!46685 (= e!30989 (bvsle lt!72217 (bvmul lt!72214 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!46685 (or (= lt!72214 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!72214 #b0000000000000000000000000000000000000000000000000000000000001000) lt!72214)))))

(assert (=> b!46685 (= lt!72214 ((_ sign_extend 32) (size!1030 (buf!1379 thiss!1379))))))

(assert (= (and d!13658 res!39388) b!46684))

(assert (= (and b!46684 res!39387) b!46685))

(assert (=> d!13658 m!71047))

(assert (=> d!13658 m!70963))

(assert (=> b!46185 d!13658))

(push 1)

(assert (not d!13520))

(assert (not b!46393))

(assert (not b!46642))

(assert (not b!46452))

(assert (not b!46448))

(assert (not b!46671))

(assert (not b!46600))

(assert (not d!13622))

(assert (not d!13576))

(assert (not d!13632))

(assert (not b!46585))

(assert (not b!46670))

(assert (not d!13468))

(assert (not b!46451))

(assert (not b!46480))

(assert (not d!13658))

(assert (not d!13652))

(assert (not b!46598))

(assert (not d!13636))

(assert (not b!46589))

(assert (not b!46450))

(assert (not b!46641))

(assert (not b!46481))

(assert (not d!13480))

(assert (not d!13524))

(assert (not b!46584))

(assert (not d!13612))

(assert (not b!46647))

(assert (not b!46646))

(assert (not d!13620))

(assert (not b!46666))

(assert (not b!46447))

(assert (not b!46586))

(assert (not b!46643))

(assert (not b!46667))

(assert (not b!46444))

(assert (not bm!558))

(assert (not d!13572))

(assert (not b!46658))

(assert (not b!46454))

(assert (not b!46660))

(assert (not b!46445))

(assert (not d!13490))

(assert (not b!46668))

(assert (not d!13616))

(assert (not b!46582))

(assert (not b!46446))

(assert (not d!13628))

(assert (not b!46635))

(assert (not b!46624))

(assert (not b!46673))

(assert (not b!46484))

(assert (not b!46609))

(assert (not b!46588))

(assert (not d!13574))

(assert (not d!13644))

(assert (not d!13516))

(assert (not b!46390))

(assert (not b!46625))

(assert (not b!46449))

(assert (not b!46626))

(assert (not b!46482))

(assert (not b!46656))

(assert (not b!46645))

(assert (not b!46388))

(assert (not d!13492))

(assert (not d!13494))

(assert (not d!13624))

(assert (not b!46657))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

