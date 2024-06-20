; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3664 () Bool)

(assert start!3664)

(declare-fun res!14813 () Bool)

(declare-fun e!9971 () Bool)

(assert (=> start!3664 (=> (not res!14813) (not e!9971))))

(declare-datatypes ((A!199 0))(
  ( (A!200 (val!3 Int)) )
))
(declare-datatypes ((OptionMut!2 0))(
  ( (SomeMut!2 (v!351 A!199)) (NoneMut!2) )
))
(declare-fun thiss!1958 () OptionMut!2)

(declare-fun isDefined!3 (OptionMut!2) Bool)

(assert (=> start!3664 (= res!14813 (isDefined!3 thiss!1958))))

(assert (=> start!3664 e!9971))

(declare-fun e!9972 () Bool)

(assert (=> start!3664 e!9972))

(declare-fun b!15967 () Bool)

(assert (=> b!15967 (= e!9971 (not (is-SomeMut!2 thiss!1958)))))

(declare-fun b!15968 () Bool)

(declare-fun tp_is_empty!7 () Bool)

(assert (=> b!15968 (= e!9972 tp_is_empty!7)))

(assert (= (and start!3664 res!14813) b!15967))

(assert (= (and start!3664 (is-SomeMut!2 thiss!1958)) b!15968))

(declare-fun m!22761 () Bool)

(assert (=> start!3664 m!22761))

(push 1)

(assert (not start!3664))

(assert tp_is_empty!7)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5158 () Bool)

(assert (=> d!5158 (= (isDefined!3 thiss!1958) (is-SomeMut!2 thiss!1958))))

(assert (=> start!3664 d!5158))

(push 1)

(assert tp_is_empty!7)

(check-sat)

