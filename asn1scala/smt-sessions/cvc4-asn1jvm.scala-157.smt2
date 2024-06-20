; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3668 () Bool)

(assert start!3668)

(declare-fun res!14819 () Bool)

(declare-fun e!9983 () Bool)

(assert (=> start!3668 (=> (not res!14819) (not e!9983))))

(declare-datatypes ((A!203 0))(
  ( (A!204 (val!5 Int)) )
))
(declare-datatypes ((OptionMut!4 0))(
  ( (SomeMut!4 (v!353 A!203)) (NoneMut!4) )
))
(declare-fun thiss!1958 () OptionMut!4)

(declare-fun isDefined!5 (OptionMut!4) Bool)

(assert (=> start!3668 (= res!14819 (isDefined!5 thiss!1958))))

(assert (=> start!3668 e!9983))

(declare-fun e!9984 () Bool)

(assert (=> start!3668 e!9984))

(declare-fun b!15979 () Bool)

(assert (=> b!15979 (= e!9983 (not (is-SomeMut!4 thiss!1958)))))

(declare-fun b!15980 () Bool)

(declare-fun tp_is_empty!11 () Bool)

(assert (=> b!15980 (= e!9984 tp_is_empty!11)))

(assert (= (and start!3668 res!14819) b!15979))

(assert (= (and start!3668 (is-SomeMut!4 thiss!1958)) b!15980))

(declare-fun m!22765 () Bool)

(assert (=> start!3668 m!22765))

(push 1)

(assert (not start!3668))

(assert tp_is_empty!11)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

